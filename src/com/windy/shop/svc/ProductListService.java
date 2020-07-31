package com.windy.shop.svc;

import java.util.ArrayList;
import java.util.List;

import com.windy.dao.DAO;
import com.windy.vo.Product;

public class ProductListService {
	public List<Product> productlist(){
		DAO.getConn();
		List<Product> list = new ArrayList<Product>();
		list = DAO.productList();
		
		return list;
	}
}
