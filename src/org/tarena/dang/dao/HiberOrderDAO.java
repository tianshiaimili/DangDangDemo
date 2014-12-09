package org.tarena.dang.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.tarena.dang.pojo.Item;
import org.tarena.dang.pojo.Order;
import org.tarena.dang.pojo.Receive_Address;
import org.tarena.dang.pojo.User;

public class HiberOrderDAO extends BaseDAO implements OrderDAO{

	public List<Receive_Address> findAllreceiveAddress(Map<String,Object> session) throws Exception {
		List<Receive_Address> address=new ArrayList<Receive_Address>();
		User user=new User();
		user=(User)session.get("user");
		System.out.println("session是＋＋＋＋＋＋"+user.getId());
//		String hql="from User u join u.address a where u.id=?";
//		address=(List<Receive_Address>) getSession().createQuery(hql).setInteger(0, user.getId()).list();
		user=(User) getSession().get(User.class, user.getId());
//		address=user.getAddress();
		address=(List<Receive_Address>) getSession().createQuery("from Receive_Address where userId=?").setInteger(0, user.getId()).list();
		System.out.println(address);
		return address;
	}

	public void saveAddressByUserId(int userId, Receive_Address address) throws Exception {
		// TODO 保存用户的收货地址
		System.out.println("saveAddressByUserId开启！");
//		User user=(User) getSession().get(User.class, userId);
//		List<Receive_Address> userAddress= user.getAddress();
		Receive_Address newAddress=address;
		newAddress.setUserId(userId);
		getSession().saveOrUpdate(newAddress);
//		userAddress.add(newAddress);
//		user.setAddress(userAddress);
//		getSession().saveOrUpdate(user);
	}

	public Receive_Address findReceiveAddressByIdAction(int addressId) throws Exception {
		// TODO Auto-generated method stub
		return (Receive_Address) getSession().get(Receive_Address.class,addressId);
	}

	public void saveOrder(Order order) throws Exception {
		getSession().saveOrUpdate(order);
		// TODO Auto-generated method stub
		
	}

	public void saveItem(Item item) throws Exception {
		// TODO Auto-generated method stub
		getSession().saveOrUpdate(item);
		
	}
}
