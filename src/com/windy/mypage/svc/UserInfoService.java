package com.windy.mypage.svc;

import com.mysql.jdbc.Connection;
import com.windy.dao.*;

public class UserInfoService {
	public String getname(String id) throws Exception{
		
		String name = null;
		DAO dao = new DAO();
		dao.getConn();
		name = dao.getUserName(id);
		
		return null;
	}
}
