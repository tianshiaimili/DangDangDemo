package org.tarena.dang.dao;

import java.util.List;

import org.tarena.dang.pojo.Admin;
import org.tarena.dang.pojo.User;

public interface AdminDAO {

	public Admin checkAdmin(String name, String password)throws Exception;

	public List<Admin> fingAllAdmin()throws Exception;

	public void editAdminById(int id, String password, int grade)throws Exception;

	public List<User> finAllUser()throws Exception;

	public void editUserById(int id, String password, int userIntegral)throws Exception;

	public void deleteUserById(int id)throws Exception;
		
}
