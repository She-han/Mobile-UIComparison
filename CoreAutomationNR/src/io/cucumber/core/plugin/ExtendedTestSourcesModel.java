package io.cucumber.core.plugin;

import io.cucumber.core.gherkin.FeatureParserException;
import io.cucumber.messages.types.Envelope;
import io.cucumber.messages.types.GherkinDocument;
import io.cucumber.messages.types.Source;
import io.cucumber.messages.types.SourceMediaType;
import io.cucumber.messages.types.Feature;
import io.cucumber.messages.types.Background;
import io.cucumber.messages.types.FeatureChild;
import io.cucumber.messages.types.RuleChild;
import io.cucumber.messages.types.Scenario;
import io.cucumber.messages.types.Examples;
import io.cucumber.messages.types.Step;
import io.cucumber.messages.types.TableRow;
import io.cucumber.plugin.event.TestSourceRead;
import io.cucumber.gherkin.GherkinParser;

import java.io.File;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.Callable;
import java.util.stream.Collectors;

/**
 * This class is directly taken from
 * {@link io.cucumber.core.plugin.TestSourcesModel} And then made the protected
 * fields public so json formatter can access Updated for Cucumber 7.11.1
 * compatibility
 * 
 * @author gayan.kavirathne
 */
public class ExtendedTestSourcesModel {

	private final Map<URI, TestSourceRead> pathToReadEventMap = new HashMap<>();
	private final Map<URI, GherkinDocument> pathToAstMap = new HashMap<>();
	private final Map<URI, Map<Integer, AstNode>> pathToNodeMap = new HashMap<>();

	public static Scenario getScenarioDefinition(AstNode astNode) {
		AstNode candidate = astNode;
		while (candidate != null && !(candidate.node instanceof Scenario)) {
			candidate = candidate.parent;
		}
		return candidate == null ? null : (Scenario) candidate.node;
	}

	public static boolean isBackgroundStep(AstNode astNode) {
		return astNode.parent.node instanceof Background;
	}

	public static String calculateId(AstNode astNode) {
		Object node = astNode.node;
		if (node instanceof Scenario) {
			return calculateId(astNode.parent) + ";" + convertToId(((Scenario) node).getName());
		}
		if (node instanceof ExamplesRowWrapperNode) {
			return calculateId(astNode.parent) + ";" + (((ExamplesRowWrapperNode) node).bodyRowIndex + 2);
		}
		if (node instanceof TableRow) {
			return calculateId(astNode.parent) + ";" + 1;
		}
		if (node instanceof Examples) {
			return calculateId(astNode.parent) + ";" + convertToId(((Examples) node).getName());
		}
		if (node instanceof Feature) {
			return convertToId(((Feature) node).getName());
		}
		return "";
	}

	public static String convertToId(String name) {
		return name.replaceAll("[\\s'_,!]", "-").toLowerCase();
	}

	public static URI relativize(URI uri) {
		if (!"file".equals(uri.getScheme())) {
			return uri;
		}
		if (!uri.isAbsolute()) {
			return uri;
		}

		try {
			URI root = new File("").toURI();
			URI relative = root.relativize(uri);
			// Scheme is lost by relativize
			return new URI("file", relative.getSchemeSpecificPart(), relative.getFragment());
		} catch (URISyntaxException e) {
			throw new IllegalArgumentException(e.getMessage(), e);
		}
	}

	public void addTestSourceReadEvent(URI path, TestSourceRead event) {
		pathToReadEventMap.put(path, event);
	}

	public Feature getFeature(URI path) {
		if (!pathToAstMap.containsKey(path)) {
			parseGherkinSource(path);
		}
		if (pathToAstMap.containsKey(path)) {
			return pathToAstMap.get(path).getFeature().orElse(null);
		}
		return null;
	}

	private void parseGherkinSource(URI path) {
		if (!pathToReadEventMap.containsKey(path)) {
			return;
		}
		String source = pathToReadEventMap.get(path).getSource();

		try {
			Source sourceMessage = new Source(path.toString(), source, SourceMediaType.TEXT_X_CUCUMBER_GHERKIN_PLAIN);

			GherkinParser parser = GherkinParser.builder().idGenerator(() -> UUID.randomUUID().toString())
					.includeSource(true).includeGherkinDocument(true).includePickles(false).build();

			Envelope envelope = Envelope.of(sourceMessage);
			List<Envelope> envelopes = parser.parse(envelope).collect(Collectors.toList());

			// Find the GherkinDocument
			GherkinDocument gherkinDocument = null;
			for (Envelope env : envelopes) {
				if (env.getGherkinDocument().isPresent()) {
					gherkinDocument = env.getGherkinDocument().get();
					break;
				}
			}

			if (gherkinDocument != null && gherkinDocument.getFeature().isPresent()) {
				pathToAstMap.put(path, gherkinDocument);

				// Build node map
				Map<Integer, AstNode> nodeMap = new HashMap<>();
				Feature feature = gherkinDocument.getFeature().get();
				AstNode currentParent = new AstNode(feature, null);

				for (FeatureChild child : feature.getChildren()) {
					processFeatureDefinition(nodeMap, child, currentParent);
				}
				pathToNodeMap.put(path, nodeMap);
			}

		} catch (Exception e) {
			throw new FeatureParserException("Failed to parse feature file: " + path, e);
		}
	}

