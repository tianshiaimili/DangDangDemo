package org.tarena.dang.action.main;

import java.util.List;

import org.tarena.dang.dao.CategoryDAO;
import org.tarena.dang.dao.HiberCategoryDAO;
import org.tarena.dang.dao.HiberProductDAO;
import org.tarena.dang.dao.ProductDAO;
import org.tarena.dang.pojo.Category;
import org.tarena.dang.pojo.Product;


public class BookListAction {
	//input
	private int pid;//父类别ID
	private int cid;//当前类别ID
	private int page =1;//显示第几页
	//output
	private int totalPage = 0;//总页数
	private int totalPnum = 0;//全部数量
	private List<Category> subCats;//同级类别
	private List<Product> pros;//产品信息
	//
	private int pageSize = 5;//一页显示5条

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public List<Product> getPros() {
		return pros;
	}

	public void setPros(List<Product> pros) {
		this.pros = pros;
	}

	public String execute() throws Exception{
		//根据pid值获取subCats
		CategoryDAO catDao = 
			new HiberCategoryDAO();
		Category cat = catDao.findById(pid);
		subCats = cat.getSublist();
		//统计subCats中各类别数量之和
		for(Category c:subCats){
			totalPnum+=c.getPnum();
		}
		//根据cid获取所包含的产品
		ProductDAO proDao = 
			new HiberProductDAO();
		pros = proDao.findProductByCatId(
				cid,page,pageSize);
		System.out.println("pros的长度！"+pros.size());
		//TODO 计算totalPage总页数,控制下一页是否可用
		int pagePlus=0;
		if(proDao.findProductByCatId(cid, 0, totalPnum).size()%pageSize!=0){
			pagePlus=1;
		}
		totalPage=proDao.findProductByCatId(cid, 0, totalPnum).size()/pageSize+pagePlus;
		return "success";
	}
	
	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public List<Category> getSubCats() {
		return subCats;
	}

	public void setSubCats(List<Category> subCats) {
		this.subCats = subCats;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public int getTotalPnum() {
		return totalPnum;
	}

	public void setTotalPnum(int totalPnum) {
		this.totalPnum = totalPnum;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	

}
