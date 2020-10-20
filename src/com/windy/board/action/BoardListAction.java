package com.windy.board.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.windy.board.svc.BoardListSVC;
import com.windy.vo.ActionForward;
import com.windy.vo.Board;
import com.windy.vo.Page;

public class BoardListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub

		ActionForward forward = new ActionForward();
		Page page = new Page();
		Page pages = new Page();
		String board_name = request.getParameter("board_name");
		boolean s = false;
		List<Board> listb;

		if(request.getParameter("s_type")!=null&&request.getParameter("s_key")!=null) {
			pages.setS_type(request.getParameter("s_type"));
			pages.setS_key("%"+request.getParameter("s_key")+"%");
			pages.setBoard_name(board_name);
			s=true;
		}
		BoardListSVC bls = new BoardListSVC();
		
		if(!s)
			page = bls.boardcount(board_name);
		else {
			page = bls.boardcounts(pages);
			page.setS_type(request.getParameter("s_type"));
			page.setS_key("%"+request.getParameter("s_key")+"%");
		}
		page.setBoard_name(board_name);
		if(request.getParameter("p")!=null)
			page.setCurrentpage(Integer.valueOf(request.getParameter("p")));
		else
			page.setCurrentpage(1);
		page.setLimitindex();
		if(!s)
			listb = bls.boardlist(page);
		else {
			listb = bls.boardlists(page);
		}
		request.setAttribute("listb", listb);
		request.setAttribute("pages", page);
		
		forward.setPath("board.jsp");
		
		return forward;
	}

}
