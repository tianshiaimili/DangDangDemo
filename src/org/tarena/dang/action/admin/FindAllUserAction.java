package org.tarena.dang.action.admin;

import java.util.List;

import org.tarena.dang.dao.AdminDAO;
import org.tarena.dang.dao.HiberAdminDAO;
import org.tarena.dang.pojo.User;

public class FindAllUserAction {
	//input null
	//output
	private List<User> users;
	
	public String execute() throws Exception{
		AdminDAO dao=new HiberAdminDAO();
		users=dao.finAllUser();
		return "success";
	}

	public List<User> getUsers() {
		return users;
	}
	public void setUsers(List<User> users) {
		this.users = users;
	}
}
