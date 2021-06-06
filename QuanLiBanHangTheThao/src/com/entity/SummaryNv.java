package com.entity;

import java.util.Date;
import java.util.List;

public class SummaryNv {

	private int totalProducts;
	private long totalMoney;
	
	private String name;
	private String id;
	
	public SummaryNv(int totalProducts, long totalMoney, String name, String id) {
		super();
		this.totalProducts = totalProducts;
		this.totalMoney = totalMoney;
		this.name = name;
		this.id = id;
	}

	public int getTotalProducts() {
		return totalProducts;
	}

	public void setTotalProducts(int totalProducts) {
		this.totalProducts = totalProducts;
	}

	public long getTotalMoney() {
		return totalMoney;
	}

	public void setTotalMoney(long totalMoney) {
		this.totalMoney = totalMoney;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	
	public static int isExist(List<SummaryNv> list,String id) {
		for(int i = 0; i < list.size();i++) {
			if(list.get(i).getId().equals(id)) {
				return i;
			}
		}
		return -1;
	}
	
	
	
}
