package com.enactor.pos.mobile.visual;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.Base64;
import java.util.List;

/**
 * Thin HTTP client for the DINOv2 {@code /compare} endpoint. It Base64-encodes a baseline/actual PNG
 * pair (plus any tracked crop regions), POSTs the JSON payload, and returns a parsed
 * {@link DinoComparisonResult}.
 *
 * <p>Implemented with the JDK's {@link HttpURLConnection} and {@link Base64} only — no third-party
 * HTTP or JSON dependency — so it compiles cleanly against this Java 8 module. The socket read
 * timeout is generous because the server performs GPU/CPU model inference per request.</p>
 *
 * @author Visual Regression Subsystem
 */
public final class DinoServerClient {

	private static final int CONNECT_TIMEOUT_MS = 10_000;
	private static final int READ_TIMEOUT_MS = 180_000;

	private final String endpointUrl;

	/**
	 * @param endpointUrl the full {@code /compare} URL (e.g. {@code http://localhost:8000/compare})
	 */
	public DinoServerClient(String endpointUrl) {
		this.endpointUrl = endpointUrl;
	}

	/**
	 * Compares a baseline image against an actual image.
	 *
	 * @param baselinePng the approved baseline PNG
	 * @param actualPng   the freshly captured PNG
	 * @param cropRegions tracked field regions (may be empty for a global-only comparison)
	 * @return the parsed comparison result
	 * @throws IOException if the request fails or the server responds with a non-200 status
	 */
	public DinoComparisonResult compare(java.io.File baselinePng, java.io.File actualPng,
			List<CropRegion> cropRegions) throws IOException {
		String baselineB64 = Base64.getEncoder().encodeToString(Files.readAllBytes(baselinePng.toPath()));
		String actualB64 = Base64.getEncoder().encodeToString(Files.readAllBytes(actualPng.toPath()));
		byte[] body = buildRequestJson(baselineB64, actualB64, cropRegions).getBytes(StandardCharsets.UTF_8);

		HttpURLConnection connection = (HttpURLConnection) new URL(endpointUrl).openConnection();
		try {
			connection.setRequestMethod("POST");
			connection.setRequestProperty("Content-Type", "application/json");
			connection.setRequestProperty("Accept", "application/json");
			connection.setConnectTimeout(CONNECT_TIMEOUT_MS);
			connection.setReadTimeout(READ_TIMEOUT_MS);
			connection.setDoOutput(true);
			connection.setFixedLengthStreamingMode(body.length);

			try (OutputStream os = connection.getOutputStream()) {
				os.write(body);
			}

			int status = connection.getResponseCode();
			if (status != HttpURLConnection.HTTP_OK) {
				throw new IOException("Dino server returned HTTP " + status + ": "
						+ readStream(connection.getErrorStream()));
			}
			return DinoComparisonResult.fromJson(readStream(connection.getInputStream()));
		} finally {
			connection.disconnect();
		}
	}

	private static String buildRequestJson(String baselineB64, String actualB64, List<CropRegion> cropRegions) {
		StringBuilder sb = new StringBuilder(baselineB64.length() + actualB64.length() + 256);
		sb.append('{');
		sb.append("\"baseline_b64\":\"").append(baselineB64).append("\",");
		sb.append("\"actual_b64\":\"").append(actualB64).append("\",");
		sb.append("\"crop_regions\":[");
		if (cropRegions != null) {
			for (int i = 0; i < cropRegions.size(); i++) {
				if (i > 0) {
					sb.append(',');
				}
				sb.append(cropRegions.get(i).toJson());
			}
		}
		sb.append("]}");
		return sb.toString();
	}

	private static String readStream(InputStream in) throws IOException {
		if (in == null) {
			return "";
		}
		try (InputStream stream = in) {
			ByteArrayOutputStream buffer = new ByteArrayOutputStream();
			byte[] chunk = new byte[8192];
			int read;
			while ((read = stream.read(chunk)) != -1) {
				buffer.write(chunk, 0, read);
			}
			return new String(buffer.toByteArray(), StandardCharsets.UTF_8);
		}
	}
}
