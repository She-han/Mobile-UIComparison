package com.enactor.core.automation.cucumber.plugin;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.FilenameFilter;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.time.Duration;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import org.apache.commons.io.comparator.NameFileComparator;

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
 * @author Affin Ajanthan
 * 
 * A plugin to capture cucumber events to generate a csv output of the test progress.
 * Which contains both the PT number and PASS/FAIL
 * When activated this will produce a csv file per test suite.
 * A helper method is available to concatenate the csv files into one.
 * 
 */

public class PTReporter extends AbstractCucumberReporter implements ConcurrentEventListener {

	private static final String REPORT_PATH = System.getProperty(REPORT_PATH_PROPERTY, "ptReport/") + "csv/";
	private static final String TIMESTAMP = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss").format(new java.util.Date());
	private static final String REPORT_MERGE_PATH = "ptReport/" + TIMESTAMP + ".csv";
	private static final String REPORT_EXTENSION = ".csv";
	private static final String REPORT_FINAL_PATH = System.getProperty(REPORT_PATH_PROPERTY, "ptReport/") ;
	private static final String REPORT_FINAL_NAME = "ptReport/"+ "compare" + ".csv";
	private Path featureReportPath;
	private String featureName;
	private final List<ScenarioDetail> scenarioDetails = new ArrayList<>();
	private static final char CSV_SEPARATOR = ',';
	// See the ScenarioDetail#toCSV method for order of the columns in csv
	private static final String[] HEADER = { "TAGS", "STATUS" };
	private static final String[] HEADER_FOR_COMPARISION = { "TAGS", "STATUS" , "DESCRIPTION" };
	private static final String PASSED_TAG = "PASSED";
	private static final String FAILED_TAG = "FAILED";

	private static Logger logger = Logger.getLogger(PTReporter.class);

	@Override
	public void setEventPublisher(EventPublisher publisher) {
		
		publisher.registerHandlerFor(TestSourceRead.class, this::handleTestSourceRead);
		publisher.registerHandlerFor(TestCaseFinished.class, this::handleCaseFinished);

		publisher.registerHandlerFor(TestRunFinished.class, this::handleTestRunFinished);
	}

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

