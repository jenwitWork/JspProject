package com.utilities;

import java.text.SimpleDateFormat;

public class GenerateCode {
	private SimpleDateFormat formatter;

	public GenerateCode() {
	}

	public String newCode() {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss", new java.util.Locale("en", "EN"));
		long millisecond = new java.util.Date().getTime();
		return formatter.format(new java.util.Date()) + millisecond;
	}

	public String newCodeDocument(String lastCode) {
		String genCode = "";
		formatter = new SimpleDateFormat("yy", new java.util.Locale("en", "TH"));
		if (lastCode.equals("")) {
			genCode = formatter.format(new java.util.Date()).trim() + "/T.00001";
			return genCode.trim();
		}
		genCode = String.valueOf(spliteCode(lastCode.trim()) + 1).trim();
		while (genCode.length() < 5) {
			genCode = "0" + genCode;
		}
		genCode = formatter.format(new java.util.Date()).trim() + "/T." + genCode;
		return genCode.trim();
	}

	private int spliteCode(String text) {
		String[] arr = text.split("[^0-9]");
		String result = "";

		result = result + arr[arr.length - 1];

		return Integer.parseInt(result);
	}
}