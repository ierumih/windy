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
		ActionForward forward = new ActionForward();
		
		ProductListService productListService = new ProductListService();
		List<Product> list = productListService.productlist();
		request.setAttribute("list",list);
		forward.setPath("shop_main.jsp");
		return forward;
	}
}
