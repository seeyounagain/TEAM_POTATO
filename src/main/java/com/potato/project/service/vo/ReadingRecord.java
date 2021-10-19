package com.potato.project.service.vo;

public class ReadingRecord {
	
	// 천화 
		private String recordCode	;						 //  RECORD_CODE
		private String seatCode		;						 //  SEAT_CODE
		private String id			;						 //  ID
		private String seatInDate	;						 //  SEAT_IN_DATE
		private String seatOutDate	;						 //  SEAT_OUT_DATE
		
		
		public String getRecordCode() {
			return recordCode;
		}
		public void setRecordCode(String recordCode) {
			this.recordCode = recordCode;
		}
		public String getSeatCode() {
			return seatCode;
		}
		public void setSeatCode(String seatCode) {
			this.seatCode = seatCode;
		}
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getSeatInDate() {
			return seatInDate;
		}
		public void setSeatInDate(String seatInDate) {
			this.seatInDate = seatInDate;
		}
		public String getSeatOutDate() {
			return seatOutDate;
		}
		public void setSeatOutDate(String seatOutDate) {
			this.seatOutDate = seatOutDate;
		}
	
		
		

}