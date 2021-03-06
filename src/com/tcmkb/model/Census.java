package com.tcmkb.model;

import java.util.List;

public class Census {
	
	private String name;
	private String type;
	private String stack;
	private List<String> data;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getStack() {
		return stack;
	}
	public void setStack(String stack) {
		this.stack = stack;
	}
	public List<String> getData() {
		return data;
	}
	public void setData(List<String> data) {
		this.data = data;
	}
	@Override
	public String toString() {
		return "Census [name=" + name + ", type=" + type + ", stack=" + stack
				+ ", data=" + data + "]";
	}
	

}
