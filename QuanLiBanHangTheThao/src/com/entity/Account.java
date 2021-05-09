package com.entity;



import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
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
	
	
	  @OneToOne(mappedBy = "accountGuest", fetch = FetchType.EAGER) 
	private Guest guest;
	  
	  @OneToOne(mappedBy = "accountStaff", fetch = FetchType.EAGER) 
	private Staff staff;
	 
	
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



	public Guest getGuest() {
		return guest;
	}



	public void setGuest(Guest guest) {
		this.guest = guest;
	}



	public Staff getStaff() {
		return staff;
	}



	public void setStaff(Staff staff) {
		this.staff = staff;
	}

	
	
	
}
