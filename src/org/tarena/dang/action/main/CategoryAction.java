package org.tarena.dang.action.main;

import java.util.List;

import org.tarena.dang.dao.CategoryDAO;
import org.tarena.dang.dao.HiberCategoryDAO;
import org.tarena.dang.dao.UserDAO;
import org.tarena.dang.pojo.Category;

public class CategoryAction {
	//input
	private int parentId = 1;
	//output
	private List<Category> cats;
	public String execute() throws Exception{
		CategoryDAO dao=new HiberCategoryDAO();
		cats=dao.findByParentId(parentId);
		return "success";
	}
	public List<Category> getCats() {
		return cats;
	}
	public void setCats(List<Category> cats) {
		this.cats = cats;
	}
	public int getParentId() {
		return parentId;
	}
	public void setParentId(int parentId) {
		this.parentId = parentId;
	}
	
}
