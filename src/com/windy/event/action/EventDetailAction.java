package com.windy.event.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.windy.board.action.Action;
import com.windy.event.svc.EventDetailService;
import com.windy.shop.svc.ProductDetailService;
import com.windy.vo.ActionForward;
import com.windy.vo.Event;
import com.windy.vo.Product;

public class EventDetailAction implements Action{
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		System.out.println("action");
		ActionForward forward = new ActionForward();
		String e_num = request.getParameter("e_num");
		
		EventDetailService eventdetailservice = new EventDetailService();
		Event edetail = eventdetailservice.EventDetail(e_num);
		request.setAttribute("Edetail", edetail);
		forward.setPath("e_detail.jsp");
		// p_kind 로 받은 값을 기준으로 상품 진열해야함. 디테일 하고 넘어오셈
		return forward;
	}
}

