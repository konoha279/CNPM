package com.bean;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.entity.Bill;

public class ObjectReport {
	private int id;
	private String date;
	private ArrayList<Integer> value;
	private List<Bill> bills;
	
	
	
	public ObjectReport(int id, String date, ArrayList<Integer> value, List<Bill> bills) {
		super();
		this.id = id;
		this.date = date;
		this.value = value;
		this.bills = bills;
	}
	public ObjectReport(String date, ArrayList<Integer> value) {
		super();
		this.date = date;
		this.value = value;
	}
	public ArrayList<Integer> getValue() {
		return value;
	}
	public void setValue(ArrayList<Integer> value) {
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
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public List<Bill> getBills() {
		return bills;
	}
	public void setBills(List<Bill> bills) {
		this.bills = bills;
	}
	
	
}
