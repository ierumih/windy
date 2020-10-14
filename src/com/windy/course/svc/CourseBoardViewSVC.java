package com.windy.course.svc;

import com.windy.dao.DAO;
import com.windy.vo.Course;

public class CourseBoardViewSVC {
	
	public boolean courseboardviewupd(Course course) {
		DAO.getConn();
		int chk = DAO.courseboardviewupd(course);
		boolean success = false;
		if(chk>0)
			success = true;
		return success;
	}
	
	public Course courseboardview(Course course) {
		DAO.getConn();
		Course course1 = DAO.courseboardview(course);
		return course1;
	}
}
