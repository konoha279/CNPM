package com.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "PhieuNhap")
public class Receipt {

	@Id
	@GeneratedValue
	@Column(name = "MaPN")
	private String id;
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "MM/dd/yyyy")
	@Column(name ="Ngay")
	private Date date;
	
	@ManyToOne
	@JoinColumn(name = "MaNV")
	private Staff staff;
	
	public Receipt() {
		// TODO Auto-generated constructor stub
	}
	

	public Receipt(String id, Date date, Staff staff) {
		super();
		this.id = id;
		this.date = date;
		this.staff = staff;
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

}
