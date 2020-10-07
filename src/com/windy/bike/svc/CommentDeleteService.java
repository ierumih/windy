package com.windy.bike.svc;

import com.windy.dao.DAO;
import com.windy.vo.B_comment;

public class CommentDeleteService {
	public boolean CommentDelete(B_comment comment) throws Exception{
		DAO.getConn();
		System.out.println("svc"+comment.getComment_no());
		int chk = DAO.commentdelete(comment);
		boolean Success = false;
		if(chk>0)
			Success = true;
		return Success;
	}
}
