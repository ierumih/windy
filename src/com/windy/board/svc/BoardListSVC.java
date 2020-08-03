package com.windy.board.svc;

import java.util.*;

import com.windy.dao.DAO;
import com.windy.vo.Board;
import com.windy.vo.Page;


public class BoardListSVC {
	

	public Page boardcount(String board_name) {
		DAO.getConn();
		Page page = new Page();
		int listcount = DAO.count(board_name);
		page.setListcount(listcount);
		page.setEndpage((int) Math.ceil((double) listcount/20));
		return page;
	}

	public List<Board> boardlist(Page page){
		List<Board> listb = new ArrayList<Board>();
		DAO.getConn();
		listb = DAO.boardlist(page);
		return listb;
	}
	
	public Page boardcounts(Page page) {
		DAO.getConn();
		Page page1 = new Page();
		int listcount = DAO.csearch(page);
		page1.setListcount(listcount);
		page1.setEndpage((int) Math.ceil((double) listcount/20));
		return page1;
	}
	
	public List<Board> boardlists(Page page){
		List<Board> listb = new ArrayList<Board>();
		DAO.getConn();
		listb = DAO.boardlists(page);
		return listb;
	}
}

