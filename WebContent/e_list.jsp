<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.windy.dao.DAO" %>
<%@page import="com.windy.vo.Event" %>
<%@page import="java.text.DecimalFormat" %>
<%@page import="java.util.*" %>
<%
	List<Event> Elist = (List<Event>)request.getAttribute("Elist");
%>
<!DOCTYPE html>
<html>
<head>
	<title>WINDY</title>
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
	<meta charset="utf-8">
	<style>
		/*@font-face {
			font-family:Noto Sans CJK Regular;
			src:url(https://dl.dropboxusercontent.com/s/zkw6tapuv8oj6cn/NSKR400.woff);}
		*/
		#wrap{
			width: 1080px;
			height: 1500px;
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
		.title p{
			float:right;
			margin-top:30px;
		}
		
		.title h2{
			float:left;
			margin:0 0 0 0;
			font-weight: bold;
			padding-top:20px;
		}
		.row{
			margin-top: 30px;
		}
		.row li{
			min-width: 343px;
			height: 330px;
			border: 1px solid black;
			display: inline-block;
			list-style-type: none;
			margin: 20px 0 25px 15px;
		}
		.row li img{
			width: 343px;
			height: 220px;
		}
		.row li div{
			margin-top:15px;
			font-size: 14pt;
			text-align: center;
			font-weight: bold;
		}
		.row li p{
			margin-top:10px;
			text-align: center;
			color:#888;
		}
		.row li p span{
			padding-left:10px;
			width:60px;
			border-left:1px solid #888;
			color:#e65700;		
		}
		.row a{
			color:black;
		}
		.row a:hover{
			color:black;
			text-decoration:none;
		}
		.event{
			margin:30px 0 0 15px;
			float:left;
		}
		.event li{
			display:inline;
			color:inherit;
			width:25px;
			padding-left:10px;
			border-left:2px solid #ddd;
		}
		.event li a{
			color:black;
		}
		.event li:first-child {
			color:#e65700;
		}
		.pp{
			width: 1080px;
			height: 800px;
		}
	</style>	
<body>
	
 	<header>
		<jsp:include page="header2.jsp"/>
	</header>
	
		<div id="wrap">
			<div class="board_head">
				<div class="title">
					<h2>
						이벤트
					</h2>
					<ul class="event">
						<li><a href="">진행중인 이벤트</a></li>
						<li><a href="">종료된 이벤트</a></li>
						<li><a href="">당첨자 발표</a></li>
					</ul>
					<p>윈디에서만 즐길 수 있는 다양한 이벤트, 농치지 마세요!</p>
				</div>			
			</div>
			<div class="pp">
				<ul class='row'>
			
			<%for(int i=0;i<Elist.size();i++) {
				
				out.println("<a href='productDetail.b?E_num="+Elist.get(i).getE_num()+"'><li><img src="+Elist.get(i).getE_sum()+">");
				out.println("<div>"+Elist.get(i).getE_title()+"</div>");
				out.println("<p> 이벤트기간 <span>"+Elist.get(i).getS_date()+"~"+Elist.get(i).getE_date()+"</span></p></a></li>");
			}%>
				</ul>
			</div>
		</div>
	
	
	<hr style="clear:both;">
		<footer>
			<jsp:include page="footer2.jsp"/>
		</footer>
	

</body>
</html>