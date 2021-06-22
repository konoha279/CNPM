package com.bean;

import java.util.ArrayList;
import java.util.List;

import com.entity.PhieuXuat;
import com.entity.Receipt;

public class ReceiptReport extends ObjectReport {

	private int countProductNhap;
	private List<Receipt> receipts;
	private int countProductXuat;
	private List<PhieuXuat> phieuXuats;
	public ReceiptReport() {
		// TODO Auto-generated constructor stub
	}
	
	

	public ReceiptReport(int id, String date, int countProductNhap, List<Receipt> receipts, int countProductXuat,
			List<PhieuXuat> phieuXuats) {
		super(id, date);
		this.countProductNhap = countProductNhap;
		this.receipts = receipts;
		this.countProductXuat = countProductXuat;
		this.phieuXuats = phieuXuats;
	}



	public ReceiptReport(int id, String date, int countProduct, List<Receipt> receipts) {
		super(id, date);
		this.countProductNhap = countProduct;
		this.receipts = receipts;
	}

	

	public int getCountProductNhap() {
		return countProductNhap;
	}



	public void setCountProductNhap(int countProductNhap) {
		this.countProductNhap = countProductNhap;
	}



	public int getCountProductXuat() {
		return countProductXuat;
	}



	public void setCountProductXuat(int countProductXuat) {
		this.countProductXuat = countProductXuat;
	}



	public List<PhieuXuat> getPhieuXuats() {
		return phieuXuats;
	}



	public void setPhieuXuats(List<PhieuXuat> phieuXuats) {
		this.phieuXuats = phieuXuats;
	}



	public int getCountProduct() {
		return countProductNhap;
	}



	public void setCountProduct(int countProduct) {
		this.countProductNhap = countProduct;
	}



	public List<Receipt> getReceipts() {
		return receipts;
	}
	public void setReceipts(List<Receipt> receipts) {
		this.receipts = receipts;
	}
	
	
	
}
