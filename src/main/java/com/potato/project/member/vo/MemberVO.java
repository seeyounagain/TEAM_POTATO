package com.potato.project.member.vo;

import com.potato.project.common.vo.PageVO;

public class MemberVO extends PageVO {
	
	// 이용자 테이블 MEMBER
		                  
	private String id       ;       //  ID          -- 아이디 (기본키)
	private String pw	    ;       //  PW          -- 비밀번호
	private String name     ;		//  NAME        -- 이름
	private String addr		;		//  ADDR        -- 주소
	private String tell		;		//  TELL        -- 연락처
	private String birth	;		// 	BIRTH		-- 생년월일
	private String isAdmin	;		//  IS_ADMIN    -- 관리자 여부 (기본값 N 관리자 Y)
	private String isDelete ;		//  IS_DELETE   -- 탈퇴여부 (기본값 N 탈퇴시 Y)
	private String gender 	;		//  GENDER      -- 성별
	private String favorite ;		//  FAVORITE    -- 관심카테고리
	
	private int overCnt;
	
	private String[] tells;
	private String[] addrs;
	
	//나의도서관 대출 예약 반납 카운트용 추가
	private String rentalCnt;  //대출 카운트
	private String reserveCnt; //예약 카운트
	private String returnCnt;  //반납 카운트
	
	//나의정보에 전화번호 넣을려고
	private String tellCnt; //전화번호 숫자 조회용
	private String tell1;
	private String tell2;
	private String tell3;
	
	//나의정보에 우편번호 넣을려고
	private String postCode;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getTell() {
		return tell;
	}
	public void setTell(String tell) {
		this.tell = tell;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getIsAdmin() {
		return isAdmin;
	}
	public void setIsAdmin(String isAdmin) {
		this.isAdmin = isAdmin;
	}
	public String getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(String isDelete) {
		this.isDelete = isDelete;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getFavorite() {
		return favorite;
	}
	public void setFavorite(String favorite) {
		this.favorite = favorite;
	}
	
	public String[] getTells() {
		return tells;
	}
	
	public void setTells(String[] tells) {
		String tell = tells[0] + "-" + tells[1] + "-" + tells[2];
		setTell(tell);
	}
	public String[] getAddrs() {
		return addrs;
	}
	public void setAddrs(String[] addrs) {
		String addr = addrs[0] + " " + addrs[1] + " " + addrs[2];
		setAddr(addr);
	}
	public String getRentalCnt() {
		return rentalCnt;
	}
	public void setRentalCnt(String rentalCnt) {
		this.rentalCnt = rentalCnt;
	}
	public String getReserveCnt() {
		return reserveCnt;
	}
	public void setReserveCnt(String reserveCnt) {
		this.reserveCnt = reserveCnt;
	}
	public String getReturnCnt() {
		return returnCnt;
	}
	public void setReturnCnt(String returnCnt) {
		this.returnCnt = returnCnt;
	}
	public String getTellCnt() {
		return tellCnt;
	}
	public void setTellCnt(String tellCnt) {
		this.tellCnt = tellCnt;
	}
	public String getTell1() {
		return tell1;
	}
	public void setTell1(String tell1) {
		this.tell1 = tell1;
	}
	public String getTell2() {
		return tell2;
	}
	public void setTell2(String tell2) {
		this.tell2 = tell2;
	}
	public String getTell3() {
		return tell3;
	}
	public void setTell3(String tell3) {
		this.tell3 = tell3;
	}
	public String getPostCode() {
		return postCode;
	}
	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}
	public int getOverCnt() {
		return overCnt;
	}
	public void setOverCnt(int overCnt) {
		this.overCnt = overCnt;
	}
	
}
