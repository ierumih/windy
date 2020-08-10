package com.windy.shop.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.windy.board.action.Action;
import com.windy.shop.svc.ProductDetailService;
import com.windy.vo.ActionForward;
import com.windy.vo.Product;

public class ProductDetailAction implements Action {
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		ActionForward forward = new ActionForward();
		String code = request.getParameter("p_code");
		ProductDetailService productdetailservice = new ProductDetailService();
		Product detail = productdetailservice.productdetail(code);
		List<Product> size = productdetailservice.size(code);
		List<Product> color = productdetailservice.color(code);
		List<Product>gear = productdetailservice.gear(code);
		request.setAttribute("size", size );
		request.setAttribute("color", color);
		request.setAttribute("gear", gear );
		request.setAttribute("detail", detail);
		forward.setPath("product_detail.jsp");
		
		return forward;
	}

}
