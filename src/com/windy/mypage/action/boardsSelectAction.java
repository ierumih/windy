package com.windy.mypage.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.windy.board.action.Action;
import com.windy.mypage.svc.boardsSelectService;
import com.windy.vo.ActionForward;
import com.windy.vo.Board;

public class boardsSelectAction implements Action{
	//���������� ���� ���� ��������\
	//�׼��� �������� �ʿ䰡 �������� ���� �׼��� ���������� �׼ǰ� �����մϴ� //���񽺴� ���� ����
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
		
		ActionForward forward = new ActionForward();
		HttpSession httpSession = request.getSession();
		String nick = (String) httpSession.getAttribute("nick");
		List<Board> board = null;
		boardsSelectService bss = new boardsSelectService();
		board = bss.getMyBoardList(nick);
		System.out.println(board.get(2).getBoard_title());
		request.setAttribute("board", board);
		forward.setPath("mypage.jsp");
		
		return forward;
	}
}
