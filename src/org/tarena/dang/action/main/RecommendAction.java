package org.tarena.dang.action.main;

import java.util.List;

import org.tarena.dang.dao.HiberProductDAO;
import org.tarena.dang.dao.ProductDAO;

public class RecommendAction {
	private int size=2;
	private List<Object[]> recommentBooks;
	public String execute() throws Exception{
		ProductDAO dao=new HiberProductDAO();
		recommentBooks=dao.findBooksByrecomment(size);
		return "success";
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public List<Object[]> getRecommentBooks() {
		return recommentBooks;
	}
	public void setRecommentBooks(List<Object[]> recommentBooks) {
		this.recommentBooks = recommentBooks;
	}


}
