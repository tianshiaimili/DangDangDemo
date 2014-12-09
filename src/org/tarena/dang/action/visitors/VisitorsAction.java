package org.tarena.dang.action.visitors;

import org.tarena.dang.action.BaseAction;
import org.tarena.dang.dao.HiberUserDAO;
import org.tarena.dang.dao.UserDAO;
import org.tarena.dang.pojo.User;
import org.tarena.dang.util.Constant;

import com.opensymphony.xwork2.Action;
//可参考 关于SessionAwre的使用 http://blog.csdn.net/puffCN/article/details/5607557
public class VisitorsAction extends BaseAction{
	
	private User user;
	public String execute() throws Exception{
		System.out.println("**********************  ");
		UserDAO dao=new HiberUserDAO();
		System.out.println("dao = "+dao);
		user=dao.checkUser(user);
		if(user==null){
			return "success";
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
