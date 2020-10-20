<%@ page language = "java" contentType = "text/html; charset = UTF-8" pageEncoding = "UTF-8" %>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.windy.dao.DAO" %>
<%@page import="com.windy.vo.Board" %>
<%@page import="java.util.*" %>
<%@ page import="java.net.URLEncoder"%>
<%
	Board board = new Board();
	board.setNick(request.getParameter("nick"));
	board.setBoard_num(Integer.valueOf(request.getParameter("board_num")));
	board.setBoard_name(request.getParameter("board_name")+"reply");
	board.setBoard_content(request.getParameter("rep_cont"));
	
	SqlSessionFactory sqlfactory = DAO.getConn();
	int chk = DAO.reply(board);
	out.print(chk);
%>