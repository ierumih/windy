package com.windy.bike.svc;

import java.util.ArrayList;
import java.util.List;

import com.windy.dao.DAO;
import com.windy.vo.Bike;

public class BikeListService {
	public List<Bike> BikeList(String select){
		DAO.getConn();
		List<Bike> Bikelist = new ArrayList<Bike>();
		Bikelist = DAO.BikeList(select);
		
		return Bikelist;
	}
	
	// 뒤로가기로 넘어오는 svc
	public List<Bike> BikeList2(String num){
		DAO.getConn();
		List<Bike> Bikelist = new ArrayList<Bike>();
		Bikelist = DAO.BikeBackList(num);
		
		return Bikelist;
	}
}
