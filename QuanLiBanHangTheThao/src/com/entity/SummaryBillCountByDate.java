package com.entity;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;



public class SummaryBillCountByDate {

	private int totalProducts;

	private Date date;
	
	public SummaryBillCountByDate() {
		// TODO Auto-generated constructor stub
	}
	
	public SummaryBillCountByDate(Bill bill) {
		this.date = bill.getDate();
		
		this.totalProducts = 0;
		for(CTBill b : bill.getCtBills()) {
			this.totalProducts += b.getCount();
		}
		
	}

	public int getTotalProducts() {
		return totalProducts;
	}

	public void setTotalProducts(int totalProducts) {
		this.totalProducts = totalProducts;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
	
	public void setDate(String date) {
		try {
			this.date = new SimpleDateFormat("dd-MM-yyyy").parse(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
