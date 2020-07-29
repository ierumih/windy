<%@ page language = "java" contentType = "text/html; charset = UTF-8" pageEncoding = "UTF-8" %>
<%
	String id = (String) session.getAttribute("id");
	String nick = (String) session.getAttribute("nick");
	if(nick!=null){
		out.print("<script>alert('이미 로그인 되어 있습니다.');history.back();</script>");
	}
%>
<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
  <script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
  <title>로그인</title>
	<style>
		*{
			margin:0 auto;
			padding:0;
			font-family: 'Nanum Gothic Coding', monospace;
		}
		#wrapper{
			position:relative;
			width:100%;
			top:0;
			left:0;
		}
		header{
			min-width:1080px;
			position:relative;
			height:140px;
			background:white;
			top:0;
			margin:0 auto;
			left:0;
			right:0;
			z-index:999;
		}
		.fix{
			position:fixed;
			text-align:center;
			top:0;
		}
		#headt{
			width:1080px;
			height:80px;
			position:relative;
		}
		#logo{
			margin-top:-8px;
			width:70px;
			height:70px;
		}
		#headl{
			height:80px;
			float:left;
			font-size:25pt;
			font-weight:900;
			color:black;
			line-height:80px;
			font-family:"굴림";
		}
		#headr{
			width:500px;
			height:80px;
			float:right;
			display:table;
		}
		#headr div{
			width:500px;
			display:table-cell;
			vertical-align:middle;
			text-align:right;
		}
		#headr a{
			color:black;
		}
		#headb{
			width:100%;
			min-width:1080px;
			height:60px;
			color:white;
			clear:both;
			background-color:#303030;		
		}
		#headb a{
			color:white;
			text-decoration:none;
		}
		#menu{
			min-width:1080px;
			height:60px;
			display:table;
			margin-bottom:0;
			font-size:13pt;
		}
		#menu li{
			width:154px;
			display:table-cell;
			text-align:center;
		}
		#menu li a {
			display:block;
			width:100%;
			height:100%;
			line-height:60px;
		}
		#menu li:hover{
			cursor: pointer;
			background-color: #aaaaaa;
		}
		#submenu{
			position:relative;
			min-width:1080px;
			height:175px;
			display:block;
			background-color:#5e5e5e;
			z-index:50;
			padding-top:10px;
		}
		#submenuin{
			display:table;
			line-height:30px;
		}
		#submenuin ul{
			width:154px;
			display:table-cell;
			list-style-type:none;
			text-align:center;
		}
		#submenuin ul li {
			color:white;
			text-align: center;
			line-height: 1.8;
			font-size: 13px;
			list-style-type:none;
		}
		div img{
			vertical-align:middle;
		}
		footer{
			position:relative;
			background-color:#5e5e5e;
			min-width:1080px;
			height:150px;
			margin:auto;
		}
		#foot{
			position:relative;
			padding-top:30px;
			width:1080px;
			height:100px;
			color:white;
		}
		#foot ul{
			list-style-type:none;			
		}
		#foot ul li{
			display:inline;
		}
		#wrap{
			position:relative;
			width:1080px;
			min-height:700px;
			z-index:1;
			padding-top:150px;
			overflow:hidden;
		}
		#cont{
			width:1080px;
			height:400px;
			margin-left:50px;
		}

		#login{
			width:500px;
			height:400px;
			padding-left:50px;
			padding-top:15px;
			float:left;
			border:2px solid #cacaca;
			border-radius:20px;
		}
		#login a{
			color:black;
		}
		#asdf{
			width:580px;
			height:400px;
			float:left;
		}
		input[type=text]{
			width:300px;
			height:40px;
			border:0px;
			border-bottom:1px solid;
			font-size:18pt;
		}
		input[type=password]{
			width:300px;
			height:40px;
			border:0px;
			border-bottom:1px solid;
			font-size:18pt;
		}
		#login img{
			height:50px;
		}
		#asdf img{
			position:relative;
			left:50%;
			transform:translateX(-50%);
			max-width:580px;
			max-height:400px;
		}
		#logint{
			margin-top:45px;
			float:left;
			width:500px;
			height:230px;
		}
		#ltt{
			width:500px;
			float:left;
			height:80px;
		}
		#loginl{
			width:320px;
			height:150px;
			float:left;
		}
		#loginr{
			float:left;
			width:170px;
			height:150px;
		}
		#loginb{
			float:left;
			width:500px;
			height:100px;
		}
		#btn{
			width:80px;
			height:80px;
			margin-top:10px;
			background-color: #ddd;
			border-radius:5px;
			border:0;
			font-weight:700;
			font-size: 15pt;
			text-align: center;
		}
	</style>
 </head>

 <script>
	$(document).ready(function(){
		$("#submenu").hide();
		$("#menu").mouseenter(function(){
			$("#submenu").stop().slideDown(400);
		});
		$("header").mouseleave(function(){
			$("#submenu").stop().slideUp(400);
		});
		$(window).scroll(function(){
			var scr = $(document).scrollTop();
			if (scr>80)
			{
				$("#headb").addClass("fix");
			}
			else {
				$("#headb").removeClass("fix");
			}
		});
	});

 </script>
 <script type="text/javascript">
	var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "개발자센터에 등록한 ClientID",
			callbackUrl: "개발자센터에 등록한 callback Url",
			isPopup: false, /* 팝업을 통한 연동처리 여부 */
			loginButton: {color: "green", type: 3, height: 60} /* 로그인 버튼의 타입을 지정 */
		}
	);
	
	/* 설정정보를 초기화하고 연동을 준비 */
	naverLogin.init();
	
