package com.windy.event.svc;

import com.windy.dao.DAO;
import com.windy.vo.Event_p;

public class EventInsertService {
	
	public boolean EventInsert(Event_p event) throws Exception{
		
		String id = event.getId();
		String e_num = event.getE_num();
		
		DAO.getConn();
		int chk = DAO.insert(event);
		boolean Success = false;
		if(chk>0)
			Success = true;
		return Success;
	}
}
