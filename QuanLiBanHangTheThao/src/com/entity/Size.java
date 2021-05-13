package com.entity;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Size")
public class Size {
	@Id
	@Column(name = "MaSize")
	public String size;
	
	@OneToMany(mappedBy = "size", fetch = FetchType.EAGER)
	private Collection<CTHangHoa> ctHangHoa;
	
	public Size() {
		// TODO Auto-generated constructor stub
	}

	public Size(String size) {
		super();
		this.size = size;
	}

	public String getSize() {
		return size.trim();
	}

	public void setSize(String size) {
		this.size = size;
	}

	
	

}
