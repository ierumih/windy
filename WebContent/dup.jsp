<%@ page language = "java" contentType = "text/html; charset = UTF-8" pageEncoding = "UTF-8" %>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.windy.dao.DAO" %>
<%@page import="com.windy.vo.User" %>
<%@page import="java.util.*" %>
<%
	String id = request.getParameter("id");
	SqlSessionFactory sqlfactory = DAO.getConn();
	int cnt = 0;
	User user = DAO.sid(id);
	if(user!=null){
		cnt++;
	}
	out.print(cnt);
%>
