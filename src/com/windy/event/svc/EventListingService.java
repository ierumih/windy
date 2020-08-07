package com.windy.event.svc;

import java.util.ArrayList;
import java.util.List;

import com.windy.dao.DAO;
import com.windy.vo.Event;

public class EventListingService {
	public List<Event> EventList(){
		DAO.getConn();
		List<Event> Elisting = new ArrayList<Event>();
		Elisting = DAO.EventListing();
		
		return Elisting;
	}
}
