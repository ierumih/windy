package com.windy.board.svc;

import com.windy.dao.DAO;
import com.windy.vo.Board;

public class BoardViewSVC {
	
	public boolean boardviewupd(Board board) {
		DAO.getConn();
		int chk = DAO.boardviewupd(board);
		boolean success = false;
		if(chk>0)
			success = true;
		return success;
	}
	
	public Board boardview(Board board) {
		DAO.getConn();
		Board board1 = DAO.view(board);
		board1.setBoard_name(board.getBoard_name());
		return board1;
	}
}
