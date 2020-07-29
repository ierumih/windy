<%@ page language = "java" contentType = "text/html; charset = UTF-8" pageEncoding = "UTF-8" %>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.windy.dao.DAO" %>
<%@page import="com.windy.vo.Board" %>
<%@page import="com.windy.vo.User" %>
<%@page import="java.util.*" %>
<html>
 <head>
  <meta charset="UTF-8">
  <title>Document</title>
 </head>
 <body>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String nick = request.getParameter("nick");
	String bry = request.getParameter("birth1");
	String brm = request.getParameter("birth2");
	String brd = request.getParameter("birth2");
	String mail = request.getParameter("email1");
	String e_addr = request.getParameter("email2");
	String tel1 = request.getParameter("tel1");
	String tel2 = request.getParameter("tel2");
	String tel3 = request.getParameter("tel3");
	String sex = request.getParameter("sex");
	String b_have = request.getParameter("have");
	String bikes = request.getParameter("bike");
	String sms = request.getParameter("sms");
	String addr = request.getParameter("addr1");
	String addr1 = request.getParameter("addr2");
	String addr2 = request.getParameter("addr3");
	String addr3 = request.getParameter("addr4");
	String birth = bry+"/"+brm+"/"+brd;
	String etc = request.getParameter("etc");
	String tel = tel1+tel2+tel3;
	String email = mail+"@"+e_addr;
	String f_bike="";
	User user = new User();
	user.setId(id);
	user.setPw(pw);
	user.setName(name);
	user.setNick(nick);
	user.setBirth(birth);
	user.setEmail(email);
	user.setTel(tel);
	user.setSex(sex);
	user.setAddr(addr);
	user.setAddr1(addr1);
	user.setAddr2(addr2);
	user.setAddr3(addr3);
	user.setB_have(b_have);
	user.setF_bike(f_bike);
	user.setSms(sms);

	if(request.getParameter("etc")==null)
		f_bike=bikes;
	else
		f_bike = bikes+", "+etc;
	
	SqlSessionFactory sqlfactory = DAO.getConn();
	
	User users = DAO.sid(id);
	if(users!=null){
		out.print("<script>alert('이미 존재하는 아이디입니다');</script>");
		out.print("<script>history.back();</script>");
	}
	DAO.join(user);
	out.print("<script>alert('회원 가입이 완료되었습니다. 메인 페이지로 이동합니다.');</script>");
	out.print("<script>location.href='main.jsp';</script>");

	
%>

</body>
</html>
