package com.windy.bike.svc;

import java.util.ArrayList;
import java.util.List;

import com.windy.dao.DAO;
import com.windy.vo.B_comment;
import com.windy.vo.Bike;

public class BikeCommentService {
	public List<B_comment> BikeComment(String comment){
		DAO.getConn();
		List<B_comment> commentlist = new ArrayList<B_comment>();
		commentlist = DAO.BikeComment(comment);
		return commentlist;
	}
	public List<Bike> BikeList(String comment){
		DAO.getConn();
		List<Bike> bikelist = new ArrayList<Bike>();
		bikelist = DAO.BikeListSelect(comment);
		
		return bikelist;
	}
	
}
