package com.potato.project.service.vo;

public class RequestBoardVO {
	
		private String requestCode			;									//    REQUEST_CODE
		private String id					;									//    ID 
		private String title				;									//    TITLE 
		private String writer				; 									//    WRITER
		private String isbn					;									//    ISBN 
		private String pubDate				; 									//    PUB_DATE 
		private String createDate			;
		
		
		public String getCreateDate() {
			return createDate;
		}
		public void setCreateDate(String createDate) {
			this.createDate = createDate;
		}
		public String getRequestCode() {
			return requestCode;
		}
		public void setRequestCode(String requestCode) {
			this.requestCode = requestCode;
		}
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getWriter() {
			return writer;
		}
		public void setWriter(String writer) {
			this.writer = writer;
		}
		public String getIsbn() {
			return isbn;
		}
		public void setIsbn(String isbn) {
			this.isbn = isbn;
		}
		public String getPubDate() {
			return pubDate;
		}
		public void setPubDate(String pubDate) {
			this.pubDate = pubDate;
		}
   
		

}
