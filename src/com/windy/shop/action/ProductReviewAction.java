package com.windy.shop.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.windy.board.action.Action;
import com.windy.shop.svc.ProductReviewService;
import com.windy.vo.ActionForward;
import com.windy.vo.P_review;

public class ProductReviewAction implements Action {
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		ActionForward forward = null;
		P_review p_review = new P_review();
		ProductReviewService productreviewservice = new ProductReviewService();
		
		String p_code = request.getParameter("p_code");
		p_review.setNick(request.getParameter("nick"));
		p_review.setP_code(p_code);
		p_review.setPr_star(request.getParameter("star"));
		p_review.setPr_title(request.getParameter("rev_title"));
		p_review.setPr_text(request.getParameter("rev_text"));
		boolean success = productreviewservice.prw(p_review);
		if(!success) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert(작성 실패)");
			out.println("history.back();");
			out.println("</script>");
		}else {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("productDetail.b?p_code="+p_code);
		}
		
		return forward;
	}
}
