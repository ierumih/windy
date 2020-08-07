package com.windy.mypage.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.windy.board.action.Action;
import com.windy.mypage.svc.UserInfoService;
import com.windy.vo.ActionForward;
import com.windy.vo.User;

public class userInfoSelectAction implements Action{
	//사용자 정보 불러오기
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		ActionForward forward = new ActionForward();
		HttpSession httpSession = request.getSession();
		String id = (String) httpSession.getAttribute("id");//세션에 있는 아이디 받음
		UserInfoService uis = new UserInfoService();//유저 인포 서비스 객체 생성
		User info = uis.getinfo(id);//실행값 info에 넣음
		
		httpSession.setAttribute("info", info);//세션에 인포 저장
		forward.setPath("mypage.jsp");
		
		return forward;
	}
	
}
