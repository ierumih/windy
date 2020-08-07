<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.windy.dao.DAO" %>
<%@page import="com.windy.vo.Event" %>
<%@page import="java.text.DecimalFormat" %>
<%@page import="java.util.*" %>
<%
	Event Edetail = (Event)request.getAttribute("Edetail");
%>
<!DOCTYPE html>
<html>
<head>
	<title>Detail</title>
	  <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	  <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	  <!--tap bar slide-->
	  <script src="tendina-master/dist/tendina.js"></script>
	  <!--font-->
	  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap"  rel="stylesheet">
	  <link href="https://fonts.googleapis.com/css2?family=Rowdies:wght@300&display=swap" rel="stylesheet">  <!--font-->
	  <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
</head>
<style>
	#wrap{
		position: relative;
		width: 1080px;
		margin: 0 auto;
		padding-bottom: 150px;
		text-align:center;
	}
	.board_head{
		width:1080px;
		float: left;
	    margin: 30px 0 0 0; 
	    letter-spacing: -1px;
	    padding-bottom:15px;
		text-align:left;
		border-bottom:1px solid #ddd;
		height:65px;
	}
	.title{
		width:1080px;
		float:left;
		height:50px;
	}
	.title h2{
		float:left;
		margin:0 0 0 0;
		font-weight: bold;
		padding-top:20px;
	}
	.title_right{
		float: right;
		margin-top: 10px;
	}
	.main{
		padding-top: 50px;
		clear: both;
	}
	.main_content{
		text-align:left;
		margin-top:80px;
		font-size:13pt;
	}
	.main img{
		width:1080px;
	}
</style>
<script>
	function back(){
		history.back();
	}
</script>
<body>
	<header>
		<jsp:include page="header2.jsp"/>
	</header>
	<div id="wrap">
			<div class="board_head">
				<div class="title">
					<h2>
						<%=Edetail.getE_title() %>
					</h2>					
				</div>			
			</div>
			<div class="title_right">
				<%=Edetail.getS_date() %> ~ <%=Edetail.getE_date() %>
			</div>
			<div class="main">
				<article>
					<div>
						<img src="<%=Edetail.getE_file() %>">
					</div>
					<div class="main_content">
						<%=Edetail.getE_content() %>
					</div>
				</article>
			</div>
			<div>
				<input type="button" value="이벤트 참여하기">
				<input type="button" value="목록" onclick="back()">
			</div>
		</div>
	<hr style="clear:both;">
	<footer>
		<jsp:include page="footer2.jsp"/>
	</footer>
</body>
</html>