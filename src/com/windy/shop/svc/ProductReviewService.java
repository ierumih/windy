package com.windy.shop.svc;

import com.windy.dao.DAO;
import com.windy.vo.P_review;

public class ProductReviewService {
	public boolean prw(P_review p_review) {
		DAO.getConn();
		
		int chk = DAO.pr_write(p_review);
		boolean success = false;
		if(chk>0) {
			success = true;
		}
		
		return success;
		
	}
}
