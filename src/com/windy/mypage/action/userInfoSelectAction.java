package com.windy.mypage.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.windy.mypage.svc.UserInfoService;
import com.windy.vo.ActionForward;

public class userInfoSelectAction {
	//����� ���� �ҷ�����
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		String id = request.getParameter("ID");
		UserInfoService uis = new UserInfoService();
		
		uis.getname(id);
		
		
		return null;
	}
	
}
