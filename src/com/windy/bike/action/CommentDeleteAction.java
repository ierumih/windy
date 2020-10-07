package com.windy.bike.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.windy.bike.svc.CommentDeleteService;
import com.windy.board.action.Action;
import com.windy.vo.ActionForward;
import com.windy.vo.B_comment;

public class CommentDeleteAction implements Action{

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		ActionForward forward = null;
		B_comment comment = new B_comment();
		int comment_no = Integer.valueOf(request.getParameter("comment_no"));
		String bike_num = request.getParameter("bike_num");
		comment.setComment_no(comment_no);
		System.out.println("action"+comment_no+"¶û"+bike_num);
		
		CommentDeleteService CommentDeleteService = new CommentDeleteService();
		boolean Success = CommentDeleteService.CommentDelete(comment);
		if(!Success) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('»èÁ¦½ÇÆÐ')");
			out.println("history.back();");
			out.println("</script>");
		}
		else {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("bikecomment.b?bike_num="+bike_num);
		}

		return forward;
	}
}
