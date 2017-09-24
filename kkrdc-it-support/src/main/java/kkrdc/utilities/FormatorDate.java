package kkrdc.utilities;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class FormatorDate {

	public Date getDate(String pattern, String simple_date) throws ParseException {
		SimpleDateFormat formateDate = new SimpleDateFormat(pattern,Locale.ENGLISH);
		Date date = formateDate.parse(simple_date);
		return date;
	}

}
