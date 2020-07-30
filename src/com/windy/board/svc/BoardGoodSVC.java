//package com.windy.board.svc;
//
//import com.windy.dao.DAO;
//import com.windy.vo.Board;
//
//public class BoardGoodSVC {
//
//	public boolean BoardGood(Board board) {
//		DAO.getConn();
//		Boolean success = false;
//		int chk = DAO.boardgoodupd(board);
//		if (chk>0)
//			success = true;
//		return success;
//	}
//}
