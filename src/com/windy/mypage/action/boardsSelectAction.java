package com.windy.mypage.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.windy.mypage.svc.boardsSelectService;
import com.windy.vo.ActionForward;

public class boardsSelectAction {
	//���������� ���� ���� ��������
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
		
		String id = request.getParameter("ID");
		boardsSelectService bss = new boardsSelectService();
		
		
		
		return null;
	}
	
}
