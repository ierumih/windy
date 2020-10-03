package com.windy.shop.svc;

import java.util.ArrayList;
import java.util.List;

import com.windy.dao.DAO;
import com.windy.vo.P_review;
import com.windy.vo.Product;

public class ProductDetailService {
	public Product productdetail(String code){
		DAO.getConn();
		Product detail = DAO.productdetail(code);
		
		return detail;
	}
	
	public List<Product> option(String code) {
		DAO.getConn();
		List<Product> sm = new ArrayList<Product>();
		sm = DAO.option(code);
		return sm;
	}
	
	public List<P_review> p_review(String code){
		DAO.getConn();
		List<P_review> pr = new ArrayList<P_review>();
		pr = DAO.p_review(code);
		return pr;
	}
}
