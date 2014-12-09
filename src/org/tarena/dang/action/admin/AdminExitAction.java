package org.tarena.dang.action.admin;

import org.tarena.dang.action.BaseAction;

public class AdminExitAction extends BaseAction{
	//input
	//output
	public String execute(){
		session.remove("admin");
		return "success";
	}
}
