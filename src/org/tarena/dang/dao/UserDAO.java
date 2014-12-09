package org.tarena.dang.dao;

import java.util.List;

import org.tarena.dang.pojo.Product;
import org.tarena.dang.pojo.User;

public interface UserDAO {
	public  void save(User user) throws Exception;
	public User findByEmail(String email) throws Exception;
	public User findByNickname(String nickname) throws Exception;
	public User findByEmailVerifyCode(String emailVerifyCode) throws Exception;
	public User changeEmailVerifyState(String code)throws Exception;
	public User checkUser(User user) throws Exception;
}
