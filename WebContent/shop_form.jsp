<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String id = (String) session.getAttribute("id");
	String nick = (String) session.getAttribute("nick");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title></title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/shop_form.css">
	<script type="text/javascript">
	$(function(){
		$(window).resize(function(){
			var width_size = window.outerWidth;
			if(width_size<=1800){
				$("#menu9").hide();
			}
			else{
				$("#menu9").show();
			}
		})
	});
	</script>
	<style type="text/css">
	
	#title1{
		font-size : 11pt;
		position: fixed;
		top: 46px;
		left: 150px;
		font-weight: bold;
	}
	#inout{
	 float:right;
	 position:relative;
	 right:15px;
	 top:20px;
	 color:rosybrown;
	}
	.inoutla{
		color:rosybrown;
		font-weight:bold;
	}
	.inoutla:hover{
		cursor:pointer;
	}
	</style>
</head>
<body>
	<div id="menu9">
		<a href="shopBestList.b"><span id="title">WINDY</span><span id="title1">shop</span></a>
		<div id="f">
			<ul>
				<li><a href="bikelist.b?p_kind=road">Road</a></li>
				<li><a href="bikelist.b?p_kind=mtb">MTB</a></li>
				<li><a href="bikelist.b?p_kind=hy">Hybrid</a></li>
				<li><a href="bikelist.b?p_kind=etc">etc..</a></li>
			</ul>
		</div>
		<div id="s">
			<ul>
				<li>FindProduct</li>
			</ul>
		</div>
		<div id="add_prod"><a href="admin_add_product.jsp">+</a></div>
	</div>
	<div id="menubtn9">
		<a href="main.jsp"><img src="img/qwer.jpg" id="logo"></a>
	</div>
	<div id="inout">
		<%if(id!=null) {%><label class="inoutla" onclick="location.href='mypage.b'">마이페이지</label> | <label class="inoutla" onclick="location.href='logout.jsp?ur=shopBestList.b'">로그아웃</label>
		<%}else {%><label class="inoutla" onclick="location.href='join.jsp'">회원가입</label> | <label class="inoutla" onclick="location.href='login.jsp'">로그인</label><%} %>
	</div>
	
</body>
</html>