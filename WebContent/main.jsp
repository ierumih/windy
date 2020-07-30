<%@ page language = "java" contentType = "text/html; charset = UTF-8" pageEncoding = "UTF-8" %>
<%
	//로그인
	String id = null;
	String nick = null;
	id = (String) session.getAttribute("id");
	nick = (String) session.getAttribute("nick");
	
	Cookie[] cookies = request.getCookies();
	if(cookies!=null){
		for(int i=0; i<cookies.length;i++){
			if(cookies[i].getName().equals("c_id")){
				id = cookies[i].getValue();
				session.setAttribute("id",id);
			}
			else if(cookies[i].getName().equals("c_nick")){
				nick = cookies[i].getValue();
				session.setAttribute("nick",nick);
			}
		}
	}
		
%>
<!doctype html>
<html lang="en">
 <head>
  <meta charset = "utf-8">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> 
  <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
  <title>메인(추성호)</title>
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
			text-decoration:none
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
		#wrap{
			position:relative;
			width:1080px;
			height:1080px;
			z-index:1;
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
		nav{
			width:160px;
			height:1000px;
			background-color:#FBFBEF;
			float:left;
		}
		nav div{
			width:100px;
			height:400px;
			border:1px solid red;
			margin:20px auto auto auto;
		}
		nav div ul{
			list-style-type:none;
			display:inline;
		}
		nav div ul li{
			vertical-align:middle;
			border:solid red 1px;
		}
		.mdiv{
			width:1080px;
			height:400px;
			float:left;
			margin-top:40px;
			margin-bottom:40px;
		}
		.mdiv div{
			background:#f0f0f0;
		}
		.mdivl{
			width:530px;
			height:380px;
			float:left;
			margin:20px 20px 0 0;
			position:relative;
			overflow:hidden;
			font-size:12pt;
		}
		.mdivl div{
			position:relative;
			width:530px;
			height:30px;
			text-align:center;
			font-weight:800;
			font-size:15pt;
		}
		.mdivl img{
			position:relative;
			width:300px;
			height:300px;
			margin-top:20px;
		}
		.mdivl ul{
			position:absolute;
			top:50px;
			left:320px;
			list-style-type:none;
			font-size:12pt;
		}
		.mdivr{
			width:530px;
			height:180px;
			float:left;
			margin:20px 0 0 0;
			font-size:12pt;
		}
		.mdivr div{
			width:530px;
			height:40px;
			font-size:15pt;
			text-align:center;
			font-weight:800;
		}
		.mdivr > ul{
			padding: 0 0 0 20px;
			width:100%;
			height:120px;
			list-style-type:circle;
		}
		.mdivr > ul li{
			height:25%;
		}
		.mdivr ul li ul{
			width:100%;
			list-style-type:none;
		}
		.mdivr ul li ul li{
			display:inline-block;
		}
		.mdivr ul li ul li:first-child{
			width:20%;
		}
		.mdivr ul li ul li:nth-child(2){
			width:55%;
		}
		.mdivr ul li ul li:last-child{
			width:20%;
			text-align:right;
		}
		#weather{
			position:relative;
			width:530px;
			height:180px;
			float:left;
			margin:20px 0 0 0;
			z-index:10;
		}
		.mdiv2{
			position:relative;
			width:1080px;
			float:left;
			margin:0 0 20px 0;
			z-index:1;
			background:#f0f0f0;
		}
		.mdiv3{
			position:relative;
			clear:both;
			width:400px;
			height:60px;
			background-color:#5e5e5e;
			color:white;
			margin:20px auto 20px auto;
			border-radius:10px;
			text-align:center;
			vertical-align:middle;
			font-size:20px;
			line-height:60px;
			z-index:1;			
		}
		.mdiv4{
			width:1080px;
			position:relative;
			z-index:1;
		}
		.bx-wrapper{
			width:800px;
			height:400px;
		}
		.bx-wrapper img{
			height:380px;
		}
		#weatdiv1{
			position:relative;
			width:250px;
			height:30px;
			border-radius:10px;
			text-align:center;
			font-size:15pt;
			font-weight:800;
		}
		#weatdiv2{
			position:relative;
			width:530px;
			height:30px;
			background:#5e5e5e;
			color:white;
			border-radius:10px;
		}
		#weat{
			line-height:30px;
			position:absolute;
			width:530px;
			height:30px;
			display:table;
			z-index:10;
			cursor:pointer;
		}
		#weat > li{
			width:53px;
			display:table-cell;
			text-align:center; 
		}
		#weat > li > ul{
			list-style-type:none;
			font-size:10pt;
			background:#8e8e8e;;
			padding:0 0 5px 0;
			border-radius:10px;
		}
		#weat > li > ul > li{
			height:25px;
		}
		#weal{
			position:absolute;
			top:60px;
			left:0;
			width:220px;
			height:120px;
			z-index:0;
		}
		#weal img{
			position:absolute;
			right:0;
			width:110px;
			height:110px;
			margin-top:5px;
		}
		#wear{
			position:absolute;
			top:60px;
			right:0;
			width:280px;
			height:120px;
			z-index:0;
		}
		#wear ul{
			padding:15px 0 0 0;
			font-size:15pt;
			list-style-type:none;
		}
		#wear ul li{
			padding:0 0 0 60px;
		}
		#nb{
			position:relative;
			width:100%;
			min-width:1080px;
		}
		#nb img{
			width:100%;
			max-width:100%;
		}
	</style>
 </head>

 <script>
	$(document).ready(function(){
		var api = "http://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=5141ea7889133873d1ded5d335ff5ed8";
		var api1 = "http://api.openweathermap.org/data/2.5/weather?q=";
		var api2 = "&appid=5141ea7889133873d1ded5d335ff5ed8";
		var img = "img/we/";
		$.ajax({
			url: api,
			dataType:"json",
			type:"GET",
			success: function(res){
				var temp = ((res.main.temp)-273).toFixed(1);
				var hum = (res.main.humidity);
				var wea = (res.weather[0].main);
				var nam = "서울";
				var id = (res.weather[0].id);
				if((id==701)||(id==711)||(id==721)||(id==731)||(id==741)||(id==751)||(id==761)||(id==762)||(id==771)||(id==781)){
					$("#weather").find("img").attr("src",(img+"Fog.gif"));
				}
				else{
					$("#weather").find("img").attr("src",(img+wea+".gif"));
				}
				$("#wcity").html("지역 : "+nam);
				$("#wtemp").html("온도 : "+temp+"℃");
				$("#whum").html("습도 : "+hum);
			}
		});
		$('.mdiv4').bxSlider();
		$("#weat > li > ul").hide();
		$("#submenu").hide();
		$("#weat > li").mouseenter(function(){
			$(this).children().stop().slideDown();
		});
		$("#weat > li").mouseleave(function(){
			$(this).children().stop().slideUp();
		});
		$("#weat > li > ul > li").click(function(){
			var nam = ($(this).text());
			$.ajax({
				url: api1+(this.id)+api2,
				dataType:"json",
				type:"GET",
				success: function(res){
					var temp = ((res.main.temp)-273).toFixed(1);
					var hum = (res.main.humidity);
					var wea = (res.weather[0].main);
					//var nam = (res.name);
					var id = (res.weather[0].id);
					if((id==701)||(id==711)||(id==721)||(id==731)||(id==741)||(id==751)||(id==761)||(id==762)||(id==771)||(id==781)){
						$("#weather").find("img").attr("src",(img+"Fog.gif"));
					}
					else{
						$("#weather").find("img").attr("src",(img+wea+".gif"));
					}
					$("#wcity").html("지역 : "+nam);
					$("#wtemp").html("온도 : "+temp+"℃");
					$("#whum").html("습도 : "+hum);
				}
			});
		});
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
		$(".bx-viewport").mouseover(function(){

		});
	});

 </script>

 <body>
  <div id = "wrapper">
 	<header>
		<div id = "headt">
			<a href = "main.jsp"><div id = "headl">
				<img id = "logo" src = "img/logo1.jpg">
				WINDY
			</div></a>
			<div id = "headr">
				<div>
					<%
						if(nick!=null)
							out.print(nick+"님 환영합니다. | <a href = 'logout.jsp'>로그아웃</a>");
						else
							out.print("<a href = 'join.jsp'>회원가입</a> | <a href = 'login.jsp'>로그인</a>");
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
					<a href = "boardlist.b?board_name=freeb"">게시판</a>
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
	<div id = "nb">
		<img src = "img/01.jpg"/>
	</div>
	<div id = "wrap">
		<div class = "mdiv">
			<div class = "mdivl">
				<div>
					금주의 추천 코스
				</div>
				<img src = "img/c1.jpg">
				<ul>
					<li>코스 이름:###</li>
					<li>코스 길이:###</li>
					<li>코스 정보:###</li>
				</ul>
			</div>
			<div id = "weather">
				<div id = "weatdiv1">
					오늘의 날씨
				</div>
				<div id = "weatdiv2">
					<ul id = "weat">
						<li>서울
							<ul>
								<li id = "Seoul">서울</li>
							</ul>
						</li>
						<li>경기
							<ul>
								<li id = "Paju">파주</li>
								<li id = "Goyang">고양</li>
								<li id = "yeoncheongun">연천</li>
								<li id = "Namyangju">남양주</li>
								<li id = "Yangju">양주</li>
								<li id = "Vijongbu">의정부</li>
								<li id = "Gapyeong">가평<</li>
								<li id = "Hanam">하남</li>
								<li id = "Seongnam-si">성남</li>
								<li id = "Gwangju-si">광주</li>
								<li id = "Suwon">수원</li>
								<li id = "Bucheon-si">부천</li>
								<li id = "Uiwang">의왕</li>
								<li id = "Gunpo">군포</li>
								<li id = "Anyang-si">안양</li>
								<li id = "Ansan-si">안산</li>
								<li id = "Hwaseong-si">화성</li>
								<li id = "Pyeongtaek">평택</li>
								<li id = "Osan">오산</li>
								<li id = "Icheon-si">이천</li>
								<li id = "Yeoju">여주</li>
							</ul>
						</li>
						<li>충북
							<ul>
								<li id = "Daejeon">대전</li>
								<li id = "Cheongju">청주</li>
								<li id = "Teisen">제천</li>
								<li id = "Chinchon">진천</li>
								<li id = "Chungju">충주</li>
								<li id = "Koesan">괴산</li>
								<li id = "ogcheongun">옥천</li>
								<li id = "Yongdong">영동</li>
							</ul>
						</li>
						<li>충남
							<ul>
								<li id = "Cheonan">천안</li>
								<li id = "Seosan">서산</li>
								<li id = "Tangjin">당진</li>
								<li id = "Asan">아산</li>
								<li id = "Kongju">공주</li>
								<li id = "Yesan">예산</li>
								<li id = "Hongseong">홍성</li>
								<li id = "Fuyo">부여</li>
								<li id = "Nonsan">논산</li>
								<li id = "Kinzan">금산</li>
							</ul>
						</li>
						<li>강원
							<ul>
								<li id = "Hwacheon">화천</li>
								<li id = "Yanggu">양구</li>
								<li id = "Chuncheon">춘천</li>
								<li id = "Inje">인제</li>
								<li id = "Kosung">고성</li>
								<li id = "Sogcho">속초</li>
								<li id = "Yangyang">양양</li>
								<li id = "Hongchon">홍천</li>
								<li id = "Wonju">원주</li>
								<li id = "Kang-neung">강릉</li>
								<li id = "Tonghae">동해</li>
								<li id = "Taebaek">태백</li>
							</ul>
						</li>
						<li>전북
							<ul>
								<li id = "Kunsan">군산</li>
								<li id = "Puan">부안</li>
								<li id = "Kochang">고창</li>
								<li id = "Jeonju">전주</li>
								<li id = "Sunchang">순창</li>
								<li id = "Iksan">익산</li>
								<li id = "Kimje">김제</li>
								<li id = "Wanju">완주</li>
								<li id = "Jangsu">장수</li>
								<li id = "Muju">무주</li>
								<li id = "Imsil">임실</li>
							</ul>
						</li>
						<li>전남
							<ul>
								<li id = "Gwangju">광주</li>
								<li id = "Naju">나주</li>
								<li id = "Hwasun">화순</li>
								<li id = "Jangseong">장성</li>
								<li id = "Damyang">담양</li>
								<li id = "Mokpo">목포</li>
								<li id = "Haenam">해남</li>
								<li id = "Reigan">영암</li>
								<li id = "Sinan">신안</li>
								<li id = "Muan">무안</li>
								<li id = "Koyo">고흥</li>
								<li id = "Yeosu">여수</li>
								<li id = "Posung">보성</li>
							</ul>
						</li>
						<li>경북
							<ul>
								<li id = "Ulsan">울산</li>
								<li id = "Daegu">대구</li>
								<li id = "Mungyeong">문경</li>
								<li id = "Sangju">상주</li>
								<li id = "Gimcheon">김천</li>
								<li id = "Seongju">성주</li>
								<li id = "Koryong">고령</li>
								<li id = "Yecheon">예천</li>
								<li id = "Eisen">영주</li>
								<li id = "Andong">안동</li>
								<li id = "Bonghwa">봉화</li>
								<li id = "Cheongsong">청송</li>
								<li id = "Pohang">포항</li>
								<li id = "Gyeongju">경주</li>
							</ul>
						</li>
						<li>경남
							<ul>
								<li id = "Busan">부산</li>
								<li id = "Hamyang">함양</li>
								<li id = "Hadong">하동</li>
								<li id = "Chinju">진주</li>
								<li id = "Changnyeong">창녕</li>
								<li id = "Miryang">밀양</li>
								<li id = "Changwon">창원</li>
								<li id = "Kimhae">김해</li>
								<li id = "Yangsan">양산</li>
								<li id = "Sinhyeon">거제</li>
								<li id = "Ungsang">양산</li>
							</ul>
						</li>
						<li>제주
							<ul>
								<li id = "Jeju">제주</li>
							</ul>
						</li>
					</ul>
				</div>
				<div id = "weal">
					<img src = "img/loading.gif"/>
				</div>
				<div id = "wear">
					<ul>
						<li id = "wcity"><img src = "img/loading.gif"/></li>
						<li id = "wtemp"><img src = "img/loading.gif"/></li>
						<li id = "whum"><img src = "img/loading.gif"/></li>
					</ul>
				</div>
			</div>
			<div  class = "mdivr">
				<div>최신 뉴스</div>
				<ul>
					<li>
						<ul>
							<li>뉴스제목</li>
							<li>뉴스1내용</li>
							<li>2020-00-00</li>
						</ul>
					</li>
					<li>
						<ul>
							<li>뉴스제목</li>
							<li>뉴스1내용</li>
							<li>2020-00-00</li>
						</ul>
					</li>
					<li>
						<ul>
							<li>뉴스제목</li>
							<li>뉴스1내용</li>
							<li>2020-00-00</li>
						</ul>
					</li>
					<li>
						<ul>
							<li>뉴스제목</li>
							<li>뉴스1내용</li>
							<li>2020-00-00</li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
		<div class = "mdiv2">
			<div class = "mdiv3">
				추천 아이템
			</div>
			<div class = "mdiv4">
				<div><img src = "img/b1.jpg"></div>
				<div><img src = "img/b2.jpg"></div>
				<div><img src = "img/b3.jpg"></div>
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