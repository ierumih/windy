package com.windy.board.svc;

import com.windy.dao.DAO;
import com.windy.vo.Board;

public class BoardEditSVC {

	public boolean BoardEdit(Board board) throws Exception{
		DAO.getConn();
		int chk = DAO.boardupd(board);
		boolean Success = false;
		if(chk>0)
			Success = true;
		return Success;
	}
}
