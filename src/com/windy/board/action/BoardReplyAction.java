package com.windy.board.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.windy.board.svc.*;
import com.windy.vo.ActionForward;
import com.windy.vo.Board;

public class BoardReplyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		ActionForward forward = null;
		Board board = new Board();
		HttpSession httpSession = request.getSession();
		board.setBoard_name(request.getParameter("board_name"));
		board.setNick((String)httpSession.getAttribute("nick"));
		board.setBoard_content(request.getParameter("content"));

		
		return forward;
	}

}
