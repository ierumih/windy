package com.windy.bike.svc;

import com.windy.dao.DAO;
import com.windy.vo.B_comment;

public class CommentInsertService {
	public boolean CommentInsert(B_comment comment) throws Exception{
		DAO.getConn();
		int chk = DAO.CommentInsert(comment);
		boolean Success = false;
		if(chk>0)
			Success = true;
		return Success;
	}
}
