package com.potato.project.common.util;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import edu.emory.mathcs.backport.java.util.Arrays;
import edu.emory.mathcs.backport.java.util.Collections;

public class CalenderUtil {

	public static HashMap<String, String[]> Map () {
		
	
	HashMap<String,String[]> calender = new HashMap<String, String[]>();
	
	Calendar cal = Calendar.getInstance();
	
	cal.after(cal);
	
	String [] month = new String[12];
	
	for(int i = 0;i < month.length ;i++) {
		if(i+1 < 10) {
			month[i] = "0"+ (i+1);
		}else {
			month[i] = "" + (i+1);
		}
	}
	
	String [] year = new String[12];
	for(int i = 0;i <= 11;i++) {
		year[i] = ""+ (cal.getWeekYear()-11+i);
	}
	
	List<String> yearList = Arrays.asList(year);
	Collections.reverse(yearList);
	String[] reverseYear = yearList.toArray(year);
	
	List<String> monthList = Arrays.asList(month);
	Collections.reverse(monthList);
	String[] reverseMonth = monthList.toArray(month);
	
	
	
	
	calender.put("month", monthList.toArray(month));		
	calender.put("year", yearList.toArray(year));	
	
	return calender;
	
	}
}
