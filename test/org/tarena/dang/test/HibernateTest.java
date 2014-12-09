package org.tarena.dang.test;

import java.sql.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.junit.Test;
import org.tarena.dang.pojo.Category;
import org.tarena.dang.util.HibernateUtil;

public class HibernateTest {
	@Test
	public void testLoad(){
		Session session=HibernateUtil.getSession();
		List<Category> list=session.createQuery("from Category").list();
		for(Category cate:list){
			System.out.println(cate.getId()+","+cate.getName());
		}
	}
	@Test
	public void testLoad1(){
		Session session=HibernateUtil.getSession();
//		String hql="select p.productName,i.productNum from Product p inner join p.items i";
		String hql="select p.productName,p.fixedPrice,p.dangPrice,p.productPic from Product p inner join p.items i where p.addTime>? group by i.productId order by sum(i.productNum) desc";
		Query query=session.createQuery(hql).setDouble(0, System.currentTimeMillis()-1000*60*60*24*30);
//		Query query=session.createQuery(hql);
		List<Object[]> list=query.list();
		System.out.println(list.get(0));
		System.out.println(list.get(1));
		
		
		
	}
	@SuppressWarnings("deprecation")
	@Test
	public void test1(){
		long a=1237873000234l;
		Date date=new Date(a);
		Logger logger = Logger.getLogger(HibernateTest.class);
		logger.info("啦啦啦啦德玛西亚");
//		logger.debug("啦啦啦德玛西亚");
		System.out.println(date);
		System.out.println(System.currentTimeMillis()-(1000*60*60*24*30+1000*60*60*24*30*12*4)-a);
	}
	@Test
	public void testTime(){
		System.out.println(System.currentTimeMillis());
	}
}
