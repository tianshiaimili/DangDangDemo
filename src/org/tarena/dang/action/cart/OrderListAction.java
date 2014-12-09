package org.tarena.dang.action.cart;

import java.util.List;

import org.tarena.dang.action.BaseAction;
import org.tarena.dang.service.CartFactory;
import org.tarena.dang.service.CartItem;
import org.tarena.dang.service.CartService;

public class OrderListAction extends BaseAction{
	//input
	//output
	private List<CartItem> items;
	private double totalPrice;
	private int i=0;
	public void setI(int i) {
		this.i = i;
	}
	public String execute() throws Exception{
		if(session.get("user")==null){
//		if(false){
			session.put("hasbuy","hasbuy");
			return "login";
		}else{
			CartService cart=CartFactory.getInstance(session);
			items=cart.getList();
			totalPrice=cart.coat();
			return "success";
		}
	}
	public List<CartItem> getItems() {
		return items;
	}
	public double getTotalPrice() {
		return totalPrice;
	}
	public int getI() {
		return i;
	}
}
