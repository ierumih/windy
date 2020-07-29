<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>우리팀 양식</title>
	  <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	  <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	  <!--tap bar slide-->
	  <script src="tendina-master/dist/tendina.js"></script>
	  <!--font-->
	  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap"  rel="stylesheet">
</head>
	<meta charset="utf-8">
	<style>
		/*@font-face {
			font-family:Noto Sans CJK Regular;
			src:url(https://dl.dropboxusercontent.com/s/zkw6tapuv8oj6cn/NSKR400.woff);}
		*/
		*{
			margin:0 auto;
			padding:0;
		}
		body{
			
			font-family: 'Nanum Gothic Coding', monospace;
		}
		#wrapper{
			position:relative;
			width:100%;
			top:0;
			left:0;
			overflow:hidden;
			
		}
		header{
			position:relative;
			height:80px;
			background:white;
			background-position:center;
			top:0;
			margin:0 auto;
			left:0;
			right:0;
			z-index:999;
			width:100%;
			min-width:1080px;
		}
		.fix{
			position:fixed;
			text-align:center;
			top:0;
		}
		#headt{
			width:100%;
			min-width:1080px;
		}
		#logo{ 
			width:80px;
			height:80px;
			background-color: #ddd;
		}
		#headl{
			height:140px;
			float:left;
			font-size:20px;
			font-weight:800;
			color:#brown;
			position: absolute;
			z-index: 60;
		}
		#headr{
			width:200px;
			margin-right:50px;
			float:right;
			display:table;
			position: relative;
			z-index: 60;
		}
		#headr div{
			width:200px;
			height: 80px;
			
			display:table-cell;
			vertical-align:middle;
			text-align:right;
		}
		#headb{
			width:100%;
			min-width:1080px;
			height:80px;
			padding-top: 10px;
			clear:both;
			color:white;
			background-color:#dddddd8c;
			position:absolute;
		}
		#headb a{
			color:brown;
			text-decoration:none
		}
		/*=====================================================
		menu
		=======================================================*/
		#menu{
			min-width:1080px;
			height:60px;
			display:table;
			margin-bottom:10px;
			font-size:13pt;
			font-weight:bold;
		}
		#menu li{
			width:154px;
			display:table-cell;
			vertical-align:middle;
			text-align:center;
			color:brown;
		}
		#submenu{
			position:relative;
			min-width:1080px;
			height:175px;
			display:block;
			background-color:#e8e7e7bf;
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
			color:brown;
			text-align: center;
			line-height: 2.0;
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
			height:1200px;
			min-height:1000px;
		}
		.main_img{
			width: 100%;
			height: 100%;
		}
		
	</style>
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
				if (scr>140)
				{
					$("#headb").addClass("fix");
				}
				else {
					$("#headb").removeClass("fix");
				}
			});
		});
	</script>
	<script>
	  $(document).ready(function(){
		$('#tapbar').tendina({  
		});
		$('.slider').bxSlider({
	  	auto:true,
		pause:4000,
		controls:false,
		stopAutoOnClick:true,
		});
	  });
	</script>
<body>
	
 	<header>
		<div id = "headt">
			<div id = "headl">
				<a href = "main.html"><img id = "logo" src = "img/qwer.jpg"></a>
				windy
			</div>
			<div id = "headr">
				<div>
					로그인 | <a href = "mypage.html">마이페이지</a>
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
		</div>
	</header>
	<div id = "wrapper">
		<div>
			<img src = "img/white_bike21.jpg" class="main_img">
		</div>
	
	
	<hr style="clear:both;">
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