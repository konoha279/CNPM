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
	@Column(name = "id")
	private String id;
	
	@Column(name = "TenSize")
	private String name;
	
	@Column(name = "GhiChu")
	private String notes;
	
	@OneToMany(mappedBy = "size", fetch = FetchType.EAGER)
	private Collection<CTHangHoa> ctHangHoa;
	
	public Size() {
		// TODO Auto-generated constructor stub
	}
	
	

	public Size(String id) {
		super();
		this.id = id;
	}



	public Size(String id, String name, String notes) {
		super();
		this.id = id;
		this.name = name;
		this.notes = notes;
	}



	public Size(String id, String name, Collection<CTHangHoa> ctHangHoa) {
		super();
		this.id = id;
		this.name = name;
		this.ctHangHoa = ctHangHoa;
	}

	

	public Size(String id, String name, String notes, Collection<CTHangHoa> ctHangHoa) {
		super();
		this.id = id;
		this.name = name;
		this.notes = notes;
		this.ctHangHoa = ctHangHoa;
	}



	public String getNotes() {
		return notes;
	}



	public void setNotes(String notes) {
		this.notes = notes;
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

	public Collection<CTHangHoa> getCtHangHoa() {
		return ctHangHoa;
	}

	public void setCtHangHoa(Collection<CTHangHoa> ctHangHoa) {
		this.ctHangHoa = ctHangHoa;
	}

	

	
	

}
