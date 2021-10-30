package com.potato.project.common.vo;

public class MessageVO {
	
	// 알림 테이블 MESSAGE
	
	private String messageCode		;	// MESSAGE_CODE (기본키) MESSAGE_0001
	private String fromId			;	// FROM_ID 보낸사람 디폴트 admin
	private String toId				;	// TO_ID 받는사람 (외래키)
	private String sendDate			;	// SEND_DATE 보낸시간 디폴트 SYSDATE
	private String content			;	// CONTENT 내용
	private String isRead			;	// IS_READ 읽음 여부 디폴트 N
	
	
	public String getMessageCode() {
		return messageCode;
	}
	public void setMessageCode(String messageCode) {
		this.messageCode = messageCode;
	}
	public String getFromId() {
		return fromId;
	}
	public void setFromId(String fromId) {
		this.fromId = fromId;
	}
	public String getToId() {
		return toId;
	}
	public void setToId(String toId) {
		this.toId = toId;
	}
	public String getSendDate() {
		return sendDate;
	}
	public void setSendDate(String sendDate) {
		this.sendDate = sendDate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getIsRead() {
		return isRead;
	}
	public void setIsRead(String isRead) {
		this.isRead = isRead;
	}
	

}
