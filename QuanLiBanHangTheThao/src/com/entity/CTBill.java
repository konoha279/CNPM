package com.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "CTHD")
public class CTBill implements Serializable {
	
	@Id
	@ManyToOne
	@JoinColumn(name = "MaHoaDon")
	private Bill bill;
	@Id
	@ManyToOne()
	@JoinColumns({
		@JoinColumn(name = "MaHangHoa", referencedColumnName = "MaHangHoa"), 
		@JoinColumn(name = "MaSize", referencedColumnName = "MaSize") 
		})
	private CTHangHoa cTHangHoa;
	
	@Column(name = "SoLuong")
	private int count;
	@Column(name = "KhuyenMai")
	private int promotion;
	
	public CTBill() {
		// TODO Auto-generated constructor stub
	}
	
	public CTBill(Bill bill, CTHangHoa cTHangHoa, int count, int promotion) {
		super();
		this.bill = bill;
		this.cTHangHoa = cTHangHoa;
		this.count = count;
		this.promotion = promotion;
	}
	public Bill getBill() {
		return bill;
	}
	public void setBill(Bill bill) {
		this.bill = bill;
	}
	public CTHangHoa getcTHangHoa() {
		return cTHangHoa;
	}
	public void setcTHangHoa(CTHangHoa cTHangHoa) {
		this.cTHangHoa = cTHangHoa;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPromotion() {
		return promotion;
	}
	public void setPromotion(int promotion) {
		this.promotion = promotion;
	}
	
	
}
