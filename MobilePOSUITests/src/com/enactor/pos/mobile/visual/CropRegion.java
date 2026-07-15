package com.enactor.pos.mobile.visual;

/**
 * Immutable value object describing one tracked UI field for a single comparison request. It mirrors,
 * one-to-one, the {@code CropRegion} pydantic model on the DINOv2 server
 * ({@code D:/MPOC/DINOv2/dino_server.py}): a logical {@code name}, the baseline bounding box, the
 * actual bounding box, and the per-field pass threshold.
 *
 * <p>The two boxes are kept separate on purpose. Baseline and actual screenshots are captured on
 * potentially different runs (and, for the global pass, are resolution-normalised by the server), so
 * the element can sit at different pixel coordinates in each image. The boxes are read from the
 * per-image {@code .meta} side-cars that {@link StepScreenshotCapturer} writes.</p>
 *
 * @author Visual Regression Subsystem
 */
public final class CropRegion {

	private final String name;
	private final int baseX;
	private final int baseY;
	private final int baseWidth;
	private final int baseHeight;
	private final int actualX;
	private final int actualY;
	private final int actualWidth;
	private final int actualHeight;
	private final double threshold;

	public CropRegion(String name, int baseX, int baseY, int baseWidth, int baseHeight,
			int actualX, int actualY, int actualWidth, int actualHeight, double threshold) {
		this.name = name;
		this.baseX = baseX;
		this.baseY = baseY;
		this.baseWidth = baseWidth;
		this.baseHeight = baseHeight;
		this.actualX = actualX;
		this.actualY = actualY;
		this.actualWidth = actualWidth;
		this.actualHeight = actualHeight;
		this.threshold = threshold;
	}

	public String getName() {
		return name;
	}

	public double getThreshold() {
		return threshold;
	}

	/**
	 * Serialises this region as the JSON object the server expects inside {@code crop_regions}. The
	 * name is JSON-escaped; all other members are integers/doubles that need no escaping.
	 *
	 * @return a JSON object literal for this crop region
	 */
	public String toJson() {
		StringBuilder sb = new StringBuilder(160);
		sb.append('{');
		sb.append("\"name\":\"").append(JsonUtil.escape(name)).append("\",");
		sb.append("\"base_x\":").append(baseX).append(',');
		sb.append("\"base_y\":").append(baseY).append(',');
		sb.append("\"base_width\":").append(baseWidth).append(',');
		sb.append("\"base_height\":").append(baseHeight).append(',');
		sb.append("\"actual_x\":").append(actualX).append(',');
		sb.append("\"actual_y\":").append(actualY).append(',');
		sb.append("\"actual_width\":").append(actualWidth).append(',');
		sb.append("\"actual_height\":").append(actualHeight).append(',');
		sb.append("\"threshold\":").append(threshold);
		sb.append('}');
		return sb.toString();
	}
}
