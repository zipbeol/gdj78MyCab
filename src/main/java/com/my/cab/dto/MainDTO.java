package com.my.cab.dto;

public class MainDTO {
	
	
	private String notice_imp;
	private String notice_content;
	
	// 유류비 가져오기 dto
	private String fuelId;
	private String fuelPrice;
	
	
	public String getNotice_imp() {
		return notice_imp;
	}
	public void setNotice_imp(String notice_imp) {
		this.notice_imp = notice_imp;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	
	
	public String getFuelId() {
		return fuelId;
	}
	public void setFuelId(String fuelId) {
		this.fuelId = fuelId;
	}
	public String getFuelPrice() {
		return fuelPrice;
	}
	public void setFuelPrice(String fuelPrice) {
		this.fuelPrice = fuelPrice;
	}
	
	
	

}
