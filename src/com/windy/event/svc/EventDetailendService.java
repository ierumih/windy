package com.windy.event.svc;


import java.util.ArrayList;
import java.util.List;

import com.windy.dao.DAO;
import com.windy.vo.Event;
import com.windy.vo.Event_p;

public class EventDetailendService {
	public Event EventDetail(String e_num){
		DAO.getConn();
		Event Edetail = DAO.EventDetail(e_num);
		return Edetail;
	}
	public List<Event_p> EventWinner(String e_num){
		DAO.getConn();
		List<Event_p> Ewinner = new ArrayList<Event_p>();
		Ewinner = DAO.EventWinner(e_num);
		
		return Ewinner;
	}
}
