package org.tarena.dang.dao;

import java.util.List;

import org.tarena.dang.pojo.Category;

public interface CategoryDAO {

	public List<Category> findByParentId(int parentId)throws Exception;

	public Category findById(int pid)throws Exception;
	
}
