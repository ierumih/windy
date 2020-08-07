package com.windy.event.svc;

import java.util.ArrayList;
import java.util.List;

import com.windy.dao.DAO;
import com.windy.vo.Event;

public class EventListService {
	public List<Event> EventList(){
		DAO.getConn();
		List<Event> Elist = new ArrayList<Event>();
		Elist = DAO.EventList();
		
		return Elist;
	}
}
