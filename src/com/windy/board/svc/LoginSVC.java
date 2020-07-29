package com.windy.board.svc;

import com.windy.dao.DAO;
import com.windy.vo.User;

public class LoginSVC {

	public String Login(User user) throws Exception{
		DAO.getConn();
		String nick = "";
		User user1 = DAO.login(user);
		if(user1!=null&&user1.getPw().equals(user.getPw())) {
			nick = user1.getNick();
		}
		return nick;
	}
}
