package org.tarena.dang.dao;

import java.util.List;

import net.sf.cglib.core.EmitUtils;

import org.hibernate.Session;
import org.tarena.dang.pojo.Product;
import org.tarena.dang.pojo.User;
import org.tarena.dang.util.Constant;
import org.tarena.dang.util.HibernateUtil;
import org.tarena.dang.util.MD5Util;

public class HiberUserDAO extends BaseDAO implements UserDAO {
	
	public void save(User user) throws Exception{
		// TODO Auto-generated method 
		Session session=null;
		try {
			session=getSession();
			session.saveOrUpdate(user);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw e;
		}
		
	}
	@Override
	public User findByEmail(String email) throws Exception {
		// TODO Auto-generated method stub
		Session session=null;
		User user=null;
		try {
			session=getSession();
			
			user=(User) session.createQuery("from User where email=?").setString(0, email).uniqueResult();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw e;
		}
		return user;
		}

	public User findByNickname(String nickname) throws Exception {
		// TODO Auto-generated method stub
		User user=null;
		try {
			user=(User) getSession().createQuery("from User where nickname=?").setString(0, nickname).uniqueResult();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw e;
		}
		return user;
	}

	public User findByEmailVerifyCode(String emailVerifyCode) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("HiberUserDAO-findByEmailVerifyCode-begin....");
		User user=null;
		try {
			user=(User) getSession().createQuery("from User where emailVerifyCode=?").setString(0, emailVerifyCode).uniqueResult();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	
		return user;
	}

	public User changeEmailVerifyState(String code) throws Exception {
		User user=null;
		try {
			user=(User) getSession().createQuery("from User where emailVerifyCode=?").setString(0,code).uniqueResult();
			user.setIsEmailVerify(Constant.VERIFY_YES); 
			getSession().getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return user;
	}

	/**
	 * 判断用户是否登录*/
	public User checkUser(User user) throws Exception {
		// TODO Auto-generated method stub
		if(user != null){
			User user2=null;
			user2=(User) getSession().createQuery("from User where email=?").setString(0, user.getEmail()).uniqueResult();
			if(user2==null){
				return null;
			}else{
				if(user2.getPassword().equals(MD5Util.digest(user.getPassword()))){
					return user2;
				}else{
					return null;
				}
			}
		}else {
			return null;
		}
	}
	}
	
