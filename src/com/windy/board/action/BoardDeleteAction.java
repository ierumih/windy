package com.windy.board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.windy.board.svc.BoardDeleteSVC;
import com.windy.vo.ActionForward;
import com.windy.vo.Board;

public class BoardDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		ActionForward forward = null;
		Board board = new Board();
		HttpSession httpSession = request.getSession();
		board.setBoard_name(request.getParameter("board_name"));
		board.setBoard_num(Integer.valueOf(request.getParameter("board_num")));
		board.setNick((String)httpSession.getAttribute("nick"));
		BoardDeleteSVC bds = new BoardDeleteSVC();
		boolean Success = bds.BoardDelete(board);
		if(!Success) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('자신이 작성한 글만 삭제할 수 있습니다.')");
			out.println("history.back();");
			out.println("</script>");
		}
		else {
			forward = new ActionForward();
			forward.setPath("boardlist.b");
		}

		return forward;
	}
	
}
