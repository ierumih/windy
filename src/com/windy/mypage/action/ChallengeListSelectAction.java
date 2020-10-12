package com.windy.mypage.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.windy.board.action.Action;
import com.windy.mypage.svc.ChallengeListService;
import com.windy.vo.ActionForward;
import com.windy.vo.Challenge_list;

public class ChallengeListSelectAction implements Action{
	//업적 목록 가져오기 업적 제에스피 파일에 쓸것
	
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		ActionForward forward = new ActionForward();
		HttpSession httpSession = request.getSession();
		
		List<Challenge_list> cl = null;
		ChallengeListService cls = new ChallengeListService();
		cl = cls.getList();
		
		httpSession.setAttribute("CList", cl);
		
		
		
		forward.setPath("challenge.jsp");
		
		return forward;
		
	}
	
}
