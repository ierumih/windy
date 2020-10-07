package com.windy.event.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.windy.board.action.Action;
import com.windy.event.svc.EventListendService;
import com.windy.vo.ActionForward;
import com.windy.vo.Event;
import com.windy.vo.Page;

public class EventListendAction implements Action{
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		ActionForward forward = null;
		Page page = new Page();
		String time = page.getTime();
		
		forward = new ActionForward();
		EventListendService EventListendService = new EventListendService();
		page = EventListendService.paging(time);
		if(request.getParameter("p")!=null)
			page.setCurrentpage(Integer.valueOf(request.getParameter("p")));
		else
			page.setCurrentpage(1);
		page.setS_limitindex();
		
		List<Event> Elistend = EventListendService.EventList(page);
		request.setAttribute("Elistend",Elistend);
		request.setAttribute("page", page);
		forward.setPath("e_list_end.jsp");
		
		return forward;
	}
}
