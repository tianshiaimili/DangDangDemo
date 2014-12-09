package org.tarena.dang.action.admin;

import java.util.List;

import org.apache.log4j.Logger;
import org.tarena.dang.action.BaseAction;
import org.tarena.dang.dao.AdminDAO;
import org.tarena.dang.dao.HiberAdminDAO;
import org.tarena.dang.pojo.Admin;

public class CheckAdminAction extends BaseAction{
	//input
	private String name;
	private String password;
	private Logger mLogger = Logger.getLogger(CheckAdminAction.class);
	//output
	public String execute() throws Exception{
		AdminDAO dao=new HiberAdminDAO();
		mLogger.info("name= "+name);
		mLogger.info("password= "+password);
		Admin admin=dao.checkAdmin(name,password);
		if(admin==null){
			return "back";
		}else{
			session.put("admin", admin);
			return "success";
		}

	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
