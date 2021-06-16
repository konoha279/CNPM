package com.bean;

import java.util.ArrayList;
import java.util.List;

import com.entity.Receipt;

public class ReceiptReport extends ObjectReport {

	private int countProduct;
	private List<Receipt> receipts;
	public ReceiptReport() {
		// TODO Auto-generated constructor stub
	}
	
	

	public ReceiptReport(int id, String date, int countProduct, List<Receipt> receipts) {
		super(id, date);
		this.countProduct = countProduct;
		this.receipts = receipts;
	}

	

	public int getCountProduct() {
		return countProduct;
	}



	public void setCountProduct(int countProduct) {
		this.countProduct = countProduct;
	}



	public List<Receipt> getReceipts() {
		return receipts;
	}
	public void setReceipts(List<Receipt> receipts) {
		this.receipts = receipts;
	}
	
	
	
}
