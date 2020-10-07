package com.windy.event.svc;

import java.util.ArrayList;
import java.util.List;

import com.windy.dao.DAO;
import com.windy.vo.Event;
import com.windy.vo.Page;

public class EventListingService {
	public List<Event> EventList(Page page){
		DAO.getConn();
		List<Event> Elisting = new ArrayList<Event>();
		Elisting = DAO.EventListing(page);
		
		return Elisting;
	}
	
	public Page paging(String time) {
		DAO.getConn();
		Page page = new Page();
		int listcount = DAO.eventpageing(time);
		page.setListcount(listcount);
		page.setEndpage((int)Math.ceil((double)listcount/6));
		return page;
	}
}
