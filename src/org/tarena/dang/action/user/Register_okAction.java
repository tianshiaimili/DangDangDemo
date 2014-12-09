package org.tarena.dang.action.user;

import org.tarena.dang.action.BaseAction;
import org.tarena.dang.dao.HiberUserDAO;
import org.tarena.dang.dao.UserDAO;
import org.tarena.dang.pojo.User;

import com.opensymphony.xwork2.Action;

public class Register_okAction extends BaseAction{
	// code=emailVerifyCode
	private String code;
	private User user;
	public String execute() throws Exception{
		System.out.println("Register_okAction-begin");
		UserDAO dao=new HiberUserDAO();
		user=dao.changeEmailVerifyState(code);
		session.put("user", user);
		return Action.SUCCESS;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public User getUser() {
		return user;
	}
}
