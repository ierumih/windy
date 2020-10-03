package com.windy.shop.svc;

import java.util.ArrayList;
import java.util.List;

import com.windy.dao.DAO;
import com.windy.vo.Product;

public class FindProductService {
	public List<Product> findproduct(Product pd){
		DAO.getConn();
		List<Product> list = new ArrayList<Product>();
		list = DAO.findproduct(pd);
		if(list.isEmpty()) {
			list = null;
		}
		return list;
	}
}
