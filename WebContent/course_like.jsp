<%@ page language = "java" contentType = "text/html; charset = UTF-8" pageEncoding = "UTF-8" %>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.windy.dao.DAO" %>
<%@page import="com.windy.vo.Course" %>
<%@page import="java.util.*" %>
<%@ page import="java.net.URLEncoder"%>
<%
	Course course = new Course();
	course.setC_num(Integer.valueOf(request.getParameter("c_num")));
	String cn = URLEncoder.encode(request.getParameter("nick")+course.getC_num(), "utf-8");
	int cnt=0;
	Cookie[] cookies = request.getCookies();
	if(cookies!=null){
		for(int i=0;i<cookies.length;i++){
			if(cookies[i].getName().equals(cn)&&cookies[i].getValue().equals("ok")){
				cnt=1;
			}
		}
	}
	if(cnt==0){
		SqlSessionFactory sqlfactory = DAO.getConn();
		DAO.courseboardgoodupd(course);
		
		Cookie cookie_good = new Cookie(cn, "ok");
		cookie_good.setMaxAge(60*60*24);
		cookie_good.setPath("/");
		response.addCookie(cookie_good);
	}
	out.print(cnt);
%>