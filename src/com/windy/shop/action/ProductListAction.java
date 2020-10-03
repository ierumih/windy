package com.windy.shop.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.windy.board.action.Action;
import com.windy.shop.svc.ProductListService;
import com.windy.vo.ActionForward;
import com.windy.vo.Page;
import com.windy.vo.Product;

public class ProductListAction implements Action {
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		ActionForward forward = null;
		String p_kind = request.getParameter("p_kind");
		Page page = new Page();
		
		if(p_kind==null) {
			forward = new ActionForward();
			ProductListService productListService = new ProductListService();
			List<Product> Rlist = productListService.Bproductlist_r();
			List<Product> Mlist = productListService.Bproductlist_m();
			List<Product> Hlist = productListService.Bproductlist_h();
			request.setAttribute("Rlist",Rlist);
			request.setAttribute("Mlist",Mlist);
			request.setAttribute("Hlist",Hlist);
			forward.setPath("shop_main.jsp");
		}
		else {
			forward = new ActionForward();
			ProductListService productListService = new ProductListService();
			page = productListService.paging(p_kind);
			if(request.getParameter("p")!=null)
				page.setCurrentpage(Integer.valueOf(request.getParameter("p")));
			else
				page.setCurrentpage(1);
			page.setS_limitindex();
			page.setP_kind(p_kind);
			List<Product> list = productListService.productlist(page);
			request.setAttribute("list", list);
			request.setAttribute("page", page);
			forward.setPath("product_list.jsp");
		}
		
		return forward;
	}
}
