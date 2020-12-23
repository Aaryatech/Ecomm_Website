package com.ats.ecommerce.model.payment;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class ResNotes {
	@SerializedName("branch")
	@Expose
	private String branch;
	@SerializedName("name")
	@Expose
	private String name;

	public String getBranch() {
	return branch;
	}

	public void setBranch(String branch) {
	this.branch = branch;
	}

	public String getName() {
	return name;
	}

	public void setName(String name) {
	this.name = name;
	}

	@Override
	public String toString() {
		return "ResNotes [branch=" + branch + ", name=" + name + "]";
	}

}
