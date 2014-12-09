package org.tarena.dang.service;

import org.tarena.dang.dao.HiberUserDAO;
import org.tarena.dang.dao.UserDAO;
import org.tarena.dang.pojo.User;
import org.tarena.dang.util.Constant;
import org.tarena.dang.util.EmailUtil;
import org.tarena.dang.util.MD5Util;
import org.tarena.dang.util.UUIDUtil;

public class UserServiceImpl implements UserService {

	@Override
	public User regist(User user) throws Exception {
		// TODO Auto-generated method stub
		UserDAO dao=new HiberUserDAO();
		String newPwd=MD5Util.digest(user.getPassword());
		user.setPassword(newPwd);
		user.setUserIntegral(Constant.INTEGRAL_NORMAL);
		//����������֤״̬
		user.setIsEmailVerify(Constant.VERIFY_NO);
		//��ȡ������֤��
		String emailCode=UUIDUtil.generator();
		user.setEmailVerifyCode(emailCode);
		//��ȡ��ǰʱ��
		user.setLastLoginTime(System.currentTimeMillis());
		//��user���������ݿ�
		dao.save(user);
		//����������֤���ͻ���������д
		EmailUtil.sendEmail(user.getEmail(), 
				user.getEmailVerifyCode());
		return user;
	}

}
