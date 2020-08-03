package com.windy.shop.svc;

import java.util.ArrayList;
import java.util.List;

import com.windy.dao.DAO;
import com.windy.vo.Product;

public class ProductListService {
	public List<Product> Bproductlist(){
		DAO.getConn();
		List<Product> Blist = new ArrayList<Product>();
		Blist = DAO.BproductList();
		
		return Blist;
	}
}
