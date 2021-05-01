package com.bean;

public class Item {
	private String image;
	private String name;
	private int Price;
	
	public Item(String image, String name, int price) {
		super();
		this.image = image;
		this.name = name;
		Price = price;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return Price;
	}
	public void setPrice(int price) {
		Price = price;
	}
	
	

}
