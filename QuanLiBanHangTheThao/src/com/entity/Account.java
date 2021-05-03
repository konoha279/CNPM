package com.entity;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name ="TaiKhoan")
public class Account {
	@Id
	@Column(name ="Username")
	private String username;
	@Column(name ="Password")
	private String password;
	@Column(name = "Email")
	private String email;
	@Column(name = "level")
	private int level;
	@Column(name = "Active")
	private Boolean active;
	
	
	  @OneToMany(mappedBy = "accountGuest", fetch = FetchType.EAGER) 
	private Collection<Guest> guests;
	  
	  @OneToMany(mappedBy = "accountStaff", fetch = FetchType.EAGER) 
	private Collection<Staff> staffs;
	 
	
	public Account() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	public Account(String username, String password, String email, int level, Boolean active) {
		super();
		this.username = username;
		this.password = password;
		this.email = email;
		this.level = level;
		this.active = active;
	}



	public Account(String username, String password) {
		this.username = username;
		this.password = password;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public Boolean getActive() {
		return active;
	}

	public void setActive(Boolean active) {
		this.active = active;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Collection<Guest> getGuests() {
		return guests;
	}

	public void setGuests(Collection<Guest> guests) {
		this.guests = guests;
	}



	public Collection<Staff> getStaffs() {
		return staffs;
	}



	public void setStaffs(Collection<Staff> staffs) {
		this.staffs = staffs;
	}
	
}
