package com.atss.ecommerce.model;

public class TempImageHolder {

	private int itemId;
	private String imgName;
	private String imgFile;
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
		return "TempImageHolder [itemId=" + itemId + ", imgName=" + imgName + ", imgFile=" + imgFile + "]";
	}
}
