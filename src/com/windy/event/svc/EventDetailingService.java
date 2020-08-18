package com.windy.event.svc;


import com.windy.dao.DAO;
import com.windy.vo.Event;
import com.windy.vo.Event_p;

public class EventDetailingService {
	public Event EventDetail(String e_num){
		DAO.getConn();
		Event Edetail = DAO.EventDetail(e_num);
		System.out.println("service");
		return Edetail;
	}
	public Event_p EventCheck(String e_num){
		DAO.getConn();
		Event_p Echeck = DAO.EventCheck(e_num);
		System.out.println("service2");
		return Echeck;
	}
}
