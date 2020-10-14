package com.windy.course.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.windy.board.action.Action;
import com.windy.course.svc.CourseBoardListSVC;
import com.windy.vo.ActionForward;
import com.windy.vo.Course;
import com.windy.vo.Page;

public class CourseBoardListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub

		ActionForward forward = new ActionForward();
		Page page = new Page();
		Page pages = new Page();
		boolean s = false;
		List<Course> clistb;

		if(request.getParameter("s_type")!=null&&request.getParameter("s_key")!=null) {
			pages.setS_type(request.getParameter("s_type"));
			pages.setS_key("%"+request.getParameter("s_key")+"%");
			s=true;
		}
		CourseBoardListSVC cbls = new CourseBoardListSVC();
		
		if(!s)
			page = cbls.courseboardcount();
		else {
			page = cbls.courseboardcounts(pages);
			page.setS_type(request.getParameter("s_type"));
			page.setS_key("%"+request.getParameter("s_key")+"%");
		}
		if(request.getParameter("p")!=null)
			page.setCurrentpage(Integer.valueOf(request.getParameter("p")));
		else
			page.setCurrentpage(1);
		page.setLimitindex();
		if(!s)
			clistb = cbls.courseboardlist(page);
		else {
			clistb = cbls.courseboardlists(page);
		}
		request.setAttribute("clistb", clistb);
		request.setAttribute("pages", page);
		
		forward.setPath("courseboard.jsp");
		
		return forward;
	}

}
