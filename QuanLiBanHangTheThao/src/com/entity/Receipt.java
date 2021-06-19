package com.entity;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "PhieuNhap")
public class Receipt {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "MaPN")
	private String id;
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "MM/dd/yyyy")
	@Column(name ="NgayNhap")
	private Date date;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "MM/dd/yyyy")
	@Column(name ="NgayXacNhan")
	private Date dateConfirm;
	
	@ManyToOne
	@JoinColumn(name = "MaNV")
	private Staff staff;
	
	@Column(name ="TinhTrang")
	private boolean status;
	
	@OneToMany(mappedBy = "phieuNhap", fetch = FetchType.EAGER)
	@Fetch(value = FetchMode.SUBSELECT)
	private Collection<CTPhieuNhap> ctPhieuNhaps;
	
	public Receipt() {
		// TODO Auto-generated constructor stub
	}
	

	public Receipt(Date date, Staff staff) {
		super();
		this.date = date;
		this.staff = staff;
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


	public Collection<CTPhieuNhap> getCtPhieuNhaps() {
		return ctPhieuNhaps;
	}


	public void setCtPhieuNhaps(Collection<CTPhieuNhap> ctPhieuNhaps) {
		this.ctPhieuNhaps = ctPhieuNhaps;
	}


	public Date getDateConfirm() {
		return dateConfirm;
	}


	public void setDateConfirm(Date dateConfirm) {
		this.dateConfirm = dateConfirm;
	}


	public boolean isStatus() {
		return status;
	}


	public void setStatus(boolean status) {
		this.status = status;
	}
	
	

}
