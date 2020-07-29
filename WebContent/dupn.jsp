<%@ page language = "java" contentType = "text/html; charset = UTF-8" pageEncoding = "UTF-8" %>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.windy.dao.DAO" %>
<%@page import="com.windy.vo.User" %>
<%@page import="java.util.*" %>
<%
	String nick = request.getParameter("nick");
	int cnt = 0;
	SqlSessionFactory sqlfactory = DAO.getConn();
	User user = DAO.snick(nick);
	if(user!=null){
		cnt++;
	}
	out.print(cnt);
%>
