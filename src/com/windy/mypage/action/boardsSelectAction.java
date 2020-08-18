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
	//마이페이지 보더 정보 가져오기\
	//액션이 여러개일 필요가 없어져서 보더 액션은 마이페이지 액션가 통합합니다 //서비스는 따로 있음
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
