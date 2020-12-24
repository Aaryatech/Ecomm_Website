package com.ats.ecommerce.model.offer;

import java.util.List;

public class OrderCheckoutData {

	private DeliveryCharges deliveryCharges;
	private AdditionalCharges additionalCharges;
	private List<OfferList> offerList;
	private List<OfferDetail> offerDetailList;

	public DeliveryCharges getDeliveryCharges() {
		return deliveryCharges;
	}

	public void setDeliveryCharges(DeliveryCharges deliveryCharges) {
		this.deliveryCharges = deliveryCharges;
	}

	public AdditionalCharges getAdditionalCharges() {
		return additionalCharges;
	}

	public void setAdditionalCharges(AdditionalCharges additionalCharges) {
		this.additionalCharges = additionalCharges;
	}

	public List<OfferList> getOfferList() {
		return offerList;
	}

	public void setOfferList(List<OfferList> offerList) {
		this.offerList = offerList;
	}

	public List<OfferDetail> getOfferDetailList() {
		return offerDetailList;
	}

	public void setOfferDetailList(List<OfferDetail> offerDetailList) {
		this.offerDetailList = offerDetailList;
	}

	@Override
	public String toString() {
		return "OrderCheckoutData [deliveryCharges=" + deliveryCharges + ", additionalCharges=" + additionalCharges
				+ ", offerList=" + offerList + ", offerDetailList=" + offerDetailList + "]";
	}

}
