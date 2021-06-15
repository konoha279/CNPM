package com.bean;

import java.util.ArrayList;
import java.util.List;

import com.entity.Bill;

public class BillReports extends ObjectReport {
	protected List<Bill> bills;

	protected ArrayList<Integer> value;
	
	
	public BillReports(int id, String date, ArrayList<Integer> value) {
		super(id, date);
		this.value = value;
	}
	public BillReports(int id, String date, List<Bill> bills, ArrayList<Integer> value) {
		super(id, date);
		this.bills = bills;
		this.value = value;
	}
	public List<Bill> getBills() {
		return bills;
	}
	public void setBills(List<Bill> bills) {
		this.bills = bills;
	}
	
	public ArrayList<Integer> getValue() {
		return value;
	}
	public void setValue(ArrayList<Integer> value) {
		this.value = value;
	}
}
