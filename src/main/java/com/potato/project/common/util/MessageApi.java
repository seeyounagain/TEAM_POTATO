package com.potato.project.common.util;

import java.util.HashMap;
import java.util.concurrent.ThreadLocalRandom;

import org.json.simple.JSONObject;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class MessageApi {
	
	// 문자 인증을 위한 클래스
	
	// 6자리 랜덤 번호 생성
    public static int randomNumber() {
        return ThreadLocalRandom.current().nextInt(100000, 1000000);
    }
	
	public static void sendMessage(String toNumber, int randomNumber) {
			
		// api key
		String apiKey = "NCSCBVEQFEIIBXEI";
		// api secret
		String apiSecret = "UFLEV2K4DA9EVNBGMBA4XZMPTAYAUYFU";
		// 발신번호
		String fromNumber = "########";

		Message coolsms = new Message(apiKey, apiSecret);

		HashMap<String, String> set = new HashMap<String, String>();
		set.put("to", toNumber);
		set.put("from", fromNumber);
		set.put("type", "SMS");
		set.put("text", "[고담도서관] 인증번호 "+ randomNumber +" 를 입력하세요.");

		try {
			JSONObject result = (JSONObject) coolsms.send(set);
			System.out.println(result.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
	}
	
	public static void sendPwMessage(String toNumber, String pw) {
		
		// api key
		String apiKey = "NCSCBVEQFEIIBXEI";
		// api secret
		String apiSecret = "UFLEV2K4DA9EVNBGMBA4XZMPTAYAUYFU";
		// 발신번호
		String fromNumber = "########";
		
		Message coolsms = new Message(apiKey, apiSecret);
		
		HashMap<String, String> set = new HashMap<String, String>();
		set.put("to", toNumber);
		set.put("from", fromNumber);
		set.put("type", "SMS");
		set.put("text", "[고담도서관] 회원님의 비밀번호는 "+ pw +" 입니다.");
		
		try {
			JSONObject result = (JSONObject) coolsms.send(set);
			System.out.println(result.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
	}

}
