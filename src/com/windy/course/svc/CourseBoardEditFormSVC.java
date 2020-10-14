package com.windy.course.svc;

import com.windy.dao.DAO;
import com.windy.vo.Board;
import com.windy.vo.Course;

public class CourseBoardEditFormSVC {
	public String writerchk(Course course) throws Exception{
		DAO.getConn();
		String writer = DAO.coursewriterchk(course);
		return writer;
	}
}
