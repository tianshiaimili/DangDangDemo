package org.tarena.dang.action.main;

import java.util.List;

import org.hibernate.tool.hbm2x.HibernateConfigurationExporter;
import org.tarena.dang.dao.HiberProductDAO;
import org.tarena.dang.dao.ProductDAO;
import org.tarena.dang.pojo.Product;

import com.opensymphony.xwork2.Action;

public class NewsAction {
	private int size=8;
	private List<Product> products;
	public String execute() throws Exception{
		ProductDAO dao=new HiberProductDAO();
		products=dao.findTopProducts(size);
		return "success";
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public List<Product> getProducts() {
		return products;
	}
	public void setProducts(List<Product> products) {
		this.products = products;
	}
	
}
