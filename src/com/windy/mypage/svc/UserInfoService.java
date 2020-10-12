package com.windy.mypage.svc;

import com.windy.dao.*;
import com.windy.vo.User;

public class UserInfoService {
	public User getinfo(String id) throws Exception{
		
		User info;
		DAO dao = new DAO();
		dao.getConn();
		info = dao.getUserinfo(id);
		return info;
	}
	public void updateInfo(User info) throws Exception{
		
		System.out.println("svc");
		
		DAO dao = new DAO();
		dao.getConn();
		dao.updateInfo(info);
		
	}
	
	
}
