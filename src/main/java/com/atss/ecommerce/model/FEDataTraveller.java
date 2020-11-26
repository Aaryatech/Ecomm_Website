package com.atss.ecommerce.model;

import java.util.List;



public class FEDataTraveller {

	List<FEProductHeader> feProductHeadList; //each header includes list of details inside
	
	List<CategoryList> companyCatList; //category list For Company 
	
	List<CategoryList> franchiseCatList; //category list For Franchise 

	List<GetFlavorTagStatusList> flavorTagStatusList; //List of Flavor,Tag,Status (separate it in FE by filter Type)
	
	List<FETestimonial> testimonialList; //Common to Franchise and Company having comma separated frIds.
	
	List<FEBannerList> companyBannerList; //Banner List for Company
	
	List<FEBannerList> franchiseBannerList; //Banner List for Franchise
	
	 List<Franchise> frList;   //All Active Franchise List by Master company Id

	 List<FestiveEvent> festEventList;  //All Festive Events List and comma separated productIds 24-11-2020

	 List<CateFilterConfig> catFilterConfig;//Filter configured to Category 26-11-2020

	 
	 
	 
	public List<CateFilterConfig> getCatFilterConfig() {
		return catFilterConfig;
	}

	public void setCatFilterConfig(List<CateFilterConfig> catFilterConfig) {
		this.catFilterConfig = catFilterConfig;
	}

	public List<FEProductHeader> getFeProductHeadList() {
		return feProductHeadList;
	}

	public void setFeProductHeadList(List<FEProductHeader> feProductHeadList) {
		this.feProductHeadList = feProductHeadList;
	}

	public List<CategoryList> getCompanyCatList() {
		return companyCatList;
	}

	public void setCompanyCatList(List<CategoryList> companyCatList) {
		this.companyCatList = companyCatList;
	}

	public List<CategoryList> getFranchiseCatList() {
		return franchiseCatList;
	}

	public void setFranchiseCatList(List<CategoryList> franchiseCatList) {
		this.franchiseCatList = franchiseCatList;
	}

	public List<GetFlavorTagStatusList> getFlavorTagStatusList() {
		return flavorTagStatusList;
	}

	public void setFlavorTagStatusList(List<GetFlavorTagStatusList> flavorTagStatusList) {
		this.flavorTagStatusList = flavorTagStatusList;
	}

	public List<FETestimonial> getTestimonialList() {
		return testimonialList;
	}

	public void setTestimonialList(List<FETestimonial> testimonialList) {
		this.testimonialList = testimonialList;
	}

	public List<FEBannerList> getCompanyBannerList() {
		return companyBannerList;
	}

	public void setCompanyBannerList(List<FEBannerList> companyBannerList) {
		this.companyBannerList = companyBannerList;
	}

	public List<FEBannerList> getFranchiseBannerList() {
		return franchiseBannerList;
	}

	public void setFranchiseBannerList(List<FEBannerList> franchiseBannerList) {
		this.franchiseBannerList = franchiseBannerList;
	}

	public List<Franchise> getFrList() {
		return frList;
	}

	public void setFrList(List<Franchise> frList) {
		this.frList = frList;
	}
	 
	
	
	public List<FestiveEvent> getFestEventList() {
		return festEventList;
	}

	public void setFestEventList(List<FestiveEvent> festEventList) {
		this.festEventList = festEventList;
	}

	@Override
	public String toString() {
		return "FEDataTraveller [feProductHeadList=" + feProductHeadList + ", companyCatList=" + companyCatList
				+ ", franchiseCatList=" + franchiseCatList + ", flavorTagStatusList=" + flavorTagStatusList
				+ ", testimonialList=" + testimonialList + ", companyBannerList=" + companyBannerList
				+ ", franchiseBannerList=" + franchiseBannerList + ", frList=" + frList + ", festEventList="
				+ festEventList + ", catFilterConfig=" + catFilterConfig + "]";
	}

	
	 
}
