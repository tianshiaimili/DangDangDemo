package org.tarena.dang.service;

import java.util.List;

public interface CartService {
	public boolean add(int id)throws Exception;
	public boolean modify(int id,int qty) throws Exception;
	public List<CartItem> getList()throws Exception;
	public double coat() throws Exception;
	public double eco()throws Exception;
	public void changeIsBuyState(int id)throws Exception;
}
