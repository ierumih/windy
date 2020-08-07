package com.windy.event.svc;

import java.util.ArrayList;
import java.util.List;

import com.windy.dao.DAO;
import com.windy.vo.Event;

public class EventListendService {
	public List<Event> EventList(){
		DAO.getConn();
		List<Event> Elistend = new ArrayList<Event>();
		Elistend = DAO.EventListend();
		
		return Elistend;
	}
}
