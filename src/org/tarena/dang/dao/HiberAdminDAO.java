package org.tarena.dang.dao;

import java.util.List;

import org.tarena.dang.pojo.Admin;
import org.tarena.dang.pojo.User;
import org.tarena.dang.util.MD5Util;

public class HiberAdminDAO extends BaseDAO implements AdminDAO {

	@Override
	public Admin checkAdmin(String name, String password) throws Exception {
		String hql="from Admin where name=?";
		System.out.println(name);
		System.out.println(password);
		Admin admin= (Admin) getSession().createQuery(hql).setString(0, name).uniqueResult();
		if(admin==null){
			return null;
		}else{
			if(password.equals(admin.getPassword())){
				System.out.println("登陆成功！！");
				return admin;
			}else{
				return null;
			}
		}

	}

	@Override
	public List<Admin> fingAllAdmin() throws Exception {
		return (List<Admin>)getSession().createQuery("from Admin").list();
	}

	@Override
	public void editAdminById(int id, String password, int grade)
			throws Exception {
		Admin admin=(Admin) getSession().get(Admin.class, id);
		admin.setPassword(password);
		admin.setGrade(grade);
		getSession().saveOrUpdate(admin);
	}

	@Override
	public List<User> finAllUser() throws Exception {
		
		return (List<User>)getSession().createQuery("from User").list();
	}

	@Override
	public void editUserById(int id, String password, int userIntegral)
			throws Exception {
		User user=(User) getSession().get(User.class, id);
		if(!user.getPassword().equals(password)){
			user.setPassword(MD5Util.digest(password));
		}
		user.setUserIntegral(userIntegral);
		getSession().saveOrUpdate(user);
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteUserById(int id) throws Exception {
		User user=(User) getSession().get(User.class, id);
		getSession().delete(user);
		
	}
	
}
