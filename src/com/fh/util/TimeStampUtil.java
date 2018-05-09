package com.fh.util;

import java.util.Date;
import java.util.Locale;

import org.apache.commons.lang3.time.DateFormatUtils;

/**
 * 时间戳接口
 * 
 * @author duping
 * 
 */
public class TimeStampUtil {

	public static class TimeFormat {

		private TimeFormat(String pattern, Locale locale) {
			this.pattern = pattern;
			this.locale = locale;
		}

		public static TimeFormat getInstance(String pattern, Locale locale) {
			return new TimeFormat(pattern, locale);
		}

		public static TimeFormat getInstance(String pattern) {
			return new TimeFormat(pattern, null);
		}

		private String pattern;

		private Locale locale;

		public String getPattern() {
			return pattern;
		}

		public Locale getLocale() {
			return locale;
		}

	}

	public static int getTimeStamp() {
		long longTime = System.currentTimeMillis();
		return (int) (longTime / 1000);
	}

	public static Date formatTimeStamp(int timestamp) {
		long longTime = toLong(timestamp);
		return new Date(longTime);
	}

	private static long toLong(int timestamp) {
		return (long) timestamp * 1000;
	}

	public static String formatTimeStamp(int timestamp, String pattern) {
		return DateFormatUtils.format(toLong(timestamp), pattern);
	}

	public static String formatTimeStamp(int timestamp, TimeFormat timeFormat) {
		return DateFormatUtils.format(toLong(timestamp),
				timeFormat.getPattern(), timeFormat.getLocale());
	}

	public static final TimeFormat FULL_CHINA_TIME = TimeFormat
			.getInstance("yyyy年MM月dd日 HH点mm分ss秒");
	public static final TimeFormat CHINA_TIME = TimeFormat
			.getInstance("yyyy年MM月dd日 HH:mm:ss");
	public static final TimeFormat DEFAULT_TIME = TimeFormat
			.getInstance("yyyy-MM-dd HH:mm:dd");
	public static final TimeFormat FULL_ENGLISH_TIME = TimeFormat.getInstance(
			"EEE d MMM yyyy HH:mm:ss z", Locale.US);
	public static final TimeFormat ENGLISH_TIME = TimeFormat.getInstance(
			"EEE d MMM yyyy HH:mm:ss", Locale.US);
}
