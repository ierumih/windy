package com.windy.mypage.svc;

import com.windy.dao.*;

public class DeleteAccountService {
	
	public void deleteService(String id) throws Exception{
		System.out.println("service in:");
		DAO dao = new DAO();
		dao.getConn();
		dao.deleteAccount(id);
		System.out.println("service out:");
		
	}

}
