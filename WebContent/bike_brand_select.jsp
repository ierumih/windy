<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.windy.dao.DAO" %>
<%@page import="com.windy.vo.Bike" %>
<%@page import="com.windy.vo.B_comment" %>
<%@page import="java.text.DecimalFormat" %>
<%@page import="java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
<head>
	<title>windy</title>
	  <link rel="shortcut icon" type="image⁄x-icon" href="img/qwer.jpg">
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
<%
	List<Bike> BikeList= (List<Bike>)request.getAttribute("Bikelist");
	String id = (String) session.getAttribute("id");
%>
<style>
	main{
		width: 1080px;
		position: relative;
		margin-bottom: 50px;
	}
	.head_tag{
		width: 1080px;
		border-bottom: 1px solid #ddd;
		margin: 50px 0 50px 0;
		padding-bottom:20px;
	}
	.head_tag img{
		width: 350px;
		max-height: 130px;
	}
	.main_grid{
		width: 1080px;
	}
	.main_grid ul li{
		display: inline-block;
		border: 1px solid #ddd;
		margin-bottom: 30px;
	}
	.main_grid ul li:nth-child(3n){
		margin-left:25px;
	}
	.main_grid ul li:nth-child(3n-1){
		margin-right:25px;
	}
	.main_grid ul img{
		width: 336px;
		height: 250px;
	}
	.main_grid2 a{
		font-size: 11pt;
		font-weight: bold;
		padding: 10px 0 0 15px;
		margin-bottom:0px;
		color:black;
	}
	.main_grid3{
		float:right;
		font-size: 10pt;
		font-weight: bold;
		padding: 5px 10px 10px 0;
		color:black;
	}
	
	
</style>

<body>
	<header>
		<jsp:include page="header2.jsp"/>
	</header>
		<main>
			<div class="head_tag"><img src=<%=BikeList.get(0).getBike_logo() %>></div>
			<div class="main_grid">
				<ul>
				<%
					for(int i=0;i<BikeList.size();i++) {
						out.println("<a href='bikecomment.b?bike_num="+BikeList.get(i).getBike_num()+"'><li><img src="+BikeList.get(i).getBike_pic()+">");
						out.println("<p class='main_grid2'>"+BikeList.get(i).getBike_name()+"</a></p>");
						out.println("<p class='main_grid3'>"+BikeList.get(i).getBike_price()+"원</p></li>");
					}
				%>
				</ul>
			</div>
		</main>
		
	<hr style="clear:both;">
	<footer>
		<jsp:include page="footer2.jsp"/>
	</footer>
</body>
</html>