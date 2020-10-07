package com.windy.bike.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.windy.bike.svc.BikeListService;
import com.windy.board.action.Action;
import com.windy.vo.ActionForward;
import com.windy.vo.Bike;

public class BikeListAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = null;
		String select = request.getParameter("bike_brand");
		String num = request.getParameter("bike_num");
		forward = new ActionForward();
		BikeListService BikeListService = new BikeListService();
		
		if(num==null) {
			List<Bike> Bikelist = BikeListService.BikeList(select);
			request.setAttribute("Bikelist", Bikelist);
		}else { //상세에서 뒤로가기로 넘어올때
			List<Bike> Bikelist2 = BikeListService.BikeList2(num);
			request.setAttribute("Bikelist", Bikelist2);
		}
		
		
		forward.setPath("bike_brand_select.jsp");

		return forward;
	}
}