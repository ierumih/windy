package com.windy.mypage.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.windy.board.action.Action;
import com.windy.mypage.svc.ChallengeCompService;
import com.windy.mypage.svc.UserInfoService;
import com.windy.mypage.svc.boardsSelectService;
import com.windy.vo.ActionForward;
import com.windy.vo.Board;
import com.windy.vo.Challenge_comp;
import com.windy.vo.User;

public class MypageSelectAction implements Action{
	//����� ���� �ҷ�����
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		ActionForward forward = new ActionForward();
		HttpSession httpSession = request.getSession();
		String id = (String) httpSession.getAttribute("id");//���ǿ� �ִ� ���̵� ����
		String nick = (String) httpSession.getAttribute("nick");
		
		////////////���� ���� ��������
		UserInfoService uis = new UserInfoService();//���� ���� ���� ��ü ����
		User info = uis.getinfo(id);//���ప info�� ����
		httpSession.setAttribute("info", info);//���ǿ� ���� ����
		
		///////////////////���� ���� ��������
		List<Board> board = null;
		boardsSelectService bss = new boardsSelectService();
		board = bss.getMyBoardList(nick);
		httpSession.setAttribute("board", board);
		
		//////////////////�޼����� ����Ʈ ��������
		List<Challenge_comp> cc = null;
		ChallengeCompService ccs = new ChallengeCompService();
		cc = ccs.getCompChallengeList(id);
		httpSession.setAttribute("compChallenge", cc);
		
		
		
		
		
		forward.setPath("mypage.jsp");
		
		return forward;
	}
	
}
