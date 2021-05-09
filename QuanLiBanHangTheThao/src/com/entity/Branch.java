package com.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
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
	
	

}
