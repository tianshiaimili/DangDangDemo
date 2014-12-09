package org.tarena.dang.action.user;

import org.tarena.dang.dao.HiberUserDAO;
import org.tarena.dang.dao.UserDAO;
import org.tarena.dang.pojo.User;

import com.opensymphony.xwork2.Action;

public class VaildNicknameAction{
	private String nickname;
	private boolean ok=false;
	public String execute() throws Exception{
		System.out.println("vaildNicknamaActionbegin1....");
		UserDAO dao=new HiberUserDAO();
		User user=dao.findByNickname(nickname);
		System.out.println("vaildNicknamaActionbegin2....user="+user);
		System.out.println("ªÒµ√user÷µ£Ω"+user);
		if(user==null){
			ok=true;
		}else{
			ok=false;
		}
		return Action.SUCCESS;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public boolean isOk() {
		return ok;
	}
	public void setOk(boolean ok) {
		this.ok = ok;
	}
}
