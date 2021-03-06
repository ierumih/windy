<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
	String id = (String) session.getAttribute("id");
	String nick = (String) session.getAttribute("nick");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
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
	  <link rel="stylesheet" type="text/css" href="css/header2.css">
	  <script type="text/javascript" src="js/header2.js"></script>
</head>
<body>
	<div id = "headt">
			<div id = "headl">
				<a href = "index.jsp"><img id = "logo" src = "img/qwer.jpg"></a>
				windy
			</div>
			<div id = "headr">
				<div>
					<%if(id!=null) {%><a href ="mypage.b">마이페이지</a> | <a href = "logout.jsp?ur=index.jsp">로그아웃</a>
					<%}else {%><a href ="join.jsp">회원가입</a> | <a href = "login.jsp">로그인</a><%} %>
				</div>
			</div>
		
		<div id = "headb">
			<ul id = "menu">
				<li>
					<a href = "bike_kind.jsp">자전거 정보</a>
				</li>
				<li>
					투어
				</li>
				<li>
					<a href = "eventlisting.b">이벤트</a>
				</li>
				<li>
					<a href = "course.jsp">추천 코스</a>
				</li>
				<li>
					<a href = "boardlist.b?board_name=freeb">게시판</a>
				</li>
				<li>
					<a href = "shopBestList.b">쇼핑몰</a>
				</li>
				<li>
					<a href="checkBMI.b">건강관리</a>
				</li>
			</ul>
			<div id = "submenu">
				<div id = "submenuin">
						<ul>
							<li><a href = "bike_kind.jsp">자전거 정보</a></li>
						</ul>
						<ul>
							<li>전국 투어</li>
							<li>투어 계획 세우기</li>
							<li><a href="challengeList.b">업적</a></li>
							<li>추천 동선</li>
							<li>수리점 찾기</li>
						</ul>
						<ul>
							<li><a href = "eventlisting.b">진행중인 이벤트</a></li>
							<li><a href = "eventlistend.b">종료된 이벤트</a></li>
						</ul>
						<ul>
							<li><a href = "course.jsp">추천 코스<a></a></li>
							<li><a href = "courseboardlist.b">추천 코스 정보</a></li>
						</ul>
						<ul>
							<li>자유게시판</li>
							<li>인증게시판</li>
							<li>거래게시판</li>
						</ul>
						<ul>
							<li><a href = "shopBestList.b">자전거</a></li>
							<li><a href = "mypage.b">장바구니</a></li>
						</ul>
						<ul>
							<li><a href="checkBMI.b">비만도 계산기</a></li>
						</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>