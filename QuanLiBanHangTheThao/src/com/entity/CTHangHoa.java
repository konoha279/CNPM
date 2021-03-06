package com.entity;

import java.io.Serializable;
import java.util.HashSet;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name ="CTHangHoa")
public class CTHangHoa implements Serializable {

	@Id
	@ManyToOne
	@JoinColumn(name = "MaHangHoa")
	private Product MaHangHoa;
	@Id
	@ManyToOne
	@JoinColumn(name = "MaSize")
	private Size size;
	@Column(name = "SoLuong")
	private int soLuong;
	
	public CTHangHoa() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	public CTHangHoa(Product maHangHoa, Size size) {
		super();
		MaHangHoa = maHangHoa;
		this.size = size;
	}



	public CTHangHoa(Product maHangHoa, Size size, int soLuong) {
		super();
		this.MaHangHoa = maHangHoa;
		this.size = size;
		this.soLuong = soLuong;
	}


	public Product getMaHangHoa() {
		return MaHangHoa;
	}


	public void setMaHangHoa(Product maHangHoa) {
		this.MaHangHoa = maHangHoa;
	}


	public int getSoLuong() {
		return soLuong;
	}
	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}



	public Size getSize() {
		return size;
	}



	public void setSize(Size size) {
		this.size = size;
	}
	
	
	
}
