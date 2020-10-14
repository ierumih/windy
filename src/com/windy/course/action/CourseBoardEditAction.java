package com.windy.course.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.windy.board.action.Action;
import com.windy.course.svc.CourseBoardEditSVC;
import com.windy.vo.ActionForward;
import com.windy.vo.Course;

public class CourseBoardEditAction implements Action {
	

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward = null;
		Course course = new Course();
		HttpSession httpSession = request.getSession();
		course.setNick((String)httpSession.getAttribute("nick"));
		course.setC_name(request.getParameter("name"));
		course.setC_cont(request.getParameter("cont"));
		course.setC_img(request.getParameter("img"));
		course.setC_num(Integer.valueOf(request.getParameter("c_num")));
		
		CourseBoardEditSVC cbea = new CourseBoardEditSVC();
		boolean Success = cbea.CourseBoardEdit(course);
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
			request.setAttribute("course", course);
			forward.setPath("courseboardview.b");
		}

		return forward;
	}
	
}
