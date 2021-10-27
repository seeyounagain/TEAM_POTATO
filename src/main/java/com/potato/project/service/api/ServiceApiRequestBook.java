package com.potato.project.service.api;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.core.io.JsonEOFException;

public class ServiceApiRequestBook {

	public static void main(String[] args) throws UnsupportedEncodingException {
		HttpURLConnection conn = null;
		JSONObject responseJson = null;
		
		String strUrl ="https://www.nl.go.kr/NL/search/openApi/search.do";
		String sendMessage ="";
				
		JSONArray commandlist = null;
	    try {
	        //URL 설정
	    	URL url = new URL(strUrl);

	        conn = (HttpURLConnection) url.openConnection();
	        //Request 형식 설정
	        conn.setRequestMethod("POST");
	        conn.setRequestProperty("Accept-Charset", "UTF-8");
	        conn.setRequestProperty("apiType", "json");
//	        conn.setRequestProperty("Content-Type", "text/plain; charset=utf-8");
	        
	        //request에 JSON data 준비
	        conn.setDoOutput(true);
	        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream(),"UTF-8"));
	        //commands라는 JSONArray를 담을 JSONObject 생성
	        JSONObject commands = new JSONObject();
//	        commands.put("key", "14422d834c6677f2968b3261ad1766e8fc102ed5fb25b93e29abd78489bc71e5");
//	        commands.put("systemType", "오프라인자료");
//	        commands.put("category", "도서");
//	        commands.toString()
	        //request에 쓰기
	        String book = "가시고기";	
	        
	        bw.write(
	        		"key=14422d834c6677f2968b3261ad1766e8fc102ed5fb25b93e29abd78489bc71e5"
	        		+ "&kwd="+URLEncoder.encode(book,"UTF-8")
	        		+ "&apiType=xml");
	        
	        bw.flush();
	        bw.close();
	        //보내고 결과값 받기
	        int responseCode = conn.getResponseCode();
	        if (responseCode == 400) {
	            System.out.println("400:: 해당 명령을 실행할 수 없음");
	        } else if (responseCode == 500) {
	            System.out.println("500:: 서버 에러, 문의 필요");
	        } else { // 성공 후 응답 JSON 데이터받기
	        	BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
	            StringBuilder sb = new StringBuilder();
	            String line = "";
	            while ((line = br.readLine()) != null) {
	                sb.append(line).append("\n");
	            }
	            System.out.println(sb.toString());  
	        }
	    } catch (MalformedURLException e) {
	        e.printStackTrace();
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
		
	}
	   
	
}
		
		
                   	
//   String(                   key					발급키
//                             srchTarget			total (전체), title (제목),author (저자), publisher (발행자),cheonggu (청구기호),생략시 전체
//   String                    kwd					검색어
//   Integer                   pageNum				현재페이지
//   Integer                   pageSize				쪽당출력건수 (기본 10건)
//   String                    systemType			오프라인자료 (구: 소장정보)온라인자료 (구: 디지털화자료)
//   String                    category				[카테고리(자료유형)] 도서, 고서/고문서, 학위논문, 잡지/학술지, 신문, 기사, 멀티미디어, 장애인자료, 외부연계자료, 웹사이트 수집, 기타, 해외한국관련기록물
//   String                    lnbTypeName			[멀티미디어 하위분류]오디오북, 음악자료, 지도자료, 이미지/사진, 컴퓨터파일, 영상자료, 마이크로자료 (멀티미디어,장애인자료) [장애인자료 하위분류]점자자료, 장애인대체자료 [멀티미디어 하위분류]오디오북, 음악자료, 지도자료, 이미지/사진, 컴퓨터파일, 영상자료, 마이크로자료 (멀티미디어,장애인자료) 
//   String                    offerDcode2s			[자료제공DB별 자체분류 2차_명] 소장원문 , CH4A (고지도) 등
//                             sort				    정렬 (생략시 : 정확도순) ititle (제목), iauthor (저자), ipublisher (발행처) ipub_year (발행년도), cheonggu (청구기호)
//                             desc				    asc (오름차순), desc (내림차순)
//                             apiType				xml, json
//   String                    govYn				Y (정부간행물)        
//                             licYn				원문이용방법(원문저작권)
//	                                    			S ([국립중앙도서관,협약도서관]-인쇄 시 과금)
//	                                   				F ([국립중앙도서관,협약도서관]-열람,인쇄시 과금)
//			 	                                    Y ([국립중앙도서관,협약공공도서관,정기이용증소지자]-무료)
//			 	                                    L ([국립중앙도서관]-무료)
//			 	                                    N ([관외이용]-무료)
//			 	                                    C ([국립중앙도서관,작은도서관]-무료)
//			 	                                    U ([국립중앙도서관,국립어린이청소년도서관]-무료)
//			 	                                    T ([국립중앙도서관,국립어린이청소년도서관,작은도서관]-무료)
//			 	                                    R ([국립중앙도서관,정기이용증소지자]-무료)
//			 	                                    D ([국립중앙도서관,국립어린이청소년도서관,국립세종도서관]-무료)
//			 	                                    A ([국립중앙도서관,국립어린이청소년도서관,국립세종도서관,정기이용증소지자]-무료)











