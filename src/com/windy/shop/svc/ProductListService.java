package com.windy.shop.svc;

import java.util.ArrayList;
import java.util.List;

import com.windy.dao.DAO;
import com.windy.vo.Page;
import com.windy.vo.Product;

public class ProductListService {
	public List<Product> Bproductlist(){
		DAO.getConn();
		List<Product> Blist = new ArrayList<Product>();
		Blist = DAO.BproductList();
		
		return Blist;
	}
	
	public List<Product> productlist(Page page){
		DAO.getConn();
		List<Product> list = new ArrayList<Product>();
		list = DAO.productList(page);
		
		return list;
	}
	
	public Page paging(String p_kind) {
		DAO.getConn();
		Page page = new Page();
		int listcount = DAO.paging(p_kind);
		page.setListcount(listcount);
		page.setEndpage((int)Math.ceil((double)listcount/6));
		return page;
	}
}
