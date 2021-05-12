package com.entity;


import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name = "HangHoa")
public class Product {
	@Id
	@Column(name = "MaHangHoa")
	private String id;
	@Column(name = "TenHangHoa")
	private String name;
	@Column(name = "DonGia")
	private int price;
	@Column(name = "GiamGia")
	private int discount;
	@Column(name = "Anh")
	private String image;
	@Column(name = "GhiChu")
	private String notes;
	@Column(name = "TinhTrang", columnDefinition = "BOOLEAN")
	private Boolean status;
	
	@ManyToOne
	@JoinColumn(name = "MaDanhMuc")
	private ProductList productlist;
	
	@OneToMany(mappedBy = "MaHangHoa", fetch = FetchType.EAGER)
	private Collection<CTHangHoa> CT_HangHoa;
	
	public Product() {
		// TODO Auto-generated constructor stub
	}

	public Product(String iD, String name, int price, int discount, String image, String notes,
			Boolean status, ProductList productlist) {
		id = iD;
		this.name = name;
		this.price = price;
		this.discount = discount;
		this.image = image;
		this.notes = notes;
		this.status = status;
		this.productlist = productlist;
	}
	
	

	public Product(String iD, String name, int price, int discount, String image, String notes,
			Boolean status, ProductList productlist, Collection<CTHangHoa> cT_HangHoa) {
		super();
		id = iD;
		this.name = name;
		this.price = price;
		this.discount = discount;
		this.image = image;
		this.notes = notes;
		this.status = status;
		this.productlist = productlist;
		CT_HangHoa = cT_HangHoa;
	}

	public String getID() {
		return id;
	}

	public void setID(String iD) {
		id = iD;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}

	public ProductList getProductlist() {
		return productlist;
	}

	public void setProductlist(ProductList productlist) {
		this.productlist = productlist;
	}

	public Collection<CTHangHoa> getCT_HangHoa() {
		return CT_HangHoa;
	}

	public void setCT_HangHoa(Collection<CTHangHoa> cT_HangHoa) {
		CT_HangHoa = cT_HangHoa;
	}
	
	
	
}
