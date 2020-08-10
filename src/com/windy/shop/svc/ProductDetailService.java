package com.windy.shop.svc;

import java.util.ArrayList;
import java.util.List;

import com.windy.dao.DAO;
import com.windy.vo.Product;

public class ProductDetailService {
	public Product productdetail(String code){
		DAO.getConn();
		Product detail = DAO.productdetail(code);
		
		return detail;
	}
	
	public List<Product> size(String code) {
		DAO.getConn();
		List<Product> sm = new ArrayList<Product>();
		sm = DAO.size(code);
		return sm;
	}
	public List<Product> color(String code) {
		DAO.getConn();
		List<Product> sm = new ArrayList<Product>();
		sm = DAO.color(code);
		return sm;
	}
	public List<Product> gear(String code) {
		DAO.getConn();
		List<Product> sm = new ArrayList<Product>();
		sm = DAO.gear(code);
		return sm;
	}
	
}
