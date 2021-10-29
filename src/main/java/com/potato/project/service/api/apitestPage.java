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
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.potato.project.service.vo.ApiDataVO;
import com.potato.project.service.vo.ApiSearchVO;

public class apitestPage {
	
	public static void main(String[] args) throws  UnsupportedEncodingException, ParseException {
		
		HttpURLConnection conn = null;
		JSONObject responseJson = null;
		
		ApiSearchVO as = new ApiSearchVO();
		
		as.setKwd("가시고기");
		as.setCategory("도서");
		as.setSort("title");
		as.setSrchTarget("");
		as.setIsbn("");
		
		String strUrl ="https://www.nl.go.kr/NL/search/openApi/search.do";
		
		String apiData = ""; //api로부터 받은자료줄 저장소
		
		List<ApiDataVO> adList = new ArrayList<>();
		
	    try {
	    	URL url = new URL(strUrl);		 //URL 설정
	        conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");   //Request 형식 설정
	        conn.setDoOutput(true);			 //request에 JSON data 준비
	        
	        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream(),"UTF-8"));
	        
	        bw.write("systemType="+ URLEncoder.encode("오프라인자료","UTF-8")
	        		+ "&key=14422d834c6677f2968b3261ad1766e8fc102ed5fb25b93e29abd78489bc71e5"
	        		+ "&apiType=json"
	        		+ as.getKwd()
	        		+ as.getCategory()
	        		+ as.getSort()
	        		+ as.getSrchTarget()
	        		+ as.getIsbn()
	        		);
	        
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
	           
	        	apiData = br.readLine(); //System.out.println(apiData); // 1열로 추출된 apiData 나열
	           
	        	JSONParser jsonParser = new JSONParser();
	        	JSONObject apiJson = (JSONObject)jsonParser.parse(apiData);	//apiData = 제이슨객체
	        	
	        	//추출된 jsonArray
	        	JSONArray resultArr = (JSONArray)apiJson.get("result"); //리절트 키값 = 값은 ARR
	        	
	        	JSONObject totalData2 = (JSONObject)resultArr.get(0);
	        	
	        			System.out.println(totalData2.get("titleInfo"));        	
	        	
	        	
	        	for(int i = 0; i < resultArr.size();i++) {
	        		JSONObject totalData = (JSONObject)resultArr.get(i);
		           	ApiDataVO adVO = new ApiDataVO(
		           		 (String)totalData.get("titleInfo"),(String)totalData.get("typeName"),(String)totalData.get("authorInfo"),(String)totalData.get("menuName"),(String)totalData.get("mediaName")
			           		,(String)totalData.get("pubYearInfo"),(String)totalData.get("id"),(String)totalData.get("typeCode"),(String)totalData.get("isbn")
			           		,(String)totalData.get("callNo"),(String)totalData.get("kdcCode1s"), (String)totalData.get("kdcName1s")
			        );
		           	adList.add(adVO);
	        		}
	        	
	        }
	    } catch (MalformedURLException e) {
	        e.printStackTrace();
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
		
	}

}
