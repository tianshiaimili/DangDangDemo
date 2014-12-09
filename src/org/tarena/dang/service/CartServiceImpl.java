package org.tarena.dang.service;

import java.util.ArrayList;
import java.util.List;

import org.tarena.dang.dao.HiberProductDAO;
import org.tarena.dang.dao.ProductDAO;

public class CartServiceImpl implements CartService {
	public List<CartItem> items=new ArrayList<CartItem>();
	public boolean add(int id) throws Exception {
		// TODO Auto-generated method stub
		ProductDAO dao=new HiberProductDAO();
		CartItem item=new CartItem();
		item.setProduct(dao.findProductById(id));
		for(int i=0;i<items.size();i++){
			if(id==items.get(i).getProduct().getId()){
				return false;
			}
		}
		items.add(item);
		return true;
	}

	public double coat() throws Exception {
		double coat=0;
		for(int i=0;i<items.size();i++){
			CartItem item=items.get(i);
			if(item.isBuy()){
				coat+=item.getProduct().getDangPrice()*item.getQty();
			}
		}
		System.out.println("人______________________________________________"+coat);
		return coat;
	}

	public List<CartItem> getList() throws Exception {
		return items;
	}

	public boolean modify(int id, int qty) throws Exception {
		for(int i=0;i<items.size();i++){
			CartItem item=items.get(i);
			if(id==item.getProduct().getId()){
			    item.setQty(qty);
			    return item.isBuy();
			}
		}
		return false;

	}

	public double eco() throws Exception {
		double eco=0;
		for(int i=0;i<items.size();i++){
			CartItem item=items.get(i);
			if(item.isBuy()){
				eco+=(item.getProduct().getFixedPrice()-item.getProduct().getDangPrice())*item.getQty();
			}
		}
		System.out.println("人______________________________________________"+eco);
		return eco;
	}

	public void changeIsBuyState(int id) throws Exception {
		for(int i=0;i<items.size();i++){
			CartItem item=items.get(i);
			if(id==item.getProduct().getId()){
				if(item.isBuy()){
					item.setBuy(false);
				}else{
					item.setBuy(true);
				}
			}
		}	
	}
}
