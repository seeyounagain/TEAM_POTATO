package com.potato.project.member.vo;

public class MemberVO {
	
	// 이용자 테이블 MEMBER
		                  
	private String id       ;       //  ID          -- 아이디 (기본키)
	private String pw	    ;       //  PW          -- 비밀번호
	private String name     ;		//  NAME        -- 이름
	private String addr		;		//  ADDR        -- 주소
	private String tell		;		//  TELL        -- 연락처
	private String isAdmin	;		//  IS_ADMIN    -- 관리자 여부 (기본값 N 관리자 Y)
	private String isDelete ;		//  IS_DELETE   -- 탈퇴여부 (기본값 N 탈퇴시 Y)
	private String gender 	;		//  GENDER      -- 성별
	private String favorite ;		//  FAVORITE    -- 관심카테고리
	
	private String[] tells;
	private String[] addrs;
	
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
	
}
