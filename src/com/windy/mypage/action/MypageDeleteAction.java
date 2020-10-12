package com.windy.mypage.action;

import com.windy.board.action.Action;
import com.windy.mypage.svc.DeleteAccountService;
import com.windy.vo.ActionForward;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MypageDeleteAction implements Action{

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		ActionForward forward = new ActionForward();
		HttpSession httpSession = request.getSession();
		System.out.println("action in:");
		String id = (String) httpSession.getAttribute("id");
		DeleteAccountService das = new DeleteAccountService();
		das.deleteService(id);
		forward.setPath("main.jsp");
		System.out.println("action out:");
		return forward;
	}
}
