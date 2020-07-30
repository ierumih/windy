package com.windy.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.windy.board.svc.BoardViewSVC;
import com.windy.vo.ActionForward;
import com.windy.vo.Board;

public class BoardViewAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward = new ActionForward();
		Board board = new Board();
		board.setBoard_name(request.getParameter("board_name"));
		board.setBoard_num(Integer.valueOf(request.getParameter("board_num")));
		BoardViewSVC bvs = new BoardViewSVC();
		bvs.boardviewupd(board);
		Board view = bvs.boardview(board);
		view.setBoard_name(board.getBoard_name());
		request.setAttribute("view", view);
		forward.setPath("view.jsp");
		return forward;
	}
	
}
