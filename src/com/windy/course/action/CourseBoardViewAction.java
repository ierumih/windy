package com.windy.course.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.windy.board.action.Action;
import com.windy.board.svc.BoardViewSVC;
import com.windy.course.svc.CourseBoardViewSVC;
import com.windy.vo.ActionForward;
import com.windy.vo.Board;
import com.windy.vo.Course;

public class CourseBoardViewAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward = new ActionForward();
		Course course = new Course();
		course.setC_num(Integer.valueOf(request.getParameter("c_num")));
		CourseBoardViewSVC cbvs = new CourseBoardViewSVC();
		cbvs.courseboardviewupd(course);
		Course courseview = cbvs.courseboardview(course);
		request.setAttribute("courseview", courseview);
		forward.setPath("courseview.jsp");
		return forward;
	}
	
}
