package com.ats.ecommerce.model.offer;


public class SiteVisitor {

	private int visitorId;
	
	private String mobNo;
	
	private String visitDttime;
	
	private String landMark;
	
	private int frId;

	public int getVisitorId() {
		return visitorId;
	}

	public void setVisitorId(int visitorId) {
		this.visitorId = visitorId;
	}

	public String getMobNo() {
		return mobNo;
	}

	public void setMobNo(String mobNo) {
		this.mobNo = mobNo;
	}

	public String getVisitDttime() {
		return visitDttime;
	}

	public void setVisitDttime(String visitDttime) {
		this.visitDttime = visitDttime;
	}

	public String getLandMark() {
		return landMark;
	}

	public void setLandMark(String landMark) {
		this.landMark = landMark;
	}

	public int getFrId() {
		return frId;
	}

	public void setFrId(int frId) {
		this.frId = frId;
	}

	@Override
	public String toString() {
		return "SiteVisitor [visitorId=" + visitorId + ", mobNo=" + mobNo + ", visitDttime=" + visitDttime
				+ ", landMark=" + landMark + ", frId=" + frId + "]";
	}
	
}
