package com.windy.course.svc;

import com.windy.dao.DAO;
import com.windy.vo.Course;

public class CourseBoardDeleteSVC {
	
	public boolean CourseBoardDelete(Course course) throws Exception{
		DAO.getConn();
		int chk = DAO.courseboarddel(course);
		boolean Success = false;
		if(chk>0)
			Success = true;
		return Success;
	}
}