	private void processFeatureDefinition(Map<Integer, AstNode> nodeMap, FeatureChild child, AstNode currentParent) {
		if (child.getBackground().isPresent()) {
			processBackgroundDefinition(nodeMap, child.getBackground().get(), currentParent);
		} else if (child.getScenario().isPresent()) {
			processScenarioDefinition(nodeMap, child.getScenario().get(), currentParent);
		} else if (child.getRule().isPresent()) {
			AstNode childNode = new AstNode(child.getRule().get(), currentParent);
			nodeMap.put(child.getRule().get().getLocation().getLine().intValue(), childNode);
			for (RuleChild ruleChild : child.getRule().get().getChildren()) {
				processRuleDefinition(nodeMap, ruleChild, childNode);
			}
		}
	}

	private void processBackgroundDefinition(Map<Integer, AstNode> nodeMap, Background background,
			AstNode currentParent) {
		AstNode childNode = new AstNode(background, currentParent);
		nodeMap.put(background.getLocation().getLine().intValue(), childNode);
		for (Step step : background.getSteps()) {
			nodeMap.put(step.getLocation().getLine().intValue(), new AstNode(step, childNode));
		}
	}

	private void processScenarioDefinition(Map<Integer, AstNode> nodeMap, Scenario child, AstNode currentParent) {
		AstNode childNode = new AstNode(child, currentParent);
		nodeMap.put(child.getLocation().getLine().intValue(), childNode);
		for (Step step : child.getSteps()) {
			nodeMap.put(step.getLocation().getLine().intValue(), new AstNode(step, childNode));
		}
		if (!child.getExamples().isEmpty()) {
			processScenarioOutlineExamples(nodeMap, child, childNode);
		}
	}

	private void processRuleDefinition(Map<Integer, AstNode> nodeMap, RuleChild child, AstNode currentParent) {
		if (child.getBackground().isPresent()) {
			processBackgroundDefinition(nodeMap, child.getBackground().get(), currentParent);
		} else if (child.getScenario().isPresent()) {
			processScenarioDefinition(nodeMap, child.getScenario().get(), currentParent);
		}
	}

	private void processScenarioOutlineExamples(Map<Integer, AstNode> nodeMap, Scenario scenarioOutline,
			AstNode parent) {
		for (Examples examples : scenarioOutline.getExamples()) {
			AstNode examplesNode = new AstNode(examples, parent);
			if (examples.getTableHeader().isPresent()) {
				TableRow headerRow = examples.getTableHeader().get();
				AstNode headerNode = new AstNode(headerRow, examplesNode);
				nodeMap.put(headerRow.getLocation().getLine().intValue(), headerNode);
			}

			List<TableRow> tableBody = examples.getTableBody();
			for (int i = 0; i < tableBody.size(); ++i) {
				TableRow examplesRow = tableBody.get(i);
				ExamplesRowWrapperNode rowNode = new ExamplesRowWrapperNode(examplesRow, i);
				AstNode expandedScenarioNode = new AstNode(rowNode, examplesNode);
				nodeMap.put(examplesRow.getLocation().getLine().intValue(), expandedScenarioNode);
			}
		}
	}

	public AstNode getAstNode(URI path, int line) {
		if (!pathToNodeMap.containsKey(path)) {
			parseGherkinSource(path);
		}
		if (pathToNodeMap.containsKey(path)) {
			return pathToNodeMap.get(path).get(line);
		}
		return null;
	}

	public boolean hasBackground(URI path, int line) {
		if (!pathToNodeMap.containsKey(path)) {
			parseGherkinSource(path);
		}
		if (pathToNodeMap.containsKey(path)) {
			AstNode astNode = pathToNodeMap.get(path).get(line);
			return getBackgroundForTestCase(astNode) != null;
		}
		return false;
	}

	public static Background getBackgroundForTestCase(AstNode astNode) {
		Feature feature = getFeatureForTestCase(astNode);
		Background background = null;

		// Get the background from first child
		// TODO : JDK-1.8-Compatibility, convert to map and filter using steam
		for (FeatureChild child : feature.getChildren()) {
			if (child.getBackground().isPresent()) {
				return child.getBackground().get();
			}
		}
		return background;
	}

	private static Feature getFeatureForTestCase(AstNode astNode) {
		while (astNode.parent != null) {
			astNode = astNode.parent;
		}
		return (Feature) astNode.node;
	}

	public static class ExamplesRowWrapperNode {
		public final int bodyRowIndex;
		public final TableRow examplesRow;

		ExamplesRowWrapperNode(TableRow examplesRow, int bodyRowIndex) {
			this.examplesRow = examplesRow;
			this.bodyRowIndex = bodyRowIndex;
		}
	}

	public static class AstNode {
		public final Object node;
		public final AstNode parent;

		AstNode(Object node, AstNode parent) {
			this.node = node;
			this.parent = parent;
		}
		
	}
	
}