package com.ats.ecommerce.model.payment;

import java.util.List;

public class GenOrder {

	
	private int amount;
	private String currency;
	private List<Transfer> transfers = null;

	public int getAmount() {
	return amount;
	}

	public void setAmount(int amount) {
	this.amount = amount;
	}

	public String getCurrency() {
	return currency;
	}

	public void setCurrency(String currency) {
	this.currency = currency;
	}

	public List<Transfer> getTransfers() {
	return transfers;
	}

	public void setTransfers(List<Transfer> transfers) {
	this.transfers = transfers;
	}
	
}
