package com.windy.course.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.windy.board.action.Action;
import com.windy.course.svc.CourseBoardEditFormSVC;
import com.windy.dao.DAO;
import com.windy.vo.ActionForward;
import com.windy.vo.Course;

public class CourseBoardEditFormAction implements Action {
	

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward = null;
		
		Course course = new Course();
		Course course1;
		HttpSession httpSession = request.getSession();
		course.setC_num(Integer.valueOf(request.getParameter("c_num")));
		CourseBoardEditFormSVC cbefs = new CourseBoardEditFormSVC();
		String writer = cbefs.writerchk(course);
		if(writer.equals(httpSession.getAttribute("nick"))) {
			course1 = DAO.courseboardview(course);
			request.setAttribute("course", course1);
			forward = new ActionForward();
			forward.setPath("courseedit.jsp");
		}
		
		return forward;
	}
	
}
