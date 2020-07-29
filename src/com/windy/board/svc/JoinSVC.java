package com.windy.board.svc;

import com.windy.dao.DAO;
import com.windy.vo.User;

public class JoinSVC {

	public boolean join(User user) throws Exception{
		DAO.getConn();
		int chk = DAO.join(user);
		boolean Success = false;
		if(chk>0)
			Success = true;
		return Success;
	}
}
