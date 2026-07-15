package com.enactor.core.automation.cucumber;

import static io.cucumber.core.options.Constants.FEATURES_PROPERTY_NAME;
import static io.cucumber.core.options.Constants.FILTER_TAGS_PROPERTY_NAME;
import static io.cucumber.core.options.Constants.GLUE_PROPERTY_NAME;
import static io.cucumber.core.options.Constants.PLUGIN_PROPERTY_NAME;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.LinkedHashMap;
import java.util.Map;

import org.testng.ITestContext;
import org.testng.Reporter;
import org.testng.annotations.AfterClass;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.DataProvider;
import org.testng.annotations.Test;

import com.enactor.core.TestGroups;

import io.cucumber.core.exception.CucumberException;
import io.cucumber.testng.AbstractTestNGCucumberTests;
import io.cucumber.testng.CucumberOptions;
import io.cucumber.testng.CucumberPropertiesProvider;
import io.cucumber.testng.FeatureWrapper;
import io.cucumber.testng.PickleWrapper;
import io.cucumber.testng.TestNGCucumberRunner;

/**
 * TestNG class that runs the cucumber tests. Note, this will run ALL cucumber
 * features found in the features package matching to the given filters The
 * annotated features and glue paths are used only if there is no glue and
 * feature path supplied in the testNG suite xml
 * 
 * @author leesmith
 * @author Hirantha Bandara
 * @author gayan.kavirathne
 */
@CucumberOptions(features = "test/feature", glue = { "com.enactor.web.stepDefinitions", "com.enactor.retail.pos.stepDefinitions" })
public class RunCucumberTests extends AbstractTestNGCucumberTests {
	
	private ITestContext context;

	private TestNGCucumberRunner testNGCucumberRunner;

	@BeforeTest(alwaysRun = true)
	public void beforeTest(ITestContext context) {
		this.context = context;
	}

	@Override
	@BeforeClass(alwaysRun = true)
	public void setUpClass(ITestContext context) {
	    this.context = context;
		this.testNGCucumberRunner = new TestNGCucumberRunner(this.getClass(), this.getAdditionalOptions());
	}

	@Override
	@DataProvider(parallel = false)
	public Object[][] scenarios() {
		return testNGCucumberRunner.provideScenarios();

	}

	@Override
	@Test(groups = { TestGroups.NIGHTLY, TestGroups.UITEST }, description = "Run Cucumber Features.", dataProvider = "scenarios")
	public void runScenario(PickleWrapper pickleWrapper, FeatureWrapper featureWrapper) {
		Reporter.log(String.join(", ", pickleWrapper.getPickle().getTags()));
		testNGCucumberRunner.runScenario(pickleWrapper.getPickle());
	}

	@AfterClass(alwaysRun = true)
	public void tearDownClass() {
		testNGCucumberRunner.finish();
	}
	
	public CucumberPropertiesProvider getAdditionalOptions() {
		Map<String, String> otherOptions = new LinkedHashMap<>();
		// The test name is a default feature path

		String featurePaths = this.context.getCurrentXmlTest().getParameter("featurePaths");
		String gluePaths = this.context.getCurrentXmlTest().getParameter("gluePaths");
		otherOptions.put(GLUE_PROPERTY_NAME, gluePaths);
		otherOptions.put(FEATURES_PROPERTY_NAME, featurePaths);

		// setting the additional filters from file
		String tagsFileName = this.context.getCurrentXmlTest().getParameter("tagsFileName");
		if(tagsFileName != null) {
			otherOptions.put(FILTER_TAGS_PROPERTY_NAME, getContentFromExternalFile(tagsFileName));
		}

		// setting the progress filter
		boolean showProgress = "true"
				.equalsIgnoreCase(this.context.getCurrentXmlTest().getParameter("progress"));
		if (showProgress) {
			otherOptions.put(PLUGIN_PROPERTY_NAME, "com.enactor.core.automation.cucumber.plugin.CucumberProgressReporter");
		}

		// setting all the parameters from testNG file, valid cucumber options will be
		// picked by property parser
		otherOptions.putAll(this.context.getCurrentXmlTest().getAllParameters());
		return otherOptions::get;
	}

	public String getContentFromExternalFile(String tagsFileName) {
		String content = "";
		try {
			Path path = Paths.get(tagsFileName);
			if (Files.exists(path)) {
				content = new String(Files.readAllBytes(path));
			}
		} catch (Exception e) {
			throw new CucumberException("IO Exception occured while reading the file.", e);
		}
		return content;
	}
}
