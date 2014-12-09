package org.tarena.dang.dao;

import java.util.List;

import org.hibernate.Query;
import org.tarena.dang.pojo.Category;

public class HiberCategoryDAO extends BaseDAO implements CategoryDAO {

	@Override
	
	public List<Category> findByParentId(int parentId) throws Exception {
		System.out.println("findByParentId运行，开始查找分类信息！");
		String hql = "select distinct c " +
		"from Category c " +
		"join fetch c.sublist " +
		"where c.parentId=?";
		Query query = getSession().createQuery(hql);
		query.setInteger(0, parentId);
		System.out.println(query.list().size());
		return query.list();
	}

	@Override
	public Category findById(int id) throws Exception {
		System.out.println("findById运行，开始查找二级分类信息！");
		Category cat = (Category)getSession().get(
				Category.class, id);
		return cat;
	}

}
