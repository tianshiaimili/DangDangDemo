package org.tarena.dang.action.user;

import org.tarena.dang.action.BaseAction;
import org.tarena.dang.dao.HiberUserDAO;
import org.tarena.dang.dao.UserDAO;
import org.tarena.dang.pojo.User;
import org.tarena.dang.util.Constant;

import com.opensymphony.xwork2.Action;

public class CheckUserAction extends BaseAction{
	private User user;
	public String execute() throws Exception{
		System.out.println("**********************  ");
		UserDAO dao=new HiberUserDAO();
		System.out.println("dao = "+dao);
		user=dao.checkUser(user);
		if(user==null){
			return "back";
		}else{
			if(user.getIsEmailVerify().equals(Constant.VERIFY_YES)){
				session.put("user", user);
				System.out.println("session的长度++++++++++++++++++++++++++++++++++++++++++++++++++"+session.size());
				return Action.SUCCESS;
			}else{
				return "check";
			}
		}
	}
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
}
