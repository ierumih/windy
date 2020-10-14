package com.windy.course.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.windy.board.action.Action;
import com.windy.course.svc.CourseDetailSVC;
import com.windy.vo.ActionForward;
import com.windy.vo.Course;

public class CourseDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		ActionForward forward = new ActionForward();
		String c_name = request.getParameter("c_name");
		CourseDetailSVC cds = new CourseDetailSVC();
		Course coursed = cds.CourseDetail(c_name);
		request.setAttribute("coursed", coursed);
		forward.setPath("course_detail.jsp");
		return forward;
	}

}
