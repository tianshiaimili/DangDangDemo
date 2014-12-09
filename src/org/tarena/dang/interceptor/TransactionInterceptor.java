package org.tarena.dang.interceptor;


import org.hibernate.Transaction;
import org.tarena.dang.util.HibernateUtil;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
public class TransactionInterceptor extends AbstractInterceptor{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		Transaction tx=HibernateUtil.getSession().beginTransaction();
		System.out.println("开启事务");
		try {
			invocation.invoke();
			tx.commit();
			System.out.println("事物关闭");
			return null;
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
			throw e;
		}finally{
			HibernateUtil.closeSession();
		}

	}
}
