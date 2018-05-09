package com.fh.util.ffmpeg;

public class ConvertVedio {
	public static void convertVedio(String inputPath) {
		String ffmpegPath = getFfmpegPath();
		String outputPath = getOutputPath(inputPath);
		try {
			FfmpegUtil.ffmpeg(ffmpegPath, inputPath, outputPath);
		} catch (FFmpegException e) {
			e.printStackTrace();
		}

	}

	private static String getFfmpegPath() {
		return "g:/ffmpeg.exe";
	}

	private static String getOutputPath(String inputPath) {
		return inputPath.substring(0, inputPath.lastIndexOf(".")).toLowerCase()
				+ "_1.mp4";
	}
}