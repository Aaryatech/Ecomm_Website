package com.ats.ecommerce.model.payment;

import java.util.List;

public class Transfer {
	
	private String account;
	private int amount;
	private String currency;

	/*
	 * private Notes notes; private List<String> linkedAccountNotes = null;
	 */
	/*
	 * private boolean onHold; private int onHoldUntil;
	 */
	public String getAccount() {
	return account;
	}

	public void setAccount(String account) {
	this.account = account;
	}

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

	/*
	 * public Notes getNotes() { return notes; }
	 * 
	 * public void setNotes(Notes notes) { this.notes = notes; }
	 */

	/*
	 * public List<String> getLinkedAccountNotes() { return linkedAccountNotes; }
	 * 
	 * public void setLinkedAccountNotes(List<String> linkedAccountNotes) {
	 * this.linkedAccountNotes = linkedAccountNotes; }
	 */

	@Override
	public String toString() {
		return "Transfer [account=" + account + ", amount=" + amount + ", currency=" + currency + "]";
	} 

	/*
	 * public boolean getOnHold() { return onHold; }
	 * 
	 * public void setOnHold(boolean onHold) { this.onHold = onHold; }
	 * 
	 * public int getOnHoldUntil() { return onHoldUntil; }
	 * 
	 * public void setOnHoldUntil(int onHoldUntil) { this.onHoldUntil = onHoldUntil;
	 * }
	 */
	
	
}
