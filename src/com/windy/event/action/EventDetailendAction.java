package com.windy.event.action;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.windy.board.action.Action;
import com.windy.event.svc.EventDetailendService;
import com.windy.vo.ActionForward;
import com.windy.vo.Event;
import com.windy.vo.Event_p;

public class EventDetailendAction implements Action{
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		ActionForward forward = new ActionForward();
		String e_num = request.getParameter("e_num");
		
		EventDetailendService eventdetailservice = new EventDetailendService();
		Event edetail = eventdetailservice.EventDetail(e_num);
		
		List<Event_p> ewinner = eventdetailservice.EventWinner(e_num);
		
		request.setAttribute("Edetail", edetail);
		request.setAttribute("Ewinner", ewinner);
		forward.setPath("e_detail_end.jsp");
		return forward;
	}
}

