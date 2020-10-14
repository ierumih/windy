package com.windy.course.svc;

import java.util.*;

import com.windy.dao.DAO;
import com.windy.vo.Course;
import com.windy.vo.Page;

public class CourseBoardListSVC {
	

	public Page courseboardcount() {
		DAO.getConn();
		Page page = new Page();
		int listcount = DAO.coursecount();
		page.setListcount(listcount);
		page.setEndpage((int) Math.ceil((double) listcount/20));
		return page;
	}

	public List<Course> courseboardlist(Page page){
		List<Course> clistb = new ArrayList<Course>();
		DAO.getConn();
		clistb = DAO.courseboardlist(page);
		return clistb;
	}
	
	public Page courseboardcounts(Page page) {
		DAO.getConn();
		Page page1 = new Page();
		int listcount = DAO.coursecountsearch(page);
		page1.setListcount(listcount);
		page1.setEndpage((int) Math.ceil((double) listcount/20));
		return page1;
	}
	
	public List<Course> courseboardlists(Page page){
		List<Course> clistb = new ArrayList<Course>();
		DAO.getConn();
		clistb = DAO.courseboardlists(page);
		return clistb;
	}
}

