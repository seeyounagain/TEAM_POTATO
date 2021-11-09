package com.potato.project.common.util;

import java.util.Calendar;

public class FileUploadUtil {
	
	// 첨부파일 기능 클래스
	
	// 현재 날짜, 시간 구하기
	// 파일 이름이 중복 일 경우 기본 a1, a2, a3이 아닌 시간을 이용해서 만들어 줄 것. ex) 2021101310120045_a
	public static String getNowDateTime() {
		
		// 캘린더 객체 생성
		Calendar cal = Calendar.getInstance();
		// 현재 날짜 및 시간을 문자열로 저장할 변수
		String nowDateTime = "";
		// 날짜 및 시간 생성
		nowDateTime += cal.get(Calendar.YEAR);
		// MONTH 는 배열로 이루어져 있기 때문에 0부터 시작함으로 +1 을 해준다.
		nowDateTime += cal.get(Calendar.MONTH) + 1;
		nowDateTime += cal.get(Calendar.DATE);
		nowDateTime += cal.get(Calendar.HOUR);
		nowDateTime += cal.get(Calendar.MINUTE);
		nowDateTime += cal.get(Calendar.SECOND);
		nowDateTime += cal.get(Calendar.MILLISECOND);
		
		return nowDateTime;
		
	}

	public static String getNowDate() {
		
		// 캘린더 객체 생성
		Calendar cal = Calendar.getInstance();
		// 현재 날짜 및 시간을 문자열로 저장할 변수
		String nowDateTime = "";
		// 날짜 및 시간 생성
		nowDateTime += cal.get(Calendar.YEAR) + "-";
		// MONTH 는 배열로 이루어져 있기 때문에 0부터 시작함으로 +1 을 해준다.
		nowDateTime += (cal.get(Calendar.MONTH) + 1) + "-";
		nowDateTime += cal.get(Calendar.DATE);
		
		return nowDateTime;
		
	}
	
	public static String getNowDateBeforeAMonth() {
		
		// 캘린더 객체 생성
		Calendar cal = Calendar.getInstance();
		// 현재 날짜 및 시간을 문자열로 저장할 변수
		String nowDateTime = "";
		// 날짜 및 시간 생성
		nowDateTime += cal.get(Calendar.YEAR) + "-";
		// MONTH 는 배열로 이루어져 있기 때문에 0부터 시작함으로 +1 을 해준다.
		nowDateTime += cal.get(Calendar.MONTH) + "-";
		nowDateTime += cal.get(Calendar.DATE);
		
		return nowDateTime;
		
	}
	
}
