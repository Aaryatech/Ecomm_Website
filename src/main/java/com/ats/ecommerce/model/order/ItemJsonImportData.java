package com.ats.ecommerce.model.order;

public class ItemJsonImportData {

	private int itemId;
	private String itemName;
	private float price;
	private float qty;
	private float total;
	private float cgstPer;
	private float sgstPer;
	private float igstPer;
	private String specialremark;
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public float getQty() {
		return qty;
	}
	public void setQty(float qty) {
		this.qty = qty;
	}
	public float getTotal() {
		return total;
	}
	public void setTotal(float total) {
		this.total = total;
	}
	public float getCgstPer() {
		return cgstPer;
	}
	public void setCgstPer(float cgstPer) {
		this.cgstPer = cgstPer;
	}
	public float getSgstPer() {
		return sgstPer;
	}
	public void setSgstPer(float sgstPer) {
		this.sgstPer = sgstPer;
	}
	public float getIgstPer() {
		return igstPer;
	}
	public void setIgstPer(float igstPer) {
		this.igstPer = igstPer;
	}
	public String getSpecialremark() {
		return specialremark;
	}
	public void setSpecialremark(String specialremark) {
		this.specialremark = specialremark;
	}
	@Override
	public String toString() {
		return "ItemJsonImportData [itemId=" + itemId + ", itemName=" + itemName + ", price=" + price + ", qty=" + qty
				+ ", total=" + total + ", cgstPer=" + cgstPer + ", sgstPer=" + sgstPer + ", igstPer=" + igstPer
				+ ", specialremark=" + specialremark + "]";
	}
	
	
}
