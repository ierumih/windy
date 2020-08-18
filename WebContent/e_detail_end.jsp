<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.windy.dao.DAO" %>
<%@page import="com.windy.vo.Event" %>
<%@page import="com.windy.vo.Event_p" %>
<%@page import="java.text.DecimalFormat" %>
<%@page import="java.util.*" %>

<%
	Event Edetail = (Event)request.getAttribute("Edetail");
	List<Event_p> Ewinner = (List<Event_p>)request.getAttribute("Ewinner");
	System.out.println("번호"+Edetail.getE_num());
	
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
	.main_btn{
		width: 302px;
	    height: 77px;
	    /*background: linear-gradient(15deg, #f78d3f,#fcd271);*/
	    background:#9ed6f3;
	    color: #102e37;
	    font-size: 17pt;
	    font-weight: bold;
	    border-radius: 5px;
	    border: none;
    }
    .sub_btn{
	    float: right;
	    width: 79px;
	    height: 39px;
	    background: #e8ede0;
	    border: 1px solid #f1f4ec;
	    font-weight: bold;
    }
     #popup {
	    display: none; /*숨기기*/
	    position: relative;
	    width: 100%;
	    height: 100%;
	    top:0px;
	}

	#popmenu {
	    position: absolute;
	    left: 50%;
	    top: 50%;
	    transform: translate(-50%,-50%);
	    width: 400px;
	    height: 350px;
	    text-align: center;
	    background: #fff;
	    border-radius: 5px;
	    border : 3px solid skyblue;
	    z-index: 10;
	}
	
	.pop_div{
		margin-top:60px;
		font-size:17pt;
		font-family: none;
		font-weight:bold;
	}
	.pop_div2{
		margin-top:10px;
		font-weight: bold;
		font-size:15pt;
		font-family: -webkit-pictograph;
	}
	.pop_div3{
		margin-top:20px;
		font-size:13pt;
		font-family: none;
		font-weight: bold;
	}
	.exit{
		margin-top:10px;
		width:80px;
		height: 35px;
		font-weight: bold;
	}
</style>
<script>
	function back(){
		history.back();
	}
</script>
<script type="text/javascript">
	$(document).ready(function(){
	    $(".main_btn").click(function(){
	        $("#popup").fadeIn();
	    });
	    $(".exit").click(function(){
	        $("#popup").fadeOut();
	    });
	    Swal.fire(  'Good job!',  'You clicked the button!',  'success' );
	});
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
				<div>
					<input type="button" value="당첨자 확인" class="main_btn">
				</div>
				<div id="popup">
			       <div id="popmenu">
			       	   <div class="pop_div">당첨자 명단</div>
			       	   <%
			       			for(int i=0;i<Ewinner.size();i++){
			       				out.println("<div class='pop_div2'>"+Ewinner.get(i).getWinner()+"님</div>");
			       			}
			       	   %>
			           <div class="pop_div3">축하드립니다.</div>
			           <div><input type="button" value="닫기" class="exit"></div>
			       </div>
			   </div>
				<div>
					<input type="button" value="목록" onclick="back()" class="sub_btn">
				</div>
			</div>
		</div>
	<hr style="clear:both;">
	<footer>
		<jsp:include page="footer2.jsp"/>
	</footer>
</body>
</html>