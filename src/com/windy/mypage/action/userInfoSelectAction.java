package com.windy.mypage.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.windy.board.action.Action;
import com.windy.mypage.svc.UserInfoService;
import com.windy.vo.ActionForward;
import com.windy.vo.User;

public class userInfoSelectAction implements Action{
	//����� ���� �ҷ�����
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		ActionForward forward = new ActionForward();
		HttpSession httpSession = request.getSession();
		String id = (String) httpSession.getAttribute("id");//���ǿ� �ִ� ���̵� ����
		UserInfoService uis = new UserInfoService();//���� ���� ���� ��ü ����
		User info = uis.getinfo(id);//���ప info�� ����
		
		httpSession.setAttribute("info", info);//���ǿ� ���� ����
		forward.setPath("mypage.jsp");
		
		return forward;
	}
	
}
