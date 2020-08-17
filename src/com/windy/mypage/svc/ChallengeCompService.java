package com.windy.mypage.svc;

import java.util.List;

import com.windy.dao.DAO;
import com.windy.vo.Challenge_comp;

public class ChallengeCompService {
	
	public List<Challenge_comp> getCompChallengeList(String id) {
		List<Challenge_comp> cc = null;
		DAO dao= new DAO();
		dao.getConn();
		cc = dao.getCompChallengList(id);
		
		return cc;
	}

}
