package org.tarena.dang.action.user;

import org.tarena.dang.dao.HiberUserDAO;
import org.tarena.dang.dao.UserDAO;
import org.tarena.dang.pojo.User;

import com.opensymphony.xwork2.Action;

public class ValidEmailCodeAction {
	private String emailVerifyCode;
	private boolean codeResult;
	public String execute() throws Exception{
		System.out.println("ValidEmailCodeAction begin1....");
		UserDAO dao=new HiberUserDAO();
		User user=dao.findByEmailVerifyCode(emailVerifyCode);
		System.out.println("ValidEmailCodeAction begin2....user="+user);
		if(user!=null){
			codeResult=true;
		}else{
			codeResult=false;
		}
		return Action.SUCCESS;
	}
	public boolean isCodeResult() {
		return codeResult;
	}
	public void setCodeResult(boolean codeResult) {
		this.codeResult = codeResult;
	}
	public String getEmailVerifyCode() {
		return emailVerifyCode;
	}
	public void setEmailVerifyCode(String emailVerifyCode) {
		this.emailVerifyCode = emailVerifyCode;
	}
}
