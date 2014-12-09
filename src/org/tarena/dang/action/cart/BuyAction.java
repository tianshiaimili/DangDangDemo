package org.tarena.dang.action.cart;

import org.tarena.dang.action.BaseAction;
import org.tarena.dang.service.CartFactory;
import org.tarena.dang.service.CartService;

public class BuyAction extends BaseAction{
	private int id;
	private boolean ok=false;
	public String execute() throws Exception{
		CartService cart=CartFactory.getInstance(session);
		ok=cart.add(id);
		return "success";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public boolean isOk() {
		return ok;
	}
	public void setOk(boolean ok) {
		this.ok = ok;
	}
	
}
