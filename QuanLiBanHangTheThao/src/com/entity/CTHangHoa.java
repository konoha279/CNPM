package com.entity;

import java.io.Serializable;

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
	private int SoLuong;
	
	public CTHangHoa() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	public CTHangHoa(Product maHangHoa, Size maSize, int soLuong) {
		MaHangHoa = maHangHoa;
		size = maSize;
		SoLuong = soLuong;
	}



	public Product getMaHangHoa() {
		return MaHangHoa;
	}
	public void setMaHangHoa(Product maHangHoa) {
		MaHangHoa = maHangHoa;
	}
	public Size getMaSize() {
		return size;
	}
	public void setMaSize(Size maSize) {
		size = maSize;
	}
	public int getSoLuong() {
		return SoLuong;
	}
	public void setSoLuong(int soLuong) {
		SoLuong = soLuong;
	}
	
	
	
}
