package org.tarena.dang.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.tarena.dang.pojo.Product;

public class HiberProductDAO extends BaseDAO implements ProductDAO {

	@Override
	public List<Product> findTopProducts(int size) throws Exception {
		String hql="from Product where hasDeleted=0 order by addTime desc ";
		Query query=getSession().createQuery(hql);
		query.setFirstResult(0);
		query.setMaxResults(size);
		return query.list();
	}

	@Override
	public List findBooksByrecomment(int size) throws Exception {
//		String sql=" from d_product dp join d_book db on(dp.id=db.id) order by rand() limit 0,2";
//		Query query=getSession().createSQLQuery(sql);
		String hql="select b.productName,b.productPic, b.author,b.publishing,b.publishTime ," +
				"b.fixedPrice,b.dangPrice,b.description from Book b order by rand()";
		Query query=getSession().createQuery(hql);
		
		return query.setFirstResult(0).setMaxResults(size).list();
	}

	@Override
	public List<Product> findProductByCatId(int cid, int page, int pageSize)
			throws Exception {
		System.out.println("cid="+cid+"page="+page+"pageSize="+pageSize);
		String hql = 
		    "select product " +
			"from Category c " +
			"join c.pros product " +
			"where c.id=?";
	Query query = getSession().createQuery(hql);
	query.setInteger(0, cid);
	int begin = (page-1)*pageSize;
	query.setFirstResult(begin);
	query.setMaxResults(pageSize);
	return query.list();
	}

	public List findProductByProductNum(int size) throws Exception {
		String hql="select p.productName,p.fixedPrice,p.dangPrice,p.productPic from Product p inner join p.items i group by i.productId order by sum(i.productNum) desc";
		Query query=getSession().createQuery(hql);
		List<Object[]> objs=query.setFirstResult(0).setMaxResults(size).list();
		System.out.println(objs.size());
		return objs;
	}

	public List<Object[]> findNewProductByProductNum(int size) throws Exception {
		String hql="select p.productName,p.fixedPrice,p.dangPrice,p.productPic from Product p inner join p.items i where p.addTime<? group by i.productId order by sum(i.productNum) desc";
		Query query=getSession().createQuery(hql).setDouble(0, System.currentTimeMillis()-(1000*60*60*24*30*3+1000*60*60*24*30*12*4));
		List<Object[]> objs=query.setFirstResult(0).setMaxResults(size).list();
		System.out.println(objs.size());
		return objs;
	}

	public Product findProductById(int id) throws Exception {
		Product product=(Product) getSession().get(Product.class,id);
		return product;
	}	
}
