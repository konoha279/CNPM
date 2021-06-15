package com.bean;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.entity.Bill;

public class ObjectReport {
	protected int id;
	protected String date;
	
	
	
	
	
	
	public ObjectReport(int id, String date) {
		super();
		this.id = id;
		this.date = date;
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
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	
	
}
