<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="com.windy.dao.DAO" %>
<%@page import="com.windy.vo.P_review"%>
<%@page import="com.windy.vo.Order"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%
	P_review p_review = new P_review();
	Order order = new Order();
    String a = request.getParameter("title");
    String id = request.getParameter("id");
	String p_code = request.getParameter("code");
	
	p_review.setNick(request.getParameter("nick"));
	p_review.setP_code(p_code);
	p_review.setPr_star(request.getParameter("star"));
	p_review.setPr_title(request.getParameter("title"));
	p_review.setPr_text(request.getParameter("content"));

	order.setP_code(p_code);
	order.setId(id);
	
	SqlSessionFactory sqlfactory = DAO.getConn();
	int chk = DAO.pr_chk(order);
	if(chk==0){
		out.print(chk);	
	}else{
		DAO.pr_write(p_review);
		out.print(chk);
	}
	
	/*JSONObject jo = new JSONObject();
    jo.put("title",a);
    response.setContentType("application/json");
    out.print(jo.toJSONString());*/

%>
