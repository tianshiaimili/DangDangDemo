package org.tarena.dang.action.user;

import org.tarena.dang.action.BaseAction;
import org.tarena.dang.dao.HiberUserDAO;
import org.tarena.dang.dao.UserDAO;
import org.tarena.dang.pojo.User;
import org.tarena.dang.service.UserService;
import org.tarena.dang.service.UserServiceImpl;
import org.tarena.dang.util.MD5Util;
import org.tarena.dang.util.UUIDUtil;

import freemarker.ext.servlet.HttpRequestHashModel;

public class RegisterAction extends BaseAction {
	private User user;
	public String execute() throws Exception{
		/*
		 * 获取user对象
		 * 调用userserviceimpl下的regist方法补全属性
		 * 存储user对象
		 * 返回
		 * */
		//获取ip地址
		System.out.println(user.getEmail());
		System.out.println(user.getNickname());
		System.out.println(user.getPassword());
		String ip=httpRequest.getRemoteAddr();
		user.setLastLoginIp(ip);
		UserService userService=new UserServiceImpl();
		user=userService.regist(user);
		session.put("user", user);
		return "verify";
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
}
