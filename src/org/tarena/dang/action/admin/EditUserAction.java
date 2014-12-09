package org.tarena.dang.action.admin;

import org.tarena.dang.dao.AdminDAO;
import org.tarena.dang.dao.HiberAdminDAO;

public class EditUserAction {
	//intput
	private int id;
	private String password;

	private int userIntegral;
	//output Null
	public String execute() throws Exception{
		AdminDAO dao=new HiberAdminDAO();
		dao.editUserById(id,password,userIntegral);
		return "success";
	}
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getUserIntegral() {
		return userIntegral;
	}
	public void setUserIntegral(int userIntegral) {
		this.userIntegral = userIntegral;
	}
}
