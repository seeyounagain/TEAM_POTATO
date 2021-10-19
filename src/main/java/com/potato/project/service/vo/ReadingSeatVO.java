package com.potato.project.service.vo;

public class ReadingSeatVO {
	// 천화 
    private String	 seatCode 		;                       // SEAT_CODE	
    private int		 seatStatus   	;                    	//    SEAT_STATUS
    private String   id				;                      //  ID         
    
	public String getSeatCode() {
		return seatCode;
	}
	public void setSeatCode(String seatCode) {
		this.seatCode = seatCode;
	}
	public int getSeatStatus() {
		return seatStatus;
	}
	public void setSeatStatus(int seatStatus) {
		this.seatStatus = seatStatus;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

    
    
    
}
