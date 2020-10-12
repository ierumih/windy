package com.windy.mypage.svc;

import java.util.List;

import com.windy.dao.DAO;
import com.windy.vo.Order;

public class OrderStatusService {
	
	public List<Order> getOrderList(String id){
		
		List<Order> o = null;
		DAO dao= new DAO();
		dao.getConn();
		o = dao.getOrderList(id);
		return o;
	}
	public List<Order> getWishList(String id){
		
		List<Order> o = null;
		DAO dao= new DAO();
		dao.getConn();
		o = dao.getWishList(id);
		return o;
		
	}

}
