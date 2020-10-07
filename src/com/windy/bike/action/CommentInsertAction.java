package com.windy.bike.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.windy.bike.svc.CommentInsertService;
import com.windy.board.action.Action;
import com.windy.board.svc.BoardWriteSVC;
import com.windy.vo.ActionForward;
import com.windy.vo.B_comment;

public class CommentInsertAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = null;
		B_comment comment = new B_comment();
		comment.setComment_id(request.getParameter("hidden"));
		comment.setComment_content(request.getParameter("comment"));
		comment.setBike_num(Integer.valueOf(request.getParameter("hidden2")));
		CommentInsertService CommentInsertService = new CommentInsertService();
		
		boolean Success = CommentInsertService.CommentInsert(comment);
		if(!Success) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('등록실패')");
			out.println("history.back();");
			out.println("</script>");
		}
		else {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("bikecomment.b?bike_num="+comment.getBike_num());
		}
		
		return forward;
	}
}
