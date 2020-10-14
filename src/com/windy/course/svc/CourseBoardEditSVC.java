package com.windy.course.svc;

import com.windy.dao.DAO;
import com.windy.vo.Course;

public class CourseBoardEditSVC {

	public boolean CourseBoardEdit(Course course) throws Exception{
		DAO.getConn();
		int chk = DAO.courseboardupd(course);
		boolean Success = false;
		if(chk>0)
			Success = true;
		return Success;
	}
}
