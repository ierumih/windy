package com.windy.course.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.windy.board.action.Action;
import com.windy.board.svc.BoardWriteSVC;
import com.windy.course.svc.CourseBoardWriteSVC;
import com.windy.vo.ActionForward;
import com.windy.vo.Board;
import com.windy.vo.Course;

public class CourseBoardWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		if(request.getParameter("content")==null){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('잘못된 접근입니다.')");
			out.println("history.back();");
			out.println("</script>");
			return null;
		}
		ActionForward forward = null;
		Course course = new Course();
		HttpSession httpSession = request.getSession();
		course.setNick((String)httpSession.getAttribute("nick"));
		course.setC_name(request.getParameter("title"));
		course.setC_cont(request.getParameter("content"));

		course.setC_img(request.getParameter("attach_image"));
		course.setC_area(request.getParameter("c_area"));
		course.setC_location(request.getParameter("c_location"));
		CourseBoardWriteSVC bws = new CourseBoardWriteSVC();
		boolean Success = bws.CourseBoardWrite(course);
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
			forward.setPath("courseboardlist.b");
		}
		
		return forward;
	}

}
