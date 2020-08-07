package com.windy.event.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.windy.board.action.Action;
import com.windy.event.svc.EventListendService;
import com.windy.vo.ActionForward;
import com.windy.vo.Event;

public class EventListendAction implements Action{
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		ActionForward forward = null;
		String e_num = request.getParameter("e_num");
		
		if(e_num==null) {
		forward = new ActionForward();
		EventListendService EventListendService = new EventListendService();
		List<Event> Elistend = EventListendService.EventList();
		request.setAttribute("Elistend",Elistend);
		forward.setPath("e_list_end.jsp");
		}
		
		// p_kind �� ���� ���� �������� ��ǰ �����ؾ���. ������ �ϰ� �Ѿ����
		return forward;
	}
}
