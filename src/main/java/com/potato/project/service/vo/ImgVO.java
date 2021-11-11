package com.potato.project.service.vo;

public class ImgVO {
	
		private String imgCode          ;
		private String originImgName    ;
		private String attachedImgName  ;
		private String rcCode	      	;
	
		
		public ImgVO() {
			super();
		}
		
		public ImgVO(String attachedImgName, String originImgName,String imgCode, String rcCode) {
			this.attachedImgName = attachedImgName;
			this.originImgName   = originImgName;
			this.rcCode        	 = rcCode;
			this.imgCode   		 = imgCode;
		}
		
		public String getImgCode() {
			return imgCode;
		}
		public void setImgCode(String imgCode) {
			this.imgCode = imgCode;
		}
		public String getOriginImgName() {
			return originImgName;
		}
		public void setOriginImgName(String originImgName) {
			this.originImgName = originImgName;
		}
		public String getAttachedImgName() {
			return attachedImgName;
			
		}
		public void setAttachedImgName(String attachedImgName) {
			this.attachedImgName = attachedImgName;
		}

		public String getRcCode() {
			return rcCode;
		}

		public void setRcCode(String rcCode) {
			this.rcCode = rcCode;
		}

}
