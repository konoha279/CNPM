package com.entity;

import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "NhanVien")
public class Staff {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "MaNV")
	private String id;
	@Column(name = "Ho")
	private String firstName;
	@Column(name = "Ten")
	private String name;
	@Column(name = "CMND")
	private String cmnd;
	@Column(name ="DiaChi")
	private String address;
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name ="NgaySinh")
	private Date birthday;
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name ="NgayVaoLam")
	private Date workday;
	@Column(name = "SoDienThoai")
	private String phoneNumber;
	
	@Column(name =" TinhTrang")
	private Boolean status;
	@Column(name ="GioiTinh")
	private Boolean sex;
	
	@OneToOne
	@JoinColumn(name = "username")
	private Account accountStaff;
	
	@OneToMany(mappedBy = "staff", fetch = FetchType.EAGER)
	private Collection<Receipt> receipts;

	public Staff() {
		// TODO Auto-generated constructor stub
	}
	
	public Staff(String id, String firstName, String name, String address, Date birthday, String phoneNumber,
			Boolean status, Boolean sex, Account accountStaff, Collection<Receipt> receipts) {
		super();
		this.id = id;
		this.firstName = firstName;
		this.name = name;
		this.address = address;
		this.birthday = birthday;
		this.phoneNumber = phoneNumber;
		this.status = status;
		this.sex = sex;
		this.accountStaff = accountStaff;
		this.receipts = receipts;
	}
	
	

	public Staff(String firstName, String name, String cmnd, String address, String phoneNumber, Boolean status, Boolean sex) {
		super();
		this.firstName = firstName;
		this.name = name;
		this.cmnd = cmnd;
		this.address = address;
		this.phoneNumber = phoneNumber;
		this.status = status;
		this.sex = sex;
	}

	public Staff(String id, String firstName, String name, String cmnd, String address, Date birthday, Date workday,
			String phoneNumber, Boolean status, Boolean sex, Account accountStaff) {
		super();
		this.id = id;
		this.firstName = firstName;
		this.name = name;
		this.cmnd = cmnd;
		this.address = address;
		this.birthday = birthday;
		this.workday = workday;
		this.phoneNumber = phoneNumber;
		this.status = status;
		this.sex = sex;
		this.accountStaff = accountStaff;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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
	
	public void setBirthday_Str(String birthday) {
		try {
			this.birthday = new SimpleDateFormat("yyyy-MM-dd").parse(birthday);

		} catch (Exception e) {
			// TODO: handle exception
			this.birthday = null;
		}
	}
	
	public void setWorkday_Str(String workdayStr) {
		try {
			this.workday = new SimpleDateFormat("yyyy-MM-dd").parse(workdayStr);

		} catch (Exception e) {
			// TODO: handle exception
			this.birthday = null;
		}
	}

	public String getCmnd() {
		return cmnd;
	}

	public void setCmnd(String cmnd) {
		this.cmnd = cmnd;
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
	
	public String getFullName()
	{
		return firstName + " " + name;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public Account getAccountStaff() {
		return accountStaff;
	}

	public void setAccountStaff(Account accountStaff) {
		this.accountStaff = accountStaff;
	}

	public Collection<Receipt> getReceipts() {
		return receipts;
	}

	public void setReceipts(Collection<Receipt> receipts) {
		this.receipts = receipts;
	}

	public Date getWorkday() {
		return workday;
	}

	public void setWorkday(Date workday) {
		this.workday = workday;
	}


	
	
}
