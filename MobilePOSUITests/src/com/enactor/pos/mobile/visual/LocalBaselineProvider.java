package com.enactor.pos.mobile.visual;

import java.io.File;

/**
 * Baseline source backed by the local filesystem — a local directory, a mapped network drive, or a
 * UNC share. This is the default and preserves the original behaviour exactly.
 *
 * @author Visual Regression Subsystem
 */
final class LocalBaselineProvider implements BaselineProvider {

	private final File root;

	LocalBaselineProvider(File root) {
		this.root = root;
	}

	@Override
	public File getBaseline(String scenario, String stateFile) {
		File file = new File(new File(root, scenario), stateFile);
		return file.isFile() ? file : null;
	}

	@Override
	public File localRoot() {
		return root;
	}
}
