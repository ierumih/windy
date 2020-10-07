package com.windy.event.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.windy.board.action.Action;
import com.windy.event.svc.EventListingService;
import com.windy.vo.ActionForward;
import com.windy.vo.Event;
import com.windy.vo.Page;

public class EventListingAction implements Action{
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		ActionForward forward = null;
		
		Page page = new Page();
		String time = page.getTime();
		
		forward = new ActionForward();
		EventListingService EventListingService = new EventListingService();
		page = EventListingService.paging(time);
		if(request.getParameter("p")!=null)
			page.setCurrentpage(Integer.valueOf(request.getParameter("p")));
		else
			page.setCurrentpage(1);
		page.setS_limitindex();
		
		List<Event> Elisting = EventListingService.EventList(page);
		request.setAttribute("Elisting",Elisting);
		request.setAttribute("page", page);
		forward.setPath("e_list_ing.jsp");
		
		
		return forward;
	}
}
