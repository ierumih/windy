package com.windy.mypage.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.windy.board.action.Action;
import com.windy.mypage.svc.UserInfoService;
import com.windy.vo.ActionForward;
import com.windy.vo.User;

public class userInfoSelectAction implements Action{
	//사용자 정보 불러오기
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		ActionForward forward = new ActionForward();
		String id = "ang";//세션에서 ID받으십시오
		UserInfoService uis = new UserInfoService();
		User info = uis.getinfo(id);
		
		
		return forward;
	}
	
}
