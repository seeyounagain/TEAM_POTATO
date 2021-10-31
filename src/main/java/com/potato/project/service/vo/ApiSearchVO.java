package com.potato.project.service.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
public class ApiSearchVO {
		
	private String kwd 			; //검색 키워드
	private String category 	; //카테고리-자료유형
	private String srchTarget 	; //검색타겟 total ,title ,author ,publisher, cheonggu 생략시 전체
	private String sort			; //정렬기준 정렬 ititle(제목),iauthor(저자),ipublisher(발행처)ipub_year (발행년도), cheonggu (청구기호)
	private String isbnCode			; //isbn
	
	private String keyword 		;
		
	
	//검색결과창 안내용
	public String getKeyword() {
		return keyword;
	}
	public void setKwd(String kwd) throws UnsupportedEncodingException {
		if(kwd == "" || kwd.equals("") || kwd == null ) {
		this.kwd = "";	
		}else {
			this.kwd = "&kwd="+ URLEncoder.encode(kwd,"UTF-8");	
			this.keyword = kwd;
		}
	}
	public void setCategory(String category) throws UnsupportedEncodingException {
		if(category == "" || category.equals("") || category == null ) {
		this.category = "";	
		}else {
		this.category = "&category="+ URLEncoder.encode(category,"UTF-8");
		}
	}
	public void setSrchTarget(String srchTarget) {
		if(srchTarget == "" || srchTarget.equals("") || srchTarget == null ) {
		this.srchTarget = "";	
		}else {
			this.srchTarget = "&srchTarget="+ srchTarget;
		}
	}
	public void setSort(String sort) {
		if(sort == "" || sort.equals("") || sort == null ) {
		this.sort = "";	
		}else {
			this.sort = "&sort="+ sort;
		}
	}
	public void setIsbn(String isbn) throws UnsupportedEncodingException {

	}
	public void setIsbnCode(String isbnCode) {
		if(isbnCode == "" || isbnCode.equals("") || isbnCode == null ) {
		this.isbnCode = "";	
		}else {
		this.isbnCode = "&isbnCode="+ isbnCode;
		}
		
	}
	
	
	
	public String getIsbnCode() {
		return isbnCode;
	}

	public String getKwd() {
		return kwd;
	}
	public String getCategory() {
		return category;
	}
	public String getSrchTarget() {
		return srchTarget;
	}
	public String getSort() {
		return sort;
	}

	

	
	
	
	


	
	
	
	

}
