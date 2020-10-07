<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.windy.dao.DAO"%>
<%@page import="com.windy.vo.Event"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.*, java.text.*"%>
<%@page import="com.windy.vo.Page"%>
<%
	List<Event> Elistend = (List<Event>) request.getAttribute("Elistend");
	Page eventpage = (Page) request.getAttribute("page");
	int p = eventpage.getCurrentpage();
	int pag = eventpage.getEndpage();
%>
<!DOCTYPE html>
<html>
<head>
<title>windy</title>
<link rel="shortcut icon" type="image⁄x-icon" href="img/qwer.jpg">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!--tap bar slide-->
<script src="tendina-master/dist/tendina.js"></script>
<!--font-->
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Rowdies:wght@300&display=swap"
	rel="stylesheet">
<!--font-->
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
</head>
<meta charset="utf-8">
<style>
/*@font-face {
			font-family:Noto Sans CJK Regular;
			src:url(https://dl.dropboxusercontent.com/s/zkw6tapuv8oj6cn/NSKR400.woff);}
		*/
#wrap {
	width: 1080px;
	height: 910px;
}

.board_head {
	width: 1080px;
	float: left;
	margin: 30px 0 0 0;
	letter-spacing: -1px;
	padding-bottom: 15px;
	text-align: left;
	border-bottom: 1px solid #ddd;
	height: 65px;
}

.title {
	width: 1080px;
	float: left;
	height: 50px;
}

.title p {
	float: right;
	margin-top: 30px;
}

.title h2 {
	float: left;
	margin: 0 0 0 0;
	font-weight: bold;
	padding-top: 20px;
}


.row li {
	min-width: 343px;
	height: 330px;
	border: 1px solid black;
	display: inline-block;
	list-style-type: none;
	margin: 20px 0 25px 15px;
}

.row li img {
	width: 343px;
	height: 220px;
	border-bottom: 1px solid black;
}

.row li div {
	margin-top: 15px;
	font-size: 14pt;
	text-align: center;
	font-weight: bold;
}

.row li p {
	margin-top: 10px;
	text-align: center;
	color: #888;
}

.row li p span {
	padding-left: 10px;
	width: 60px;
	border-left: 1px solid #888;
	color: #e65700;
}

.row a {
	color: black;
}

.row a:hover {
	color: black;
	text-decoration: none;
}

.event {
	margin: 30px 0 0 15px;
	float: left;
}

.event li {
	display: inline;
	color: inherit;
	width: 25px;
	padding-left: 10px;
	border-left: 2px solid #ddd;
}

.now {
	color: #e65700;
}

.now:hover {
	color: #e65700;
	text-decoration: none;
}

.not {
	color: black;
}

.not:hover {
	color: black;
	text-decoration: none;
}

.pp {
	width: 1080px;
	heigth:845px;
}
.page{
	clear: both;
	position: relative;
	bottom: 45px;
	top:0px;
}
.search {
	background-color: #cccccc4f;
	border: 1px solid black;
	align-items: center;
	border-radius: 5px;
	padding: 5px 10px 5px 9px;
	vertical-align: middle;
	margin: 0 10px 0 10px;
	font-size:9pt;
	width: 44px;
	height: 28px;
}

.num {
	text-align: center;
	margin-top: 20px;
	word-spacing: 5px;
	padding-bottom: 10px;
}

.num li {
	display: inline;
	word-spacing: 10px;
}

.num li:first-of-type {
	margin-left: 10px;
}

.num li:last-of-type {
	margin-right: 10px;
}
</style>
<body>

	<header>
		<jsp:include page="header2.jsp" />
	</header>

	<div id="wrap">
		<div class="board_head">
			<div class="title">
				<h2>이벤트</h2>
				<ul class="event">
					<li><a href="eventlisting.b" class="not">진행중인 이벤트</a></li>
					<li><a href="eventlistend.b" class="now">종료된 이벤트</a></li>
				</ul>
				<p>윈디에서만 즐길 수 있는 다양한 이벤트, 놓치지 마세요!</p>
			</div>
		</div>
		<div class="pp">
			<ul class='row' style="height:845px;">

				<%
					for (int i = 0; i < Elistend.size(); i++) {

						out.println("<a href='eventdetailend.b?e_num=" + Elistend.get(i).getE_num() + "'><li><img src="
								+ Elistend.get(i).getE_sum() + ">");
						out.println("<div>" + Elistend.get(i).getE_title() + "</div>");
						out.println("<p> 이벤트기간 <span>" + Elistend.get(i).getS_date() + " ~ " + Elistend.get(i).getE_date()
								+ "</span></p></a></li>");
					}
				%>
			</ul>
		</div>
		<div style="">
			<table>
				<tr>
					<%
						if (p > 1) {
					%>
					<td><input type='button' value='이전' class='
						search' onclick="location.href='eventlistend.b?e_date=<%=eventpage.getTime()%>&p=<%=p - 1%>'"></td>
					<%
						}
					%>
					<td><ul class="num">
							<%
								for (int i = (p - 5); i < (p + 5); i++) {
									if ((i > 0) && (i <= pag)) {
										if (i != p) {
							%>
							<a href='eventlistend.b?e_date=<%=eventpage.getTime()%>&p=<%=i%>'><li><%=i%></li></a>
							<%
								} else {
							%>
							<li id='cp'><%=i%></li>
							<%
								}
									}
								}
							%>
						</ul></td>
					<%
						if (p < pag) {
					%>
					<td><input type='button' value='다음' class='search'
						onclick="location.href='eventlistend.b?e_date=<%=eventpage.getTime()%>&p=<%=p + 1%>'"></td>
					<%
						}
					%>
				</tr>
			</table>
		</div>

	</div>


	<hr style="clear: both;">
	<footer>
		<jsp:include page="footer2.jsp" />
	</footer>


</body>
</html>