package com.windy.course.svc;

import com.windy.dao.DAO;
import com.windy.vo.Course;

public class CourseDetailSVC {

	public Course CourseDetail(String c_name) throws Exception{
		DAO.getConn();
		Course coursed = DAO.coursedetail(c_name);
		return coursed;
	}
}
