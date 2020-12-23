package com.ats.ecommerce.model.payment;

import java.util.List;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class TransferRes {

	@SerializedName("recipient")
	@Expose
	private String recipient;
	@SerializedName("amount")
	@Expose
	private int amount;
	@SerializedName("currency")
	@Expose
	private String currency;
	/*
	 * @SerializedName("notes")
	 * 
	 * @Expose private Notes notes;
	 */
	@SerializedName("linked_account_notes")
	@Expose
	private List<String> linkedAccountNotes = null;
	@SerializedName("on_hold")
	@Expose
	private boolean onHold;
	@SerializedName("on_hold_until")
	@Expose
	private Object onHoldUntil;

	public String getRecipient() {
	return recipient;
	}

	public void setRecipient(String recipient) {
	this.recipient = recipient;
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

	public List<String> getLinkedAccountNotes() {
	return linkedAccountNotes;
	}

	public void setLinkedAccountNotes(List<String> linkedAccountNotes) {
	this.linkedAccountNotes = linkedAccountNotes;
	}

	public boolean isOnHold() {
	return onHold;
	}

	public void setOnHold(boolean onHold) {
	this.onHold = onHold;
	}

	public Object getOnHoldUntil() {
	return onHoldUntil;
	}

	public void setOnHoldUntil(Object onHoldUntil) {
	this.onHoldUntil = onHoldUntil;
	}

	@Override
	public String toString() {
		return "TransferRes [recipient=" + recipient + ", amount=" + amount + ", currency=" + currency
				+ ", linkedAccountNotes=" + linkedAccountNotes + ", onHold=" + onHold + ", onHoldUntil=" + onHoldUntil
				+ "]";
	}

	/*
	 * @Override public String toString() { return "TransferRes [recipient=" +
	 * recipient + ", amount=" + amount + ", currency=" + currency + ", notes=" +
	 * notes + ", linkedAccountNotes=" + linkedAccountNotes + ", onHold=" + onHold +
	 * ", onHoldUntil=" + onHoldUntil + "]"; }
	 */
	
	
}
