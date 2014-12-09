package org.tarena.dang.action.admin;

import java.util.List;

import org.tarena.dang.dao.AdminDAO;
import org.tarena.dang.dao.HiberAdminDAO;
import org.tarena.dang.pojo.Admin;

public class FindAllAdminAction {
	//input null
	//output
	private List<Admin> admins;
	public String execute() throws Exception{
		AdminDAO dao=new HiberAdminDAO();
		admins=dao.fingAllAdmin();
		return "success";
	}
	public List<Admin> getAdmins() {
		return admins;
	}
	public void setAdmins(List<Admin> admins) {
		this.admins = admins;
	}
}
