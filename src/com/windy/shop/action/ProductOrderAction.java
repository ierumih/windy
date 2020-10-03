package com.windy.shop.action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.windy.board.action.Action;
import com.windy.shop.svc.ProductDetailService;
import com.windy.shop.svc.ProductOrderService;
import com.windy.vo.ActionForward;
import com.windy.vo.Order;
import com.windy.vo.Product;

public class ProductOrderAction implements Action {
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		ActionForward forward = new ActionForward();
		
		List<Order> or_list = new ArrayList<Order>();
		String add = request.getParameter("add");
		String [] count = request.getParameterValues("count");
    	String [] p_price = request.getParameterValues("p_price");
    	String p_code = request.getParameter("p_code");
    	String id = request.getParameter("id");
    	String [] op = request.getParameterValues("op");
    	
    	for(int i=0;i<op.length;i++) {
    		Order order = new Order();
    		order.setO_code(p_code);
    		order.setO_count(Integer.valueOf(count[i]));
    		order.setO_price(Integer.valueOf(p_price[i]));
    		order.setP_code(p_code);
    		order.setId(id);
    		order.setO_option(op[i]);
    		if(add.equals("on")) {
    			order.setO_state("addcart");
        	}else{
        		order.setO_state("wait");
        	}
    		or_list.add(order);

    	}
    	
		ProductOrderService productorderservice = new ProductOrderService();
		boolean success = productorderservice.productOrder(or_list);
		if(!success) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('주문실패')");
			out.println("history.back();");
			out.println("</script>");
		}
		else {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("shopBestList.b");
		}
		
		
		return forward;
	}
}
