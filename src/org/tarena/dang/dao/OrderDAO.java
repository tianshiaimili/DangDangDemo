package org.tarena.dang.dao;

import java.util.List;
import java.util.Map;

import org.tarena.dang.pojo.Item;
import org.tarena.dang.pojo.Order;
import org.tarena.dang.pojo.Receive_Address;

public interface OrderDAO {
	public List<Receive_Address> findAllreceiveAddress(Map<String,Object> session)throws Exception;

	public void saveAddressByUserId(int userId, Receive_Address address) throws Exception;

	public Receive_Address findReceiveAddressByIdAction(int addressId)throws Exception;

	public void saveOrder(Order order)throws Exception;

	public void saveItem(Item item)throws Exception;


}
