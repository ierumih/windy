package com.windy.mypage.svc;


import java.util.List;

import com.windy.dao.DAO;
import com.windy.vo.Challenge_list;

public class ChallengeListService {
	
	public List<Challenge_list> getList() {
		
		List<Challenge_list> list = null;
		DAO dao = new DAO();
		dao.getConn();
		list = dao.getChallengeList();
		
		return list;
	}
	

}
