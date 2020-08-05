package com.windy.mypage.svc;

import com.mysql.jdbc.Connection;
import com.windy.dao.*;
import com.windy.vo.User;

public class UserInfoService {
	public User getinfo(String id) throws Exception{
		
		User info = null;
		DAO dao = new DAO();
		dao.getConn();
		info = dao.getUserinfo(id);
		
		return info;
	}
}
