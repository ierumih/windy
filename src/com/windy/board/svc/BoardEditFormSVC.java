package com.windy.board.svc;

import com.windy.dao.DAO;
import com.windy.vo.Board;

public class BoardEditFormSVC {
	public String writerchk(Board board) throws Exception{
		DAO.getConn();
		String writer = DAO.writerchk(board);
		return writer;
	}
}
