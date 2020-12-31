package com.ats.ecommerce.model;

public class TempImageHolder {

	private int itemId;
	private String imgName;
	private String imgFile;
	
	private float weight;
	private String uniqueId;
	
	
	
	
	public float getWeight() {
		return weight;
	}
	public void setWeight(float weight) {
		this.weight = weight;
	}
	public String getUniqueId() {
		return uniqueId;
	}
	public void setUniqueId(String uniqueId) {
		this.uniqueId = uniqueId;
	}
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public String getImgName() {
		return imgName;
	}
	public void setImgName(String imgName) {
		this.imgName = imgName;
	}
	public String getImgFile() {
		return imgFile;
	}
	public void setImgFile(String imgFile) {
		this.imgFile = imgFile;
	}
	
	@Override
	public String toString() {
		return "TempImageHolder [itemId=" + itemId + ", imgName=" + imgName + ", imgFile=" + imgFile + ", weight="
				+ weight + ", uniqueId=" + uniqueId + "]";
	}
}
