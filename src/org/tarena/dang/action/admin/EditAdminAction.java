package org.tarena.dang.action.admin;

import org.tarena.dang.dao.AdminDAO;
import org.tarena.dang.dao.HiberAdminDAO;

public class EditAdminAction {
	//by id to editAdmin
	//input
	private int id;

	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	private String password;
	private int grade;
	//output null
	public String execute() throws Exception{
		AdminDAO dao=new HiberAdminDAO();
		dao.editAdminById(id,password,grade);
		return "success";
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

}
