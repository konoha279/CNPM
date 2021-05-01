package com.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name ="KhachHang")
public class Guest {

	@Id @GeneratedValue
	@Column(name = "MaKhachHang")
	private String Id;
	@Column(name = "Ho")
	private String FirstName;
	@Column(name = "Ten")
	private String Name;
	@Column(name = "GioiTinh")
	private Boolean Sex;
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	@Column(name = "NgaySinh")
	private Date birthday;
	@Column(name = "Sdt")
	private String PhoneNumber;
	@ManyToOne
	@JoinColumn(name = "username")
	private Account accountGuest;
	
	public Guest() {
		// TODO Auto-generated constructor stub
	}

	public Guest(String firstName, String name, Boolean sex, String phoneNumber, Account accountGuest) {
		FirstName = firstName;
		Name = name;
		Sex = sex;
		PhoneNumber = phoneNumber;
		this.accountGuest = accountGuest;
	}



	public Guest(String firstName, String name, Boolean sex, Date birthday, String phoneNumber,
			Account accountGuest) {
		FirstName = firstName;
		Name = name;
		Sex = sex;
		this.birthday = birthday;
		PhoneNumber = phoneNumber;
		this.accountGuest = accountGuest;
	}

	public Guest(String id, String firstName, String name, Boolean sex, String phoneNumber, Account account) {
		super();
		Id = id;
		FirstName = firstName;
		Name = name;
		Sex = sex;
		PhoneNumber = phoneNumber;
		this.accountGuest = account;
	}

	public String getId() {
		return Id;
	}

	public void setId(String id) {
		Id = id;
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

	public Boolean getSex() {
		return Sex;
	}

	public void setSex(Boolean sex) {
		Sex = sex;
	}

	public String getPhoneNumber() {
		return PhoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		PhoneNumber = phoneNumber;
	}

	public Account getAccount() {
		return accountGuest;
	}

	public void setAccount(Account account) {
		this.accountGuest = account;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public Account getAccountGuest() {
		return accountGuest;
	}

	public void setAccountGuest(Account accountGuest) {
		this.accountGuest = accountGuest;
	}
}
