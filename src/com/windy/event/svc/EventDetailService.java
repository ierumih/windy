package com.windy.event.svc;

import java.util.ArrayList;
import java.util.List;

import com.windy.dao.DAO;
import com.windy.vo.Event;
import com.windy.vo.Product;

public class EventDetailService {
	public Event EventDetail(String e_num){
		DAO.getConn();
		Event Edetail = DAO.EventDetail(e_num);
		System.out.println("service");
		return Edetail;
	}
}