	public static boolean concatPTCsvExports() {
		logger.log(Logger.LOG_INFORMATION, "Merging the csv reports");
		String absoluteReportPath = Paths.get(REPORT_PATH).toAbsolutePath().toString();
		File Directory = new File("ptReport");
		if (!Directory.exists()) {
			Directory.mkdir();
		}
		final File reportDirectory = new File(absoluteReportPath);
		FilenameFilter filtePTCsvFiles = new FilenameFilter() {
			@Override
			public boolean accept(File dir, String filename) {
				return filename.endsWith(REPORT_EXTENSION);
			}
		};
		// Abort if the directory does not have any csv files
		if (reportDirectory.listFiles(filtePTCsvFiles) == null || reportDirectory.listFiles(filtePTCsvFiles).length == 0) {
			logger.log(Logger.LOG_INFORMATION, "No csv reports found for merging in directory: " + absoluteReportPath);
			return false;
		}
		logger.log(Logger.LOG_INFORMATION,"Found files from the CSV filter");
		// Initialize the report file by writing the header and write lines from
		// filtered files
		CsvWriter writer = new CsvWriter(Paths.get(REPORT_MERGE_PATH).toAbsolutePath().toString());
		try {
			logger.log(Logger.LOG_INFORMATION,"Writing the merged Report to : "+Paths.get(REPORT_MERGE_PATH).toAbsolutePath().toString());
			writer.setDelimiter(CSV_SEPARATOR);
			writer.writeRecord(HEADER);
			for (final File file : reportDirectory.listFiles(filtePTCsvFiles)) {
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
		compareFiles();
		return true;
	}
	
	@SuppressWarnings("unchecked")
	public static boolean compareFiles() {
		logger.log(Logger.LOG_INFORMATION, "Comparing the Reports....!");
		String absoluteReportPath = Paths.get(REPORT_FINAL_PATH).toAbsolutePath().toString();
		final File reportDirectory = new File(absoluteReportPath);
		FilenameFilter filtePTCsvFiles = new FilenameFilter() {
			@Override
			public boolean accept(File dir, String filename) {
				return filename.endsWith(REPORT_EXTENSION);
			}
		};
		// Abort if the directory does not have any csv files
		if (reportDirectory.listFiles(filtePTCsvFiles) == null || reportDirectory.listFiles(filtePTCsvFiles).length == 0) {
			logger.log(Logger.LOG_INFORMATION, "No csv reports found for comparing in directory: " + absoluteReportPath);
			return false;
		}
		else if (reportDirectory.listFiles(filtePTCsvFiles).length < 2) {
			logger.log(Logger.LOG_INFORMATION, "Only one csv report found for comparing in directory: " + absoluteReportPath);
			return false;
		}
		logger.log(Logger.LOG_INFORMATION,"Found files from the CSV filter");
		// Initialize the report file by writing the header and write lines from
		// filtered files
		CsvWriter writer = new CsvWriter(Paths.get(REPORT_FINAL_NAME).toAbsolutePath().toString());
		try {
			logger.log(Logger.LOG_INFORMATION,
					"Writing the merged Report to : " + Paths.get(REPORT_FINAL_NAME).toAbsolutePath().toString());
			writer.setDelimiter(CSV_SEPARATOR);
			writer.writeRecord(HEADER_FOR_COMPARISION);
			File[] files = reportDirectory.listFiles(filtePTCsvFiles);
			//Arrange the files in Descending Order 
			Arrays.sort(files, NameFileComparator.NAME_REVERSE);

			CsvReader newSheet = new CsvReader(new FileReader(files[1]));
			CsvReader previousSheet = new CsvReader(new FileReader(files[2]));

			HashMap<String, String> newListMap = new HashMap<>();
			HashMap<String, String> previousListMap = new HashMap<>();
			//Read the files and added to the Hashmap
			while (newSheet.readRecord()) {
				String[] cells = newSheet.getValues();
				String key = cells[0];
				String value = cells[1];
				newListMap.put(key, value);
			}

			while (previousSheet.readRecord()) {
				String[] cells = previousSheet.getValues();
				String key = cells[0];
				String value = cells[1];
				previousListMap.put(key, value);
			}

			newSheet.close();
			previousSheet.close();
			// Compare the previous file with the Newly generated file
			newListMap.forEach((key, value) -> {
				try {
					if (newListMap.get(key).equals(FAILED_TAG)) {

						if (previousListMap.containsKey(key) && previousListMap.get(key).equals(FAILED_TAG)) {
							String[] record = { key, value, "Already failed in the Previous Execution" };
							writer.writeRecord(record);
						} else if (previousListMap.containsKey(key) && previousListMap.get(key).equals(PASSED_TAG)) {
							String[] record = { key, value,
									"Failed in the Latest Execution but passed in the Previous Execution" };
							writer.writeRecord(record);
						} else if (!previousListMap.containsKey(key)) {
							String[] record = { key, value, "Newly added failed test" };
							writer.writeRecord(record);
						}
					} else if (newListMap.get(key).equals(PASSED_TAG) && !previousListMap.containsKey(key)) {
						String[] record = { key, value, "Newly added passed test" };
						writer.writeRecord(record);
					}
				} catch (IOException e) {
					logger.log(Logger.LOG_ERROR, "Exception while writing to compared csv", e);
					throw new AutomationException("Exception while writing to compared csv", e);
				}
			});
			// Compare the new file with the previous generated file to get the removed test cases
			previousListMap.forEach((key, value) -> {
				try {
					if (!newListMap.containsKey(key)) {
						String[] record = { key, value, "Removed from previous execution" };
						writer.writeRecord(record);
					}
				} catch (IOException e) {
					logger.log(Logger.LOG_ERROR, "Exception while writing to compared csv", e);
					throw new AutomationException("Exception while writing to compared csv", e);
				}
			});

		} catch (IOException e) {
			logger.log(Logger.LOG_ERROR, "Exception while comparing", e);
			throw new AutomationException("Exception while comparing", e);
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

		public void setFeatureName(String featureName) {
			this.featureName = featureName;
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
			return tags == null ? "" : tags[0];
		}

		public void setTags(String[] tags) {
			this.tags = tags;
		}

		public void setExecutionTime(Duration duration) {
			this.executionTimeSeconds = duration.getSeconds();
		}

		public void setStackTrace(Throwable exception) {
			this.stackTrace = exception;
		}

		public void setNoOfSteps(int noOfSteps) {
			this.noOfSteps = noOfSteps;
		}

		public String[] toCSV() {
			String[] csvLine = {this.getTags(), this.getStatus()};
			return csvLine;
		}
	}
}
