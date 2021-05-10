package com.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
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
	private String firstName;
	@Column(name = "Ten")
	private String name;
	@Column(name = "GioiTinh")
	private Boolean sex;
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	@Column(name = "NgaySinh")
	private Date birthday;
	@Column(name = "Sdt")
	private String phoneNumber;
	@OneToOne
	@JoinColumn(name = "username")
	private Account accountGuest;
	
	public Guest() {
		// TODO Auto-generated constructor stub
	}
	
	public Guest(String id, String firstName, String name, Boolean sex, Date birthday, String phoneNumber,
			Account accountGuest) {
		super();
		Id = id;
		this.firstName = firstName;
		this.name = name;
		this.sex = sex;
		this.birthday = birthday;
		this.phoneNumber = phoneNumber;
		this.accountGuest = accountGuest;
	}

	public Guest(String firstName, String name, Boolean sex, Date birthday, String phoneNumber, Account accountGuest) {
		super();
		this.firstName = firstName;
		this.name = name;
		this.sex = sex;
		this.birthday = birthday;
		this.phoneNumber = phoneNumber;
		this.accountGuest = accountGuest;
	}
	
	public Guest(String firstName, String name, Boolean sex, String birthday, String phoneNumber, Account accountGuest) {
		super();
		this.firstName = firstName;
		this.name = name;
		this.sex = sex;
		this.setBirthday(birthday);
		this.phoneNumber = phoneNumber;
		this.accountGuest = accountGuest;
	}


	public String getId() {
		return Id;
	}

	public void setId(String id) {
		Id = id;
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

	public Boolean getSex() {
		return sex;
	}

	public void setSex(Boolean sex) {
		this.sex = sex;
	}

	public Date getBirthday() {
		return birthday;
	}
	
	public String getBirthday_str() {
		return new SimpleDateFormat("yyyy-MM-dd").format(this.birthday) ;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	
	public void setBirthday(String birthday) {
		try {
			this.birthday = new SimpleDateFormat("yyyy-MM-dd").parse(birthday);

		} catch (Exception e) {
			// TODO: handle exception
			this.birthday = null;
		}
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public Account getAccountGuest() {
		return accountGuest;
	}

	public void setAccountGuest(Account accountGuest) {
		this.accountGuest = accountGuest;
	}

	public String getFullname()
	{
		return this.getFirstName() + " " + this.getName();
	}
	
}
