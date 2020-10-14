package com.windy.course.svc;

import com.windy.dao.DAO;
import com.windy.vo.Board;
import com.windy.vo.Course;

public class CourseBoardWriteSVC {
	
	public boolean CourseBoardWrite(Course course) throws Exception{
		DAO.getConn();
		int chk = DAO.courseins(course);
		boolean Success = false;
		if(chk>0)
			Success = true;
		return Success;
	}
}
