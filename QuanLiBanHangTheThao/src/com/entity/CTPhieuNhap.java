package com.entity;

import java.io.Serializable;

import javax.persistence.*;

@Entity
@Table(name = "CTPN")
public class CTPhieuNhap implements Serializable {
	@Id
	@ManyToOne()
	@JoinColumn(name = "MaPN")
	private Receipt phieuNhap;

	@Id
	@ManyToOne
	@JoinColumns({ 
		@JoinColumn(name = "MaHangHoa", referencedColumnName = "MaHangHoa",insertable = false), 
		@JoinColumn(name = "MaSize", referencedColumnName = "MaSize",insertable = false) 
		})
	private CTHangHoa cTHangHoa;
	@Column(name = "SoLuong")
	private int soLuong;
	
	public CTPhieuNhap() {
		// TODO Auto-generated constructor stub
	}
	
	public CTPhieuNhap(Receipt phieuNhap, CTHangHoa cTHangHoa, int soLuong) {
		super();
		this.phieuNhap = phieuNhap;
		this.cTHangHoa = cTHangHoa;
		this.soLuong = soLuong;
	}

	public Receipt getPhieuNhap() {
		return phieuNhap;
	}
	public void setPhieuNhap(Receipt phieuNhap) {
		this.phieuNhap = phieuNhap;
	}
	public CTHangHoa getcTHangHoa() {
		return cTHangHoa;
	}
	public void setcTHangHoa(CTHangHoa cTHangHoa) {
		this.cTHangHoa = cTHangHoa;
	}
	public int getSoLuong() {
		return soLuong;
	}
	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}

	
	
}
