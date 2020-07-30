package com.windy.board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.windy.board.svc.BoardEditFormSVC;
import com.windy.board.svc.BoardEditSVC;
import com.windy.dao.DAO;
import com.windy.vo.ActionForward;
import com.windy.vo.Board;

public class BoardEditFormAction implements Action {
	

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward = null;
		
		Board board = new Board();
		Board board1;
		HttpSession httpSession = request.getSession();
		board.setBoard_name(request.getParameter("board_name"));
		board.setBoard_num(Integer.valueOf(request.getParameter("board_num")));
		
		BoardEditFormSVC befs = new BoardEditFormSVC();
		String writer = befs.writerchk(board);
		if(writer.equals(httpSession.getAttribute("nick"))) {
			board1 = DAO.view(board);
			board1.setBoard_name(request.getParameter("board_name"));
			request.setAttribute("board", board1);
			forward = new ActionForward();
			forward.setPath("boardedit.jsp");
		}
		
		return forward;
	}
	
}
