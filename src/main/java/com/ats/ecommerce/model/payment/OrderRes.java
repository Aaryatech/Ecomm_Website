package com.ats.ecommerce.model.payment;

import java.util.Arrays;
import java.util.List;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class OrderRes {

	@SerializedName("id")
	@Expose
	private String id;
	@SerializedName("entity")
	@Expose
	private String entity;
	@SerializedName("amount")
	@Expose
	private int amount;
	@SerializedName("amount_paid")
	@Expose
	private int amountPaid;
	@SerializedName("amount_due")
	@Expose
	private int amountDue;
	@SerializedName("currency")
	@Expose
	private String currency;
	@SerializedName("receipt")
	@Expose
	private Object receipt;
	@SerializedName("offer_id")
	@Expose
	private Object offerId;
	@SerializedName("status")
	@Expose
	private String status;
	@SerializedName("attempts")
	@Expose
	private int attempts;
	@SerializedName("notes")
	@Expose
	private List<Object> notes;
	@SerializedName("created_at")
	@Expose
	private int createdAt;
	@SerializedName("transfers")
	@Expose
	private List<TransferRes> transfers;

	public String getId() {
	return id;
	}

	public void setId(String id) {
	this.id = id;
	}

	public String getEntity() {
	return entity;
	}

	public void setEntity(String entity) {
	this.entity = entity;
	}

	public int getAmount() {
	return amount;
	}

	public void setAmount(int amount) {
	this.amount = amount;
	}

	public int getAmountPaid() {
	return amountPaid;
	}

	public void setAmountPaid(int amountPaid) {
	this.amountPaid = amountPaid;
	}

	public int getAmountDue() {
	return amountDue;
	}

	public void setAmountDue(int amountDue) {
	this.amountDue = amountDue;
	}

	public String getCurrency() {
	return currency;
	}

	public void setCurrency(String currency) {
	this.currency = currency;
	}

	public Object getReceipt() {
	return receipt;
	}

	public void setReceipt(Object receipt) {
	this.receipt = receipt;
	}

	public Object getOfferId() {
	return offerId;
	}

	public void setOfferId(Object offerId) {
	this.offerId = offerId;
	}

	public String getStatus() {
	return status;
	}

	public void setStatus(String status) {
	this.status = status;
	}

	public int getAttempts() {
	return attempts;
	}

	public void setAttempts(int attempts) {
	this.attempts = attempts;
	}

	public List<Object> getNotes() {
	return notes;
	}

	public void setNotes(List<Object> notes) {
	this.notes = notes;
	}

	public int getCreatedAt() {
	return createdAt;
	}

	public void setCreatedAt(int createdAt) {
	this.createdAt = createdAt;
	}

	public List<TransferRes> getTransfers() {
	return transfers;
	}

	public void setTransfers(List<TransferRes> transfers) {
	this.transfers = transfers;
	}

	@Override
	public String toString() {
		return "OrderRes [id=" + id + ", entity=" + entity + ", amount=" + amount + ", amountPaid=" + amountPaid
				+ ", amountDue=" + amountDue + ", currency=" + currency + ", receipt=" + receipt + ", offerId="
				+ offerId + ", status=" + status + ", attempts=" + attempts + ", notes=" + notes + ", createdAt="
				+ createdAt + ", transfers=" + transfers + "]";
	}

	
}
