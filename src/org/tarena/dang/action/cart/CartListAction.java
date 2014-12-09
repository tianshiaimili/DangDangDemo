package org.tarena.dang.action.cart;

import java.util.List;

import org.tarena.dang.action.BaseAction;
import org.tarena.dang.service.CartFactory;
import org.tarena.dang.service.CartItem;
import org.tarena.dang.service.CartService;

public class CartListAction extends BaseAction{
	//input null
	//output 
	private List<CartItem> items;

	private double totalPrice;

	private double ecoPrice;
	
	public String execute() throws Exception{
		CartService cart=(CartService)CartFactory.getInstance(session);
		items=cart.getList();
		totalPrice=cart.coat();
		ecoPrice=cart.eco();
		return "success";
	}
	public List<CartItem> getItems() {
		return items;
	}
	public void setItems(List<CartItem> items) {
		this.items = items;
	}

	public double getEcoPrice() {
		return ecoPrice;
	}
	public void setEcoPrice(double ecoPrice) {
		this.ecoPrice = ecoPrice;
	}
	public double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
}
