<%@ page language = "java" contentType = "text/html; charset = UTF-8" pageEncoding = "UTF-8" %>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.windy.dao.DAO" %>
<%@page import="com.windy.vo.Board" %>
<%@page import="java.util.*" %>
<%@ page import="java.net.URLEncoder"%>
<%
	Board board = new Board();
	board.setBoard_num(Integer.valueOf(request.getParameter("board_num")));
	board.setBoard_name(request.getParameter("board_name"));
	String cn = URLEncoder.encode(board.getBoard_name()+request.getParameter("nick")+board.getBoard_num(), "utf-8");
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
		DAO.boardgoodupd(board);
		
		Cookie cookie_good = new Cookie(cn, "ok");
		cookie_good.setMaxAge(60*60*24);
		cookie_good.setPath("/");
		response.addCookie(cookie_good);
	}
	out.print(cnt);
%>