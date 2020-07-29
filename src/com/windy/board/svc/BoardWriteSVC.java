package com.windy.board.svc;

import com.windy.dao.DAO;
import com.windy.vo.Board;

public class BoardWriteSVC {
	
	public boolean BoardWrite(Board board) throws Exception{
		DAO.getConn();
		int chk = DAO.ins(board);
		boolean Success = false;
		if(chk>0)
			Success = true;
		return Success;
	}
}
