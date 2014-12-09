package org.tarena.dang.interceptor;

import java.util.Map;

import org.tarena.dang.pojo.User;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
public class CheckLoginState extends AbstractInterceptor{
	public String intercept(ActionInvocation invocation) throws Exception {
		System.out.println("检查登录状态");
		try {
			ActionContext ac=ActionContext.getContext();
			Map<String,Object>session=ac.getSession();
			User user=(User) session.get("user");
			if(user==null){
				return "login";
			}
			invocation.invoke();
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	
}
