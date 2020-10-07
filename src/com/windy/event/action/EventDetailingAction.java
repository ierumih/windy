package com.windy.event.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.windy.board.action.Action;
import com.windy.event.svc.EventDetailingService;
import com.windy.vo.ActionForward;
import com.windy.vo.Event;
import com.windy.vo.Event_p;

public class EventDetailingAction implements Action{
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		ActionForward forward = new ActionForward();
		String e_num = request.getParameter("e_num");
		
		EventDetailingService eventdetailservice = new EventDetailingService();
		Event edetail = eventdetailservice.EventDetail(e_num);
		Event_p echeck = eventdetailservice.EventCheck(e_num);
		
		request.setAttribute("Echeck", echeck);
		request.setAttribute("Edetail", edetail);
		forward.setPath("e_detail_ing.jsp");
		return forward;
	}
}