</script>

 <body>
  <div id = "wrapper">
 	<header>
		<div id = "headt">
			<a href = "main.jsp">
				<div id = "headl">
					<img id = "logo" src = "img/logo1.jpg">
					WINDY
				</div>
			</a>
			<div id = "headr">
				<div>
					<%
						if(nick!=null)
							out.print(nick+"님 환영합니다. | <a href = 'logout.jsp'>로그아웃</a>");
						else
							out.print("<a href = 'teamport_join.jsp'>회원가입</a> | <a href = 'login.jsp'>로그인</a>");
					%>
					 | <a href = "mypage.jsp">마이페이지</a>
				</div>
			</div>
		</div>
		<div id = "headb">
			<ul id = "menu">
				<li>
					자전거 정보
				</li>
				<li>
					투어
				</li>
				<li>
					이벤트
				</li>
				<li>
					추천 코스
				</li>
				<li>
					<a href = "board.html">게시판</a>
				</li>
				<li>
					<a href = "shoppingmall.html">쇼핑몰</a>
				</li>
				<li>
					건강관리
				</li>
			</ul>
			<div id = "submenu">
				<div id = "submenuin">
						<ul>
							<li>자전거 정보</li>
						</ul>
						<ul>
							<li>전국 투어</li>
							<li>투어 계획 세우기</li>
							<li>업적</li>
							<li>추천 동선</li>
							<li>수리점 찾기</li>
						</ul>
						<ul>
							<li>이벤트</li>
							<li>이벤트 정보</li>
						</ul>
						<ul>
							<li>추천 코스</li>
							<li>추천 코스 정보</li>
						</ul>
						<ul>
							<li>자유게시판</li>
							<li>인증게시판</li>
							<li>거래게시판</li>
						</ul>
						<ul>
							<li>자전거</li>
							<li>부수기재</li>
							<li>장바구니</li>
							<li>관심물품</li>
							<li>가격비교</li>
						</ul>
						<ul>
							<li>비만도 계산</li>
							<li>코스 추천</li>
							<li>식단 제공</li>
							<li>건강 변화 확인</li>
						</ul>
				</div>
			</div>
		</div>
	</header>
	<div id = "wrap">
		<div id = "cont">
		<form action = "logincheck.jsp" method="post">
		<div id = "login">
			<div id = "logint">
				<div id = "ltt">
					<h1>로그인</h1>
				</div>
				<div id = "loginl">
					<input type = "text" name = "id" placeholder = "ID"><br><br>
					<input type = "password" name = "pw" placeholder = "PW">
				</div>
				<div id = "loginr">
					<input type = "submit" value = "로그인" id="btn">
				</div>
			</div>
			<div id = "loginb">
				<a href = "forgoti.jsp">아이디 찾기</a> | <a href = "forgotp.jsp">비밀번호 찾기</a> | <a href = "teamport_join.jsp">회원가입</a>
			</div>
			<input type = "hidden" name = "ur" value = "<%=request.getHeader("referer")%>">
		</div>
		</form>
		<div id = "asdf">
			<img src = "14.jpg">
		</div>
		</div>
	</div>	
	<footer>
		<div id = "foot">
		<ul>
			<li>개인정보처리방침 |</li>
			<li>이용약관 |</li>
			<li>고객문의</li>
		</ul>
		<div>
			<p>주소:서울특별시 강남구 역삼동 테헤란로5길 24</p>
			<p>last update:2020-06-12</p>
		</div>
		</div>
	</footer>
  </div>
  </body>
</html>
