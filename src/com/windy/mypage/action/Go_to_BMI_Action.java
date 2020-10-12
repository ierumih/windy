package com.windy.mypage.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.windy.board.action.Action;
import com.windy.vo.ActionForward;

public class Go_to_BMI_Action implements Action{
	
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		ActionForward forward = new ActionForward();
		HttpSession httpSession = request.getSession();
		
		forward.setPath("health_care.jsp");
		
		return forward;
		
	}
	
}
