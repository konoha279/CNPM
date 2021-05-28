package com.bean;

import java.util.Date;

public class ObjectReport {
	public String date;
	public int value;
	public int getValue() {
		return value;
	}
	public void setValue(int value) {
		this.value = value;
	}
	
	
	public ObjectReport(String date, int value) {
		super();
		this.date = date;
		this.value = value;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public ObjectReport() {
		// TODO Auto-generated constructor stub
	}
}
