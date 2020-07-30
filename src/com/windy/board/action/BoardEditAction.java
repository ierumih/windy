package com.windy.board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.windy.board.svc.BoardEditSVC;
import com.windy.dao.DAO;
import com.windy.vo.ActionForward;
import com.windy.vo.Board;

public class BoardEditAction implements Action {
	

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward = null;
		Board board = new Board();
		HttpSession httpSession = request.getSession();
		board.setBoard_name(request.getParameter("board_name"));
		board.setNick((String)httpSession.getAttribute("nick"));
		board.setBoard_title(request.getParameter("title"));
		board.setBoard_content(request.getParameter("content"));
		board.setBoard_image(request.getParameter("images"));
		board.setBoard_file(request.getParameter("files"));
		board.setBoard_num(Integer.valueOf(request.getParameter("board_num")));
		
		BoardEditSVC bea = new BoardEditSVC();
		boolean Success = bea.BoardEdit(board);
		if(!Success) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('수정실패')");
			out.println("history.back();");
			out.println("</script>");
		}
		else {
			forward = new ActionForward();
			request.setAttribute("board", board);
			forward.setPath("boardview.b");
		}

		return forward;
	}
	
}
