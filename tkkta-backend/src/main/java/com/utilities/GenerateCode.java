package com.utilities;

import java.text.SimpleDateFormat;

public class GenerateCode
{
  private SimpleDateFormat formatter;
  
  public GenerateCode() {}
  
  public String newCode() {
    SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss", new java.util.Locale("en", "EN"));
    long millisecond = new java.util.Date().getTime();
    return formatter.format(new java.util.Date()) + millisecond;
  }
  
  public String newCodeDocument(String lastCode) {
    String genCode = "";
    formatter = new SimpleDateFormat("yy", new java.util.Locale("en", "TH"));
    if (lastCode.equals("")) {
      genCode = "T.00001/" + formatter.format(new java.util.Date()).trim();
      return genCode.trim();
    }
    genCode = String.valueOf(spliteCode(lastCode.trim()) + 1).trim();
    while (genCode.length() < 5) {
      genCode = "0" + genCode;
    }
    genCode = "T." + genCode + "/" + formatter.format(new java.util.Date()).trim();
    return genCode.trim();
  }
  
  private int spliteCode(String text)
  {
    String[] arr = text.split("[^0-9]");
    String result = "";
    
    for (int i = 0; i < arr.length; i++) {
      System.out.println("test = " + arr[i]);
    }
    
    for (int i = 0; i < arr.length; i++) {
      if ((i != arr.length - 1) && 
        (!arr[i].equals("")) && (arr[i] != null)) {
        result = result + arr[i];
      }
    }
    
    return Integer.parseInt(result);
  }
}