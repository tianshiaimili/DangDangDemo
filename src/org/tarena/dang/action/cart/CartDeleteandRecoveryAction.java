package org.tarena.dang.action.cart;

import org.tarena.dang.action.BaseAction;
import org.tarena.dang.service.CartFactory;
import org.tarena.dang.service.CartService;

public class CartDeleteandRecoveryAction extends BaseAction{
	//input 
	private int id;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	//output null
	public String execute() throws Exception{
		CartService cart=CartFactory.getInstance(session);
		cart.changeIsBuyState(id);
		return "success";
	}
	
}
