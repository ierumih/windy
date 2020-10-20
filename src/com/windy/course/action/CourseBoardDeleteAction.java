package com.windy.course.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.windy.board.action.Action;
import com.windy.course.svc.CourseBoardDeleteSVC;
import com.windy.vo.ActionForward;
import com.windy.vo.Course;

public class CourseBoardDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		ActionForward forward = null;
		Course course = new Course();
		HttpSession httpSession = request.getSession();
		course.setC_num(Integer.valueOf(request.getParameter("board_num")));
		course.setNick((String)httpSession.getAttribute("nick"));
		CourseBoardDeleteSVC cbds = new CourseBoardDeleteSVC();
		boolean Success = cbds.CourseBoardDelete(course);
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
			forward.setPath("courseboardlist.b");
		}

		return forward;
	}
	
}
