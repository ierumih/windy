package com.windy.mypage.svc;

import java.util.List;

import com.windy.dao.DAO;
import com.windy.vo.Mypage_event;

public class MypageEventService {

	public List<Mypage_event> getMyEvent(String id){
		List<Mypage_event> me = null;
		DAO dao= new DAO();
		dao.getConn();
		me = dao.getMypageEvent(id);
		
		return me;
	}
}
