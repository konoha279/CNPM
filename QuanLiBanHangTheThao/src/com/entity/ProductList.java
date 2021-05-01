package com.entity;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "DanhMucSanPham")
public class ProductList {
	@Id
	@Column(name = "MaDanhMuc")
	private String id;
	@Column(name = "TenDanhMuc")
	private String name;

	@OneToMany(mappedBy = "productlist", fetch = FetchType.EAGER)
	private Collection<Product> products;
	
	public ProductList() {
	}
	
	public ProductList(String id, String name) {
		this.id = id;
		this.name = name;
	}
	
	public ProductList(String id, String name, Collection<Product> products) {
		super();
		this.id = id;
		this.name = name;
		this.products = products;
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

	public Collection<Product> getProducts() {
		return products;
	}

	public void setProducts(Collection<Product> products) {
		this.products = products;
	}

	
	
}
