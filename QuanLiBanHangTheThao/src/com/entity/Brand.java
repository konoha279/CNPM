package com.entity;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name ="ThuongHieu")
public class Brand {
	@Id
	@Column(name = "id")
	private String id;
	@Column(name = "TenThuongHieu")
	private String name;
	
	@OneToMany(mappedBy = "brand", fetch = FetchType.EAGER)
	private Collection<Product> products;
	
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
	public Brand(String id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	
	public Brand() {
		// TODO Auto-generated constructor stub
	}
	
	public int getSizeProduct()
	{
		return this.products.size();
	}
}
