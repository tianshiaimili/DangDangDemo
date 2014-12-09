package org.tarena.dang.service;

import org.tarena.dang.pojo.Product;

public class CartItem {
	private Product product;
	private int qty=1;
	private boolean buy=true;
	private double price;

	public double getPrice() {
		return qty*product.getDangPrice();
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public boolean isBuy() {
		return buy;
	}
	public void setBuy(boolean buy) {
		this.buy = buy;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
}
