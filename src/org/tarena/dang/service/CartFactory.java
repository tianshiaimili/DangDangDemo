package org.tarena.dang.service;

import java.util.Map;

import org.tarena.dang.util.Constant;

public class CartFactory {
	public static CartService getInstance(
			Map<String, Object> session){
		CartService cart = 
			(CartService)session.get(Constant.CART);
		if(cart == null){
			cart = new CartServiceImpl();
			session.put(Constant.CART, cart);
		}
		return cart;
	}
}
