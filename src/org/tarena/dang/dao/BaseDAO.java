package org.tarena.dang.dao;

import org.hibernate.Session;
import org.tarena.dang.util.HibernateUtil;

public  class BaseDAO {
	public Session getSession(){
		return HibernateUtil.getSession();
	} 
	public void closeSession(){
		HibernateUtil.closeSession();
	}
}
