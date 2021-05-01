package com.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
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

	@Id
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
	private String status;
	@Column(name = "TongTien")
	private int money;
	@ManyToOne
	@JoinColumn(name = "MaKhachHang")
	private Guest guest;
	
	public Bill() {
		// TODO Auto-generated constructor stub
	}

	public Bill(String id, Date date, Staff staff, String status, int money, Guest guest) {
		super();
		this.id = id;
		this.date = date;
		this.staff = staff;
		this.status = status;
		this.money = money;
		this.guest = guest;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public Guest getGuest() {
		return guest;
	}

	public void setGuest(Guest guest) {
		this.guest = guest;
	}
	
	
	
}
