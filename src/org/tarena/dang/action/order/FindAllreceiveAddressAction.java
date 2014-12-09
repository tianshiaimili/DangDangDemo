package org.tarena.dang.action.order;

import java.util.List;

import org.tarena.dang.action.BaseAction;
import org.tarena.dang.dao.HiberOrderDAO;
import org.tarena.dang.dao.OrderDAO;
import org.tarena.dang.pojo.Receive_Address;

public class FindAllreceiveAddressAction extends BaseAction{
	//intput null
	//output
	private List<Receive_Address> address;
	public String execute() throws Exception{
		OrderDAO dao=new HiberOrderDAO();
		address=dao.findAllreceiveAddress(session);
		System.out.println("address的长度为================================="+address.size());
		if(address==null){
			return "login";
		}else{
			return "success";
		}
	}

	public List<Receive_Address> getAddress() {
		return address;
	}
}
