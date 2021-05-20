package com.entity;



import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
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
	@ManyToOne
	@JoinColumn(name = "Role")
	private Role role;
	@Column(name = "Active")
	private Boolean active;
	
	
	  @OneToOne(mappedBy = "accountGuest", fetch = FetchType.EAGER) 
	private Guest guest;
	  
	  @OneToOne(mappedBy = "accountStaff", fetch = FetchType.EAGER) 
	private Staff staff;
	 
	  @OneToMany(mappedBy = "accountCmt")
	private Collection<Comment> comments;
	
	public Account() {
		// TODO Auto-generated constructor stub
	}
	
	public Account(String username, String password, String email, Role role, Boolean active) {
		super();
		this.username = username;
		this.password = password;
		this.email = email;
		this.role = role;
		this.active = active;
	}


	public Account(String username, String password, String email, Role role, Boolean active, Guest guest,
			Staff staff) {
		super();
		this.username = username;
		this.password = password;
		this.email = email;
		this.role = role;
		this.active = active;
		this.guest = guest;
		this.staff = staff;
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

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
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

	public Collection<Comment> getComments() {
		return comments;
	}

	public void setComments(Collection<Comment> comments) {
		this.comments = comments;
	}

	
	
	
}
