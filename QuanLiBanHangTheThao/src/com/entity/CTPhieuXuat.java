package com.entity;

import java.io.Serializable;

import javax.persistence.*;

@Entity
@Table(name = "CT_PhieuXuat")
public class CTPhieuXuat implements Serializable {
	@Id
	@ManyToOne()
	@JoinColumn(name = "MaPX")
	private PhieuXuat phieuXuat;

	@Id
	@ManyToOne
	@JoinColumns({ 
		@JoinColumn(name = "MaHangHoa", referencedColumnName = "MaHangHoa",insertable = false), 
		@JoinColumn(name = "MaSize", referencedColumnName = "MaSize",insertable = false) 
		})
	private CTHangHoa cTHangHoa;
	@Column(name = "SoLuong")
	private int soLuong;
	public PhieuXuat getPhieuXuat() {
		return phieuXuat;
	}
	public void setPhieuXuat(PhieuXuat phieuXuat) {
		this.phieuXuat = phieuXuat;
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
	public CTPhieuXuat(PhieuXuat phieuXuat, CTHangHoa cTHangHoa, int soLuong) {
		super();
		this.phieuXuat = phieuXuat;
		this.cTHangHoa = cTHangHoa;
		this.soLuong = soLuong;
	}
	
	
	public CTPhieuXuat() {
		// TODO Auto-generated constructor stub
	}
	
	
}
