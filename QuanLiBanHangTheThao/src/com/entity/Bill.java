package com.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "HoaDon")
public class Bill {

	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "MaHoaDon")
	private String id;
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "MM/dd/yyyy")
	@Column(name ="Ngay")
	private Date date;
	@ManyToOne
	@JoinColumn(name = "MaNV")
	private Staff staff;
	@Column(name ="TinhTrang")
	private boolean status;
	@Column(name = "TongTienSanPham")
	private int moneyProduct;
	@Column(name = "PhiVanChuyen")
	private int transportationFee;
	@ManyToOne
	@JoinColumn(name = "Username")
	private Account account;
	@Column(name = "DiaChiNhanHang")
	private String address;
	public Bill() {
		// TODO Auto-generated constructor stub
	}

	public Bill(String id, Date date, Staff staff, boolean status, int moneyProduct, int transportationFee,
			Account account, String address) {
		super();
		this.id = id;
		this.date = date;
		this.staff = staff;
		this.status = status;
		this.moneyProduct = moneyProduct;
		this.transportationFee = transportationFee;
		this.account = account;
		this.address = address;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Staff getStaff() {
		return staff;
	}

	public void setStaff(Staff staff) {
		this.staff = staff;
	}


	

	public boolean isStatus() {
		return status;
	}



	public void setStatus(boolean status) {
		this.status = status;
	}



	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getMoneyProduct() {
		return moneyProduct;
	}

	public void setMoneyProduct(int moneyProduct) {
		this.moneyProduct = moneyProduct;
	}

	public int getTransportationFee() {
		return transportationFee;
	}

	public void setTransportationFee(int transportationFee) {
		this.transportationFee = transportationFee;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	
}
