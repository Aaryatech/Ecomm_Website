package com.atss.ecommerce.model;


//Author -Sachin
//Created on -01-10-2020
//Desc - to show product detail data to front end pages.

public class FEProdDetail {

	private String confDetailUuid;
	
	private int configDetailId;
	private int productId;
	private int flavorId;
	
	private int isVeg;
	
	private int rateSettingType;
	
	private float qty; //ie Weight
	
	private float displayRate;
	private float actualRate;
	
	public String getConfDetailUuid() {
		return confDetailUuid;
	}
	public void setConfDetailUuid(String confDetailUuid) {
		this.confDetailUuid = confDetailUuid;
	}

	
	
	public int getConfigDetailId() {
		return configDetailId;
	}
	public void setConfigDetailId(int configDetailId) {
		this.configDetailId = configDetailId;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getFlavorId() {
		return flavorId;
	}
	public void setFlavorId(int flavorId) {
		this.flavorId = flavorId;
	}
	public int getIsVeg() {
		return isVeg;
	}
	public void setIsVeg(int isVeg) {
		this.isVeg = isVeg;
	}
	public int getRateSettingType() {
		return rateSettingType;
	}
	public void setRateSettingType(int rateSettingType) {
		this.rateSettingType = rateSettingType;
	}
	public float getQty() {
		return qty;
	}
	public void setQty(float qty) {
		this.qty = qty;
	}
	public float getDisplayRate() {
		return displayRate;
	}
	public void setDisplayRate(float displayRate) {
		this.displayRate = displayRate;
	}
	public float getActualRate() {
		return actualRate;
	}
	public void setActualRate(float actualRate) {
		this.actualRate = actualRate;
	}
	
	@Override
	public String toString() {
		return "FEProdDetail [confDetailUuid=" + confDetailUuid + ", configDetailId=" + configDetailId + ", productId="
				+ productId + ", flavorId=" + flavorId + ", isVeg=" + isVeg + ", rateSettingType=" + rateSettingType
				+ ", qty=" + qty + ", displayRate=" + displayRate + ", actualRate=" + actualRate + "]";
	}
	
}
