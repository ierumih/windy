package com.windy.shop.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.windy.board.action.Action;
import com.windy.shop.svc.ProductListService;
import com.windy.vo.ActionForward;
import com.windy.vo.Product;

public class ProductListAction implements Action {
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		ActionForward forward = null;
		String p_kind = request.getParameter("p_kind");
		
		if(p_kind==null) {
			forward = new ActionForward();
			ProductListService productListService = new ProductListService();
			List<Product> Blist = productListService.Bproductlist();
			request.setAttribute("Blist",Blist);
			forward.setPath("shop_main.jsp");
		}
		else {
			forward = new ActionForward();
			ProductListService productListService = new ProductListService();
			List<Product> list = productListService.productlist(p_kind);
			request.setAttribute("list", list);
			request.setAttribute("p_kind", p_kind);
			forward.setPath("product_list.jsp");
		}
		
		// p_kind 로 받은 값을 기준으로 상품 진열해야함. 디테일 하고 넘어오셈
		return forward;
	}
}
