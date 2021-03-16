package com.ats.ecommerce.model;

public class SimilarFalvrNameDetail {
	
	private int filterId;
	private String flavorName;
	private String productId;
	public int getFilterId() {
		return filterId;
	}
	public void setFilterId(int filterId) {
		this.filterId = filterId;
	}
	public String getFlavorName() {
		return flavorName;
	}
	public void setFlavorName(String flavorName) {
		this.flavorName = flavorName;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	@Override
	public String toString() {
		return "SimilarFalvrNameDetail [filterId=" + filterId + ", flavorName=" + flavorName + ", productId="
				+ productId + "]";
	}
	
	

}
