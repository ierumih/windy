package com.windy.shop.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.windy.board.action.Action;
import com.windy.shop.svc.ProductDetailService;
import com.windy.vo.ActionForward;
import com.windy.vo.P_review;
import com.windy.vo.Product;

public class ProductDetailAction implements Action {
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		ActionForward forward = new ActionForward();
		String code = request.getParameter("p_code");
		ProductDetailService productdetailservice = new ProductDetailService();
		Product detail = productdetailservice.productdetail(code);
		List<Product> option = productdetailservice.option(code);
		List<P_review> p_review = productdetailservice.p_review(code);
		request.setAttribute("option", option);
		request.setAttribute("detail", detail);
		request.setAttribute("p_review", p_review);
		forward.setPath("product_detail.jsp");
		
		return forward;
	}

}
