package com.entity;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name ="ChiNhanh")
public class Branch {
	@Id
	@Column(name ="MaCN")
	private String id;
	@Column(name ="TenChiNhanh")
	private String name;
	@Column(name = "DiaChi")
	private String address;
	@OneToMany(mappedBy = "branch", fetch = FetchType.EAGER)
	private Collection<Staff> staffs;
	
	
	public Branch() {
		// TODO Auto-generated constructor stub
	}
	public Branch(String id, String name, String address) {
		super();
		this.id = id;
		this.name = name;
		this.address = address;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Collection<Staff> getStaffs() {
		return staffs;
	}
	public void setStaffs(Collection<Staff> staffs) {
		this.staffs = staffs;
	}
	
	

}
