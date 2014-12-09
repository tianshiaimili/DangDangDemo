package org.tarena.dang.action.admin;

import org.tarena.dang.dao.AdminDAO;
import org.tarena.dang.dao.HiberAdminDAO;

public class DeleteUserAction {
	//input
	private int id;
	//output null
	
	public String execute() throws Exception{
		AdminDAO dao=new HiberAdminDAO();
		dao.deleteUserById(id);
		return "success";
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	
}
