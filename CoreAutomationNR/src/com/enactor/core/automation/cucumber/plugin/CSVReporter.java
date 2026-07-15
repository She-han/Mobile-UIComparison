package com.enactor.core.automation.cucumber.plugin;

import java.io.File;
import java.io.FileReader;
import java.io.FilenameFilter;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.Duration;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.csvreader.CsvReader;
import com.csvreader.CsvWriter;
import com.enactor.core.automation.AUT.AutomationException;
import com.enactor.core.utilities.Logger;

import io.cucumber.plugin.ConcurrentEventListener;
import io.cucumber.plugin.event.EventPublisher;
import io.cucumber.plugin.event.Status;
import io.cucumber.plugin.event.TestCase;
import io.cucumber.plugin.event.TestCaseFinished;
import io.cucumber.plugin.event.TestRunFinished;
import io.cucumber.plugin.event.TestSourceRead;

/**
 * @author Gayan Kavirathne
 * 
 * A plugin to capture cucumber events to generate a csv output of the test progress.
 * When activated this will produce a csv file per test suite.
 * A helper method is available to concatenate the csv files into one.
 * 
 */
public class CSVReporter extends AbstractCucumberReporter implements ConcurrentEventListener {

	private static final String REPORT_PATH = System.getProperty(REPORT_PATH_PROPERTY, "target/cucumber/cucumber-parallel/") + "csv/";
	private static final String REPORT_MERGE_PATH = "target/report.csv";
	private static final String REPORT_EXTENSION = ".csv";
	private Path featureReportPath;
	private String featureName;
	private final List<ScenarioDetail> scenarioDetails = new ArrayList<>();
	private static final char CSV_SEPARATOR = ',';
	// See the ScenarioDetail#toCSV method for order of the columns in csv
	private static final String[] header = { "FEATURE", "SCENARIO", "STATUS", "TAGS", "NO_OF_STEPS", "EXECUTION_TIME",
			"STACK_TRACE" };

	private static Logger logger = Logger.getLogger(CSVReporter.class);

	public void setEventPublisher(EventPublisher publisher) {
		
		publisher.registerHandlerFor(TestSourceRead.class, this::handleTestSourceRead);
		publisher.registerHandlerFor(TestCaseFinished.class, this::handleCaseFinished);

		publisher.registerHandlerFor(TestRunFinished.class, this::handleTestRunFinished);
	}

	@Override
	protected void handleTestSourceRead(TestSourceRead event) {
		this.featureName = super.getFeatureName(event);
		String uniqueFileName = String.format("%s%s", featureName, REPORT_EXTENSION);
		this.featureReportPath = Paths.get(REPORT_PATH, uniqueFileName);
		File reportDirectory = new File(REPORT_PATH);
		if (!reportDirectory.exists()) {
			reportDirectory.mkdir();
		}
	}

	@Override
	protected void handleTestRunFinished(TestRunFinished event) {

		if (!scenarioDetails.isEmpty()) {
			CsvWriter writer = new CsvWriter(featureReportPath.toAbsolutePath().toString());
			try {
				for (ScenarioDetail scenarioDetail : scenarioDetails) {
					writer.writeRecord(scenarioDetail.toCSV());
				}
			} catch (IOException e) {
				logger.log(Logger.LOG_ERROR, "Exception while exporting csv", e);
				throw new AutomationException("Exception while exporting csv", e);
			} finally {
				writer.close();
			}
		}
	}

	@Override
	protected void handleCaseFinished(TestCaseFinished event) {
		TestCase testCase = event.getTestCase();
		ScenarioDetail scenarioDetail = new ScenarioDetail();
		scenarioDetail.setFeatureName(featureName);
		scenarioDetail.setScenarioName(testCase.getName());
		scenarioDetail.setStatus(event.getResult().getStatus());
		scenarioDetail.setExecutionTime(event.getResult().getDuration());
		scenarioDetail.setNoOfSteps(testCase.getTestSteps().size());
		scenarioDetail.setTags(testCase.getTags().toArray(new String[testCase.getTags().size()]));
		Throwable exception = event.getResult().getError();
		if (exception != null) {
			scenarioDetail.setStackTrace(exception);
		}
		scenarioDetails.add(scenarioDetail);

	}

