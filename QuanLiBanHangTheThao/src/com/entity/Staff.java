package com.entity;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "NhanVien")
public class Staff {
	@Id
	@Column(name = "MaNV")
	private String id;
	@Column(name = "Ho")
	private String FirstName;
	@Column(name = "Ten")
	private String Name;
	@Column(name ="DiaChi")
	private String address;
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "MM/dd/yyyy")
	@Column(name ="NgaySinh")
	private Date birthday;
	
	@ManyToOne
	@JoinColumn(name = "MaCN")
	private Branch branch;
	
	@Column(name =" TinhTrang")
	private Boolean status;
	@Column(name ="GioiTinh")
	private Boolean sex;
	
	@ManyToOne
	@JoinColumn(name = "username")
	private Account accountStaff;
	
	@OneToMany(mappedBy = "staff", fetch = FetchType.EAGER)
	private Collection<Receipt> receipts;
	
	public Staff() {
		// TODO Auto-generated constructor stub
	}
	
	

	public Staff(String id, String firstName, String name, String address, Date birthday, Branch branch, Boolean status,
			Boolean sex, Account account) {
		super();
		this.id = id;
		FirstName = firstName;
		Name = name;
		this.address = address;
		this.birthday = birthday;
		this.branch = branch;
		this.status = status;
		this.sex = sex;
		this.accountStaff = account;
	}



	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getFirstName() {
		return FirstName;
	}

	public void setFirstName(String firstName) {
		FirstName = firstName;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public Branch getBranch() {
		return branch;
	}

	public void setBranch(Branch branch) {
		this.branch = branch;
	}

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}

	public Boolean getSex() {
		return sex;
	}

	public void setSex(Boolean sex) {
		this.sex = sex;
	}

	public Account getAccount() {
		return accountStaff;
	}

	public void setAccount(Account account) {
		this.accountStaff = account;
	}
	
	public String getFullName()
	{
		return FirstName + " " + Name;
	}
	
}