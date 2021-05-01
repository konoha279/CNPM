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
	@GeneratedValue
	private String ID;
	@ManyToOne
	@JoinColumn(name = "MaSize")
	private Size size;
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
	@Column(name = "TỉnhTrang")
	private Boolean status;
	@Column(name = "SoLuong")
	private int amount;
	
	@ManyToOne
	@JoinColumn(name = "MaDanhMuc")
	private ProductList productlist;
	
	@OneToMany(mappedBy = "MaHangHoa", fetch = FetchType.EAGER)
	private Collection<CTHangHoa> CT_HangHoa;
	
	public Product() {
		// TODO Auto-generated constructor stub
	}

	public Product(String iD, Size size, String name, int price, int discount, String image, String notes,
			Boolean status, int amount, ProductList productlist) {
		ID = iD;
		this.size = size;
		this.name = name;
		this.price = price;
		this.discount = discount;
		this.image = image;
		this.notes = notes;
		this.status = status;
		this.amount = amount;
		this.productlist = productlist;
	}
	
	

	public Product(String iD, Size size, String name, int price, int discount, String image, String notes,
			Boolean status, int amount, ProductList productlist, Collection<CTHangHoa> cT_HangHoa) {
		super();
		ID = iD;
		this.size = size;
		this.name = name;
		this.price = price;
		this.discount = discount;
		this.image = image;
		this.notes = notes;
		this.status = status;
		this.amount = amount;
		this.productlist = productlist;
		CT_HangHoa = cT_HangHoa;
	}

	public String getID() {
		return ID;
	}

	public void setID(String iD) {
		ID = iD;
	}

	public Size getSize() {
		return size;
	}

	public void setSize(Size size) {
		this.size = size;
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

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
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
