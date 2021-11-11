package com.potato.project.service.vo;

import java.util.List;

import com.potato.project.common.vo.AttachFileVO;


public class RecommendVO {
	
	private String rcCode			;		    //    RC_CODE             rcCode		
	private String title 			;		    // ,  TITLE               title 		
	private byte[] contentTitle	;		    // ,  	  CONTENT_TITLE       contentTitle	
	private String imgOne			;	  		// ,  IMG_ONE             imgOne		
	private byte[] contentOne		;		   // ,   CONTENT_ONE         contentOne	
	private String imgTwo 			;	 	  // ,    IMG_TWO             imgTwo 		
	private byte[] contentTwo		;	   // ,       CONTENT_TWO         contentTwo	
	private String imgThree 		;		//	      IMG_THREE           imgThree 	
	private byte[] contentThree	;			//   	  CONTENT_THREE       contentThree	
	 

	private List<ImgVO> imgList;
	
	
	

	public List<ImgVO> getImgList() {
		return imgList;
	}
	public void setImgList(List<ImgVO> imgList) {
		this.imgList = imgList;
	}
	public String getRcCode() {
		return rcCode;
	}
	public void setRcCode(String rcCode) {
		this.rcCode = rcCode;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public byte[] getContentTitle() {
		return contentTitle;
	}
	public void setContentTitle(byte[] contentTitle) {
		this.contentTitle = contentTitle;
	}
	public String getImgOne() {
		return imgOne;
	}
	public void setImgOne(String imgOne) {
		this.imgOne = imgOne;
	}
	public byte[] getContentOne() {
		return contentOne;
	}
	public void setContentOne(byte[] contentOne) {
		this.contentOne = contentOne;
	}
	public String getImgTwo() {
		return imgTwo;
	}
	public void setImgTwo(String imgTwo) {
		this.imgTwo = imgTwo;
	}
	public byte[] getContentTwo() {
		return contentTwo;
	}
	public void setContentTwo(byte[] contentTwo) {
		this.contentTwo = contentTwo;
	}
	public String getImgThree() {
		return imgThree;
	}
	public void setImgThree(String imgThree) {
		this.imgThree = imgThree;
	}
	public byte[] getContentThree() {
		return contentThree;
	}
	public void setContentThree(byte[] contentThree) {
		this.contentThree = contentThree;
	}
	
	

}
