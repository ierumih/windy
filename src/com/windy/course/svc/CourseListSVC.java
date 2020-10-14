package com.windy.course.svc;

import com.windy.dao.DAO;
import com.windy.vo.Course;
import java.util.*;

public class CourseListSVC {

	public List<Course> courselist(String c_area) {
		DAO.getConn();
		List<Course> coursel;
		coursel = DAO.courselist(c_area);
		return coursel;
	}
}
