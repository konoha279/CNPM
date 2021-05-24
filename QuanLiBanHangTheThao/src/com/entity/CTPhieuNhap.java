package com.entity;

import java.io.Serializable;

import javax.persistence.*;

@Entity
@Table(name = "CTPN")
public class CTPhieuNhap implements Serializable {
	@Id
	@ManyToOne
	@JoinColumn(name = "MaPN")
	private Receipt phieuNhap;

	@Id
	@ManyToOne
	@JoinColumns({ @JoinColumn(name = "MaHangHoa"), @JoinColumn(name = "MaSize") })
	private CTHangHoa cTHangHoa;
	@Column(name = "DonGia")
	private int donGia;
	@Column(name = "SoLuong")
	private int soLuong;
	public CTPhieuNhap(Receipt phieuNhap, CTHangHoa cTHangHoa, int donGia, int soLuong) {
		super();
		this.phieuNhap = phieuNhap;
		this.cTHangHoa = cTHangHoa;
		this.donGia = donGia;
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
	public int getDonGia() {
		return donGia;
	}
	public void setDonGia(int donGia) {
		this.donGia = donGia;
	}
	public int getSoLuong() {
		return soLuong;
	}
	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}

	
	
}
