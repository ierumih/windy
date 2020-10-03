package com.windy.shop.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.windy.board.action.Action;
import com.windy.shop.svc.FindProductService;
import com.windy.vo.ActionForward;
import com.windy.vo.Page;
import com.windy.vo.Product;

public class FindProductAction implements Action {
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
		ActionForward forward = new ActionForward();
		Product pd = new Product();
		Page page = new Page();
		List<Product> list = new ArrayList<Product>();
		
		String [] kind = request.getParameterValues("f_kind");
    	String [] size = request.getParameterValues("f_size");
    	String [] name = request.getParameterValues("f_brand");
    	int p_price = Integer.valueOf(request.getParameter("f_cost"));
    	String p_kind = String.join("|",kind);
    	String p_size= String.join("|",size);
    	String p_name = String.join("|",name);
    	pd.setP_price(p_price);
    	pd.setP_kind(p_kind);
    	pd.setP_size(p_size);
    	pd.setP_name(p_name);
    	
    	FindProductService fs = new FindProductService();
    	list = fs.findproduct(pd);
    	request.setAttribute("list", list);
    	forward.setPath("find_product.jsp");
    	
		return forward;
	}
}
