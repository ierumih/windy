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
}
