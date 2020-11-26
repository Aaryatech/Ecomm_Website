package com.atss.ecommerce.model.order;

public class OrderResponse {
	
	private String message; 
    private Boolean error;
    private int frId;
    private int userId;
    private String insertDateTime;
    private int orderId;
    private int status;
    private int addEdit;
    private int paymentStatus;
    private String uuidNo;
    
    public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Boolean getError() {
		return error;
	}
	public void setError(Boolean error) {
		this.error = error;
	}
	public int getFrId() {
		return frId;
	}
	public void setFrId(int frId) {
		this.frId = frId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getInsertDateTime() {
		return insertDateTime;
	}
	public void setInsertDateTime(String insertDateTime) {
		this.insertDateTime = insertDateTime;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getAddEdit() {
		return addEdit;
	}
	public void setAddEdit(int addEdit) {
		this.addEdit = addEdit;
	}
	public int getPaymentStatus() {
		return paymentStatus;
	}
	public void setPaymentStatus(int paymentStatus) {
		this.paymentStatus = paymentStatus;
	}
	public String getUuidNo() {
		return uuidNo;
	}
	public void setUuidNo(String uuidNo) {
		this.uuidNo = uuidNo;
	}
	@Override
	public String toString() {
		return "OrderResponse [message=" + message + ", error=" + error + ", frId=" + frId + ", userId=" + userId
				+ ", insertDateTime=" + insertDateTime + ", orderId=" + orderId + ", status=" + status + ", addEdit="
				+ addEdit + ", paymentStatus=" + paymentStatus + ", uuidNo=" + uuidNo + "]";
	}
    
    
}
