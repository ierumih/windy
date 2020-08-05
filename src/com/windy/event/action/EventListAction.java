package com.windy.event.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.windy.board.action.Action;
import com.windy.event.svc.EventListService;
import com.windy.shop.svc.ProductListService;
import com.windy.vo.ActionForward;
import com.windy.vo.Event;
import com.windy.vo.Product;

public class EventListAction implements Action{
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		ActionForward forward = null;
		String e_num = request.getParameter("e_num");
		
		if(e_num==null) {
		forward = new ActionForward();
		EventListService EventListService = new EventListService();
		List<Event> Elist = EventListService.EventList();
		request.setAttribute("Elist",Elist);
		forward.setPath("e_list.jsp");
		}
		
		// p_kind 로 받은 값을 기준으로 상품 진열해야함. 디테일 하고 넘어오셈
		return forward;
	}
}
