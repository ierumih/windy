<%@ page language = "java" contentType = "text/html; charset = UTF-8" pageEncoding = "UTF-8" %>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.windy.dao.DAO" %>
<%@page import="com.windy.vo.B_comment" %>
<%@page import="java.util.*" %>
<%
	int no = Integer.valueOf(request.getParameter("no"));
	String content = request.getParameter("content");
	SqlSessionFactory sqlactory = DAO.getConn();
	B_comment comment = new B_comment();
	comment.setComment_no(no);
	comment.setComment_content(content);
	
	DAO.CommentEdit(comment);
	
%>
