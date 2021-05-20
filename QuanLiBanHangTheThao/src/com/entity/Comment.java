package com.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "BinhLuanSanPham")
public class Comment {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private String id;
	@Column(name = "NoiDung")
	private String content;
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "HH:mm:ss dd/MM/yyyy")
	@Column(name = "ThoiGian", columnDefinition="DATETIME")
	private Date time;
	@ManyToOne
	@JoinColumn(name = "MaHangHoa")
	private Product productCmt;
	@ManyToOne
	@JoinColumn(name = "Username")
	private Account accountCmt;
	
	public Comment() {
		// TODO Auto-generated constructor stub
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Product getProductCmt() {
		return productCmt;
	}

	public void setProductCmt(Product productCmt) {
		this.productCmt = productCmt;
	}

	public Account getAccountCmt() {
		return accountCmt;
	}

	public void setAccountCmt(Account accountCmt) {
		this.accountCmt = accountCmt;
	}
	
	

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public Comment(String content, Product productCmt, Account accountCmt) {
		super();
		this.content = content;
		this.productCmt = productCmt;
		this.accountCmt = accountCmt;
	}

	public Comment(String content, Date time, Product productCmt, Account accountCmt) {
		super();
		this.content = content;
		this.time = time;
		this.productCmt = productCmt;
		this.accountCmt = accountCmt;
	}
	
	public String getName()
	{
		String name ="";
		if (accountCmt.getStaff() != null)
			name = accountCmt.getStaff().getFullName();
		else
			name = accountCmt.getGuest().getFullname();
		return name;
	}
	
}