	public static boolean concatCsvExports() {
		logger.log(Logger.LOG_INFORMATION, "Merging the csv reports");
		String absoluteReportPath = Paths.get(REPORT_PATH).toAbsolutePath().toString();
		final File reportDirectory = new File(absoluteReportPath);
		FilenameFilter filteCsvFiles = new FilenameFilter() {

			@Override
			public boolean accept(File dir, String filename) {
				return filename.endsWith(REPORT_EXTENSION);
			}
		};
		// Abort if the directory does not have any csv files
		if (reportDirectory.listFiles(filteCsvFiles) == null || reportDirectory.listFiles(filteCsvFiles).length == 0) {
			logger.log(Logger.LOG_INFORMATION, "No csv reports found for merging in directory: " + absoluteReportPath);
			return false;
		}
		System.out.println("Found files from the CSV filter");
		// Initialize the report file by writing the header and write lines from
		// filtered files
		CsvWriter writer = new CsvWriter(Paths.get(REPORT_MERGE_PATH).toAbsolutePath().toString());
		try {
			logger.log(Logger.LOG_INFORMATION,"Writing the merged Report to : "+Paths.get(REPORT_MERGE_PATH).toAbsolutePath().toString());
			writer.setDelimiter(CSV_SEPARATOR);
			writer.writeRecord(header);
			for (final File file : reportDirectory.listFiles(filteCsvFiles)) {
				CsvReader reader = new CsvReader(new FileReader(file));
				try {
					logger.log(Logger.LOG_INFORMATION, "Concatenating the file: " + file.getAbsolutePath());
					while (reader.readRecord()) {
						writer.writeRecord(reader.getValues());
						
					}
				} catch (IOException e) {
					logger.log(Logger.LOG_ERROR, "Exception while reading exported csv", e);
					throw new AutomationException("Exception while reading exported csv", e);
				} finally {
					reader.close();
				}
			}
		} catch (IOException e) {
			logger.log(Logger.LOG_ERROR, "Exception while writing to concatenated csv", e);
			throw new AutomationException("Exception while writing to concatenated csv", e);
		} finally {
			writer.close();
		}
		return true;
	}

	private class ScenarioDetail {
		private String featureName;
		private String scenarioName;
		private String status;
		private String[] tags;
		private int noOfSteps;
		private long executionTimeSeconds;
		private Throwable stackTrace;

		public String getFeatureName() {
			return featureName == null ? "" : featureName;
		}

		public void setFeatureName(String featureName) {
			this.featureName = featureName;
		}

		public String getScenarioName() {
			return scenarioName == null ? "" : scenarioName;
		}

		public void setScenarioName(String scenarioName) {
			this.scenarioName = scenarioName;
		}

		public String getStatus() {
			return status == null ? "" : status;
		}

		public void setStatus(Status status) {
			this.status = status.toString();
		}

		public String getTags() {
			return tags == null ? "" : Arrays.toString(tags).replace("[", "").replace("]", "");
		}

		public void setTags(String[] tags) {
			this.tags = tags;
		}

		public long getExecutionTime() {
			return executionTimeSeconds;
		}

		public void setExecutionTime(Duration duration) {
			this.executionTimeSeconds = duration.getSeconds();
		}

		public String getStackTrace() {
			return stackTrace == null ? "" : stackTrace.toString();
		}

		public void setStackTrace(Throwable exception) {
			this.stackTrace = exception;
		}

		public int getNoOfSteps() {
			return noOfSteps;
		}

		public void setNoOfSteps(int noOfSteps) {
			this.noOfSteps = noOfSteps;
		}

		public String[] toCSV() {
			String[] csvLine = { this.getFeatureName(), this.getScenarioName(), this.getStatus(), this.getTags(),
					String.valueOf(this.getNoOfSteps()), String.valueOf(this.getExecutionTime()),
					this.getStackTrace() };
			return csvLine;
		}
	}
}
