package org.tarena.dang.dao;

import java.util.List;

import org.tarena.dang.pojo.Product;

public interface ProductDAO {
	public List<Product> findTopProducts(int size) throws Exception;

	public List findBooksByrecomment(int size)throws Exception;

	public List<Product> findProductByCatId(int cid, int page, int pageSize)throws Exception;

	public List findProductByProductNum(int size) throws Exception;

	public List<Object[]> findNewProductByProductNum(int size)throws Exception;

	public Product findProductById(int id) throws Exception;
}
