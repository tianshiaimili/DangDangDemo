package org.tarena.dang.action.order;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.tarena.dang.action.BaseAction;
import org.tarena.dang.dao.HiberOrderDAO;
import org.tarena.dang.dao.OrderDAO;
import org.tarena.dang.pojo.Item;
import org.tarena.dang.pojo.Order;
import org.tarena.dang.pojo.Receive_Address;
import org.tarena.dang.pojo.User;
import org.tarena.dang.service.CartFactory;
import org.tarena.dang.service.CartItem;
import org.tarena.dang.service.CartService;
import org.tarena.dang.util.HibernateUtil;

public class SaveOrderAndAddressAction extends BaseAction{
	//input
	private Receive_Address address;
	private int addressId=0;
	//output
	private int orderCode;
	private double totalPrice;
	
	public double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getAddressId() {
		return addressId;
	}
	public String execute() throws Exception{
		//生成并保存订单
		System.out.println("生成并保存订单启动！！");
		User user=(User) session.get("user");
		System.out.println();
		System.out.println("新用户的id为＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝"+user.getId());
		CartService cart=CartFactory.getInstance(session);
		totalPrice=cart.coat();
		Order order=new Order();
		order.setUserId(user.getId());
		order.setStatus(1);
		order.setOrderTime(System.currentTimeMillis());
		order.setOrderDesc("订单简介！");
		order.setTotalPrice(cart.coat());
		order.setReceiveName(address.getReceiveName());
		order.setFullAddress(address.getFullAddress());
		order.setPostalCode(address.getPostalCode());
		order.setMobile(address.getMobile());
		order.setPhone(address.getPhone());
		OrderDAO dao=new HiberOrderDAO();
		dao.saveOrder(order);
		orderCode=order.getId();
//		Set<Item> items=new HashSet<Item>();
//		Item item=new Item();
		List<CartItem> citems=cart.getList();
		for(CartItem citem:citems){
			Item item=new Item();
			item.setOrderId(orderCode);
			item.setProductId(citem.getProduct().getId());
			item.setProductName(citem.getProduct().getProductName());
			item.setDangPrice(citem.getProduct().getDangPrice());
			item.setProductNum(citem.getQty());
			item.setAmount(citem.getPrice());
//			items.add(item);
			dao.saveItem(item);
		}	
//		order.setItems(items);
//		dao.saveOrder(order);
		//保存地址
		System.out.println("＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝保存地址启动！！");
		System.out.println(addressId);
		if(addressId==0){
			int userId=user.getId();
			dao.saveAddressByUserId(userId,address);
		}
		//清空购物车
		System.out.println("＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝清空购物车！！");
		session.remove("cart");
		
		return "success";
	}
	public Receive_Address getAddress() {
		return address;
	}
	public void setAddress(Receive_Address address) {
		this.address = address;
	}

	public int getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(int orderCode) {
		this.orderCode = orderCode;
	}
	public void setAddressId(int addressId) {
		this.addressId = addressId;
	}
}
