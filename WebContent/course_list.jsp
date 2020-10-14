<%@ page language = "java" contentType = "text/html; charset = UTF-8" pageEncoding = "UTF-8" %>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.windy.dao.DAO" %>
<%@page import="com.windy.vo.Course" %>
<%@page import="java.util.*" %>
<%@page import="com.google.gson.*" %>
<%
	List<Course> coursel = (List<Course>)request.getAttribute("coursel");
	Gson gson = new Gson();
	String courselist = gson.toJson(coursel);
	System.out.println(courselist);
	out.print(courselist);
%>
