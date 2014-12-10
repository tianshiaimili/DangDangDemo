package org.tarena.dang.interceptor;


import org.apache.log4j.Logger;
import org.hibernate.Transaction;
import org.tarena.dang.util.HibernateUtil;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
public class TransactionInterceptor extends AbstractInterceptor{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Logger mLogger = Logger.getLogger(TransactionInterceptor.class);
	
	
	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		Transaction tx=HibernateUtil.getSession().beginTransaction();
		System.out.println("开启事务");
		mLogger.error("**********************开启事物");
		mLogger.error("****************HibernateUtil.getSession()  == "+HibernateUtil.getSession());
		try {
		
			invocation.invoke();
			mLogger.error("*******************- - ");
			tx.commit();
			System.out.println("事物关闭");
			mLogger.error("**********************事物关闭");
			return null;
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
			mLogger.error("*********error  == "+e.getMessage());
			throw e;
		}finally{
			HibernateUtil.closeSession();
		}

	}
}
