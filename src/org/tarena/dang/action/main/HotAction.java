package org.tarena.dang.action.main;

import java.util.List;
import org.tarena.dang.dao.ProductDAO;
import org.tarena.dang.action.BaseAction;
import org.tarena.dang.dao.HiberProductDAO;
import org.tarena.dang.pojo.Product;

public class HotAction extends BaseAction{
	//input
	private int size=4;
	//output
	private List<Object[]> pros;
	public String execute() throws Exception{
		ProductDAO dao=new HiberProductDAO();
		pros=dao.findProductByProductNum(size);
		return "success";
	}
	public List<Object[]> getPros() {
		return pros;
	}
	public void setPros(List<Object[]> pros) {
		this.pros = pros;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	
}
