#!groovy
// Script to delete an artifact from Artifactory. Requires the username and password of an Artifactory
// user to be provided in the project properties artifactory.username and artifactory.password.
// Based loosely on
// https://github.com/jettro/small-scripts/blob/master/groovy/artifactory/Artifactory.groovy

import groovy.text.SimpleTemplateEngine;
import groovyx.net.http.RESTClient;

// Configuration
def artifactoryUrl = "https://dev.enactor.co.uk";
if (project.properties['artifactory.url']) {
	// Overwrite URL
	artifactoryUrl = project.properties['artifactory.url'];
}

// Only continue if we have a username and password
//println "- Credentials - ${project.properties['artifactory.username']} / ${project.properties['artifactory.password']}"
if (!project.properties['artifactory.username']) {
	println "[ERROR] The property artifactory.username is required but was not provided";
	throw new Exception("The property artifactory.username is required");
} else if (!project.properties['artifactory.password']) {
	println "[ERROR] The property artifactory.password is required but was not provided";
	throw new Exception("The property artifactory.password is required");
}

// Create engine and server
def engine = new SimpleTemplateEngine();
def server = new RESTClient(artifactoryUrl);
server.ignoreSSLIssues()
server.auth.basic project.properties['artifactory.username'], project.properties['artifactory.password'];
server.parser.'application/vnd.org.jfrog.artifactory.storage.FolderInfo+json' = server.parser.'application/json';
server.parser.'application/vnd.org.jfrog.artifactory.repositories.RepositoryDetailsList+json' = server.parser.'application/json';

// CSV of artifact entries in the format groupId:artifactId:version
def removeArtifacts = true;
if (project.properties['remove.artifacts.enabled']) {
	removeArtifacts = project.properties['remove.artifacts.enabled'].toBoolean();
}
def debug = false;
if (project.properties['remove.artifacts.debug']) {
	debug = project.properties['remove.artifacts.debug'].toBoolean();
}
def artifactsArray = project.properties['remove.artifacts'].split(',');
println "[INFO] Deleting Maven artifacts from Artifactory instance '${artifactoryUrl}' using username '${project.properties['artifactory.username']}'";
if (!removeArtifacts) {
	println "[WARNING] RUNNING IN DRY RUN MODE. To disable, explicitly set a Maven property <remove.artifacts.enabled>true</remove.artifacts.enabled> in the Project definition.";
}
if (debug) {
	println "[WARNING] RUNNING IN DEBUG MODE. To disable, remove the Maven property <remove.artifacts.debug>true</remove.artifacts.debug> in the Project definition."
}

if (artifactsArray && artifactsArray.length > 0) {
	artifactsArray.each { artifact ->
		artifact = artifact.trim();
		if (debug) {
			println "[DEBUG] Removing artifact '${artifact}'";
		}
		def itemArray = artifact.split(':');
		if (debug) {
			println "[DEBUG] - Split to '${itemArray}'";
		}
		def groupId = itemArray[0];
		def artifactId = itemArray[1];
		def version = itemArray[2];
		if (debug) {
			println "[DEBUG] - Group ID '${groupId}', Artifact ID '${artifactId}', Version '${version}'";
		}
		removeItem(groupId, artifactId, version, engine, server, artifactoryUrl, removeArtifacts, debug);
	}
	
	println "[INFO] Removed ${artifactsArray.length} artifacts"
} else {
	println "[INFO] No artifacts defined"
}

println "[INFO] Artifact deletion complete"

// Removes an item from artifactory
private def removeItem(groupId, artifactId, version, engine, server, artifactoryUrl, removeArtifacts, debug) {
	def repository = "libs-release-local";
	if (version.endsWith("-SNAPSHOT")) {
		repository = "libs-snapshot-local";
	}
	def groupIdSlashes = groupId.replaceAll("[.]", "/");
	def path = groupIdSlashes + "/" + artifactId + "/" + version;
	if (debug) {
		println "[DEBUG] - Folder: ${path} Repository: ${repository} DELETE";
	}
	def binding = [repository: repository, path: path];
	def template = engine.createTemplate('''/artifactory/$repository/$path''').make(binding);
	def query = template.toString();
	if (debug) {
		println "[DEBUG] - Query: ${query}";
	}
	if (removeArtifacts) {
		println "[INFO] Deleting ${groupId}:${artifactId}:${version} (${artifactoryUrl}${query})";
		try {
			server.delete(path: query);
		} catch (error) {
			println "[ERROR] Error deleting artifact - ${error}";
		}
	} else {
		println "[INFO] (Dry Run) Deleting ${groupId}:${artifactId}:${version} (${artifactoryUrl}${query})";
	}
}
