package com.bean;

import com.entity.CTHangHoa;

public class Cart {
	public CTHangHoa product;
	public int count;
	public Cart(CTHangHoa product, int count) {
		super();
		this.product = product;
		this.count = count;
	}
	public CTHangHoa getProduct() {
		return product;
	}
	public void setProduct(CTHangHoa product) {
		this.product = product;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
}
