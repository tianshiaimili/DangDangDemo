package org.tarena.dang.action.user;

import org.tarena.dang.action.BaseAction;
import org.tarena.dang.dao.HiberUserDAO;
import org.tarena.dang.dao.UserDAO;
import org.tarena.dang.pojo.User;
import com.opensymphony.xwork2.Action;

public class ValidEmailAction extends BaseAction{
	private String email;
	private boolean ok=false;
	public String execute()throws Exception{
		System.out.println("ValidEmailActionbegin...1");
		UserDAO dao=new HiberUserDAO();
		User user=dao.findByEmail(email);
		System.out.println("ValidEmailActionbegin...2user="+user);
		if(user==null){
			ok=true;
		}else{
			ok=false;
		}
		return Action.SUCCESS;
		
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public boolean isOk() {
		return ok;
	}
	public void setOk(boolean ok) {
		this.ok = ok;
	}
}
