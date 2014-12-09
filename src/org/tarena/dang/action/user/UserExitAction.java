package org.tarena.dang.action.user;

import org.tarena.dang.action.BaseAction;

public class UserExitAction extends BaseAction{
	//input
	//output
	public String execute(){
		session.remove("user");
		return "success";
	}
}
