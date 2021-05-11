package com.entity;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Role")
public class Role {

	@Id
	@Column(name ="id")
	public String id;
	@Column(name ="name")
	public String name;
	
	@OneToMany(mappedBy = "role", fetch = FetchType.EAGER)
	public Collection<Account> listAccounts ;
	
	public Role() {
	}
	
	public Role(String id, String name, Collection<Account> listAccounts) {
		super();
		this.id = id;
		this.name = name;
		this.listAccounts = listAccounts;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Collection<Account> getListAccounts() {
		return listAccounts;
	}
	public void setListAccounts(Collection<Account> listAccounts) {
		this.listAccounts = listAccounts;
	}
	
	
}
