package com.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "DanhSachYeuThich")
public class WishList {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private String id;
	@ManyToOne
	@JoinColumn(name = "Username")
	private Account account;
	@ManyToOne
	@JoinColumn(name = "MaHangHoa")
	private Product sanPham;
	
	public WishList() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	public WishList(Account account, Product sanPham) {
		super();
		this.account = account;
		this.sanPham = sanPham;
	}



	public WishList(String id, Account account, Product sanPham) {
		super();
		this.id = id;
		this.account = account;
		this.sanPham = sanPham;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Account getAccount() {
		return account;
	}
	public void setAccount(Account account) {
		this.account = account;
	}
	public Product getSanPham() {
		return sanPham;
	}
	public void setSanPham(Product sanPham) {
		this.sanPham = sanPham;
	}
	
	
	
}
