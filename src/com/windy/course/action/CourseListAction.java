package com.windy.course.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.windy.board.action.Action;
import com.windy.course.svc.CourseListSVC;
import com.windy.vo.ActionForward;
import com.windy.vo.Course;

public class CourseListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		ActionForward forward = new ActionForward();
		String c_area = request.getParameter("c_area");
		CourseListSVC cls = new CourseListSVC();
		List<Course> coursel;
		coursel = cls.courselist(c_area);
		request.setAttribute("coursel", coursel);
		forward.setPath("course_list.jsp");
		return forward;
	}
	
}
