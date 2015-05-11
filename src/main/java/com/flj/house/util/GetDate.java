package com.flj.house.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class GetDate {

	public static String getDate() {
		Date currentTime = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String dateString = formatter.format(currentTime);
		return dateString;
	}

}
