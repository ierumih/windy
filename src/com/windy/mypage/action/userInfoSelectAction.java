package com.windy.mypage.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.windy.board.action.Action;
import com.windy.mypage.svc.UserInfoService;
import com.windy.vo.ActionForward;
import com.windy.vo.User;

public class userInfoSelectAction implements Action{
	//����� ���� �ҷ�����
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		ActionForward forward = new ActionForward();
		String id = "ang";//���ǿ��� ID�����ʽÿ�
		UserInfoService uis = new UserInfoService();
		User info = uis.getinfo(id);
		
		
		return forward;
	}
	
}
