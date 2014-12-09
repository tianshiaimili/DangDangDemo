package org.tarena.dang.action.order;

import java.util.List;

import org.tarena.dang.dao.HiberOrderDAO;
import org.tarena.dang.dao.OrderDAO;
import org.tarena.dang.pojo.Receive_Address;

public class FindReceiveAddressByIdAction {
	//intput 
	private int addressId;
	//output
	private Receive_Address address;
	
	public String execute() throws Exception{
		OrderDAO dao=new HiberOrderDAO();
		address=(Receive_Address) dao.findReceiveAddressByIdAction(addressId);
		return "success";
	}

	public Receive_Address getAddress() {
		return address;
	}

	public void setAddress(Receive_Address address) {
		this.address = address;
	}

	public int getAddressId() {
		return addressId;
	}
	public void setAddressId(int addressId) {
		this.addressId = addressId;
	}
}
