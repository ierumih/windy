package com.windy.mypage.svc;

import java.util.List;

import com.windy.dao.DAO;
import com.windy.vo.Board;

public class boardsSelectService {
	
	public List<Board> getMyBoardList(String nick) {
		List<Board> board = null;
		DAO dao= new DAO();
		dao.getConn();
		board = dao.getMyBoard(nick);
		return board;
	}
	
	
}
