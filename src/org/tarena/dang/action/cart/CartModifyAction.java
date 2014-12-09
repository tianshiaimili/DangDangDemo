package org.tarena.dang.action.cart;

import org.tarena.dang.action.BaseAction;
import org.tarena.dang.service.CartFactory;
import org.tarena.dang.service.CartService;

public class CartModifyAction extends BaseAction{
	private int id;
	private int qty;
	public String execute() throws Exception{
		CartService cart=CartFactory.getInstance(session);
		cart.modify(id, qty);
		return "success";
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
}
