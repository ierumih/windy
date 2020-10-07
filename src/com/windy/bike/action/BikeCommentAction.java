package com.windy.bike.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.windy.bike.svc.BikeCommentService;
import com.windy.board.action.Action;
import com.windy.vo.ActionForward;
import com.windy.vo.B_comment;
import com.windy.vo.Bike;

public class BikeCommentAction implements Action{
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = null;
		String comment = request.getParameter("bike_num");
		forward = new ActionForward();
		
		BikeCommentService BikeCommentService = new BikeCommentService();
		
		List<Bike> bikelist = BikeCommentService.BikeList(comment);
		List<B_comment> commentlist = BikeCommentService.BikeComment(comment);
		request.setAttribute("commentlist", commentlist);
		request.setAttribute("bike_num", comment);
		request.setAttribute("bikelist", bikelist);
		forward.setPath("bike_comment.jsp");

		return forward;
	}
}
