package com.windy.shop.svc;

import java.util.List;

import com.windy.dao.DAO;
import com.windy.vo.Order;

public class ProductOrderService {
	public boolean productOrder(List<Order> or_list) {
		DAO.getConn();
		int chk = DAO.prodctOrd(or_list);
		boolean success = false;
		if(chk>0) {
			success = true;
		}
		return success;
	}
}
