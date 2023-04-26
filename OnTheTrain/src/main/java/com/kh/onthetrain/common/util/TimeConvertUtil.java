package com.kh.onthetrain.common.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

public class TimeConvertUtil {
	public static final String KST_TIMEZONE = "Asia/Seoul";

	//UTC를 KST로 변환
	public static Date convertUtcToKst(Date utcDate) {
		TimeZone utcTimeZone = TimeZone.getTimeZone("UTC");
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		dateFormat.setTimeZone(utcTimeZone);
		String utcDateString = dateFormat.format(utcDate);
		dateFormat.setTimeZone(TimeZone.getTimeZone(KST_TIMEZONE));
		try {
			return dateFormat.parse(utcDateString);
		} catch (Exception e) {
			return null;
		}
	}

	//UTC를 KST DATE STRING로 변환
	public static String convertUtcToKstDateString(Date utcDate) {
		TimeZone utcTimeZone = TimeZone.getTimeZone("UTC");
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		dateFormat.setTimeZone(utcTimeZone);
		dateFormat.setTimeZone(TimeZone.getTimeZone(KST_TIMEZONE));
		return dateFormat.format(utcDate);
	}

	//UTC를 분단위의 KST DATE STRING로 변환
	public static String convertUtcToKstDateStringWithoutSeconds(Date utcDate) {
		TimeZone utcTimeZone = TimeZone.getTimeZone("UTC");
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:00");
		dateFormat.setTimeZone(utcTimeZone);
		dateFormat.setTimeZone(TimeZone.getTimeZone(KST_TIMEZONE));
		return dateFormat.format(utcDate);
	}

	//KST를 UTC로 변환
	public static Date convertKstToUtc(Date kstDate) {
		TimeZone utcTimeZone = TimeZone.getTimeZone("UTC");
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		dateFormat.setTimeZone(TimeZone.getTimeZone(KST_TIMEZONE));
		String kstDateString = dateFormat.format(kstDate);
		dateFormat.setTimeZone(utcTimeZone);
		try {
			return dateFormat.parse(kstDateString);
		} catch (Exception e) {
			return null;
		}
	}

	//KST를 UTC DATE STRING로 변환
	public static String convertKstToUtcDateString(Date kstDate) {
		TimeZone utcTimeZone = TimeZone.getTimeZone("UTC");
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		dateFormat.setTimeZone(TimeZone.getTimeZone(KST_TIMEZONE));
		dateFormat.setTimeZone(utcTimeZone);
		return dateFormat.format(kstDate);
	}

	//KST를 분단위의 UTC DATE STRING로 변환
	public static String convertKstToUtcDateStringWithoutSeconds(Date kstDate) {
		TimeZone utcTimeZone = TimeZone.getTimeZone("UTC");
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:00");
		dateFormat.setTimeZone(TimeZone.getTimeZone(KST_TIMEZONE));
		dateFormat.setTimeZone(utcTimeZone);
		return dateFormat.format(kstDate);
	}
}
