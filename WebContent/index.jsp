<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
			position:relative;
			width:1080px;
			height:700px;
		
		}
		
		.mdiv{
			width:1080px;
			height:490px;
			float:left;
			margin-top:150px;
			margin-bottom:150px;
		}
		.mdiv div{
			/*background:#f0f0f0;*/
		}
		.mdivl{
			width:530px;
			height:450px;
			float:left;
			margin:20px 20px 0 0;
			position:relative;
			overflow:hidden;
			font-size:12pt;
		}
		.mdivl img{
			position:relative;
			width:530px;
			height:450px;
			border-radius: 7px;
			z-index: 0;
		}
		
		


		.mdivr{
			width:530px;
			height:180px;
			float:left;
			margin:25px 0 0 0;
			font-size:12pt;
			border-bottom: 1px solid #af833770;
		}
		.mdivr div{
			width:530px;
			height:40px;
			font-size:15pt;
			text-align: center;
			font-weight:800;
		}
		.mdivrspan{
			font-size: 8pt;
			float: right;
			padding: 7px 5px 0 0;
		}
		.mdivr > ul{
			padding: 0 0 0 20px;
			width:100%;
			height:120px;
			list-style-type:circle;
			margin-top: 10px;
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
			width:75%;
			font-size: 11pt;
		}
		.mdivr ul li ul li:last-child{
			width:20%;
			text-align:right;
			font-size: 8pt;
		}
		#weather{
			position:relative;
			width:530px;
			height:245px;
			float:left;
			margin:20px 0 0 0;
			z-index:10;
			border-bottom: 1px solid #af833770;
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
			color:#1b1717ad;
			border-radius:10px 10px 0 0;
			background:#af833770;
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
			background:#8e8e8e;
			padding:0 0 5px 0;
			border-radius:0 0 10px 10px;
			background:#dddddd8c;
		}
		#weat > li > ul > li{
			height:25px;
		}
		#weal{
			left:0;
			width:530px;
			height:180px;
			z-index:0;
			background-color: rgba(0, 0, 0, 0.4);
		}
		#weal img{
			/*position:absolute;*/
			right:0;
			width:530px;
			height:180px;
			border-radius: 0 0 10px 10px;

			
		}
		#wear{
			position:absolute;
			color : white;
			top:30px;
			width:530px;
			height:180px;
			z-index:2;
			background-color: rgba(0, 0, 0, 0.1);
			border-radius: 0 0 10px 10px;
			padding-left: 150px;
		}
		#wear ul{
			line-height: 2.1;
			padding:15px 0 0 0;
			list-style-type:none;
			font-weight: bold;
		}
		#wear ul li{
			padding:0 0 0 60px;
			font-size: 17px;
		}
		.img_community{
			position: relative;
			width: 345px;
			height: 300px;
			border-radius: 10px;
			margin: 10px 0 10px 10px;
		}
		.community{
			width: 345px;
			height: 300px;
		}
		.img_health{
			position: relative;
			width: 345px;
			height: 300px;
			border-radius: 10px;
			margin: 0 10px 10px 10px;
		}
		.vital{
			padding-left: 120px;
			width: 345px;
			height: 300px;
		}
		.img_race{
			position: relative;
			width: 375px;
			height: 610px;
			border-radius: 10px;
		}
		.race{
			width: 375px;
			height: 610px;
		}
		.img_bike{
			position: relative;
			width: 613px;
			height: 300px;
			margin-right: 10px;
			overflow: hidden;
			margin:0 0 10px 10px;	
			border-radius: 10px;
		}
		.img_bike img{
			background-size: initial;
			margin-top: -150px;

		}
		.bike{
			width: 613px;
			height: 300px;
		}
		.cate4{
			font-size: 70pt;
			color: #ddd;
			font-family: 'Rowdies', cursive;

		}
		.section_hei{
			height: 730px;
		}
		
		.bike_content{
			position: absolute;                                                                
		    font-size:5rem;
		    color: white;
		    z-index: 2;
		    width: 613px;
		    height: 300px;
		    text-align: center;
		    line-height: 300px;
		    border-radius: 10px;
		    margin-left: 10px;
		    background-color: rgba(0, 0, 0, 0.4);
		}
		.health_content{
			position: absolute;                                                                
		    font-size:5rem;
		    color: white;
		    z-index: 2;
		    width: 345px;
		    height: 300px;
		    text-align: center;
		    line-height: 300px;
		    margin-left: 10px;
		    border-radius: 10px;
		    background-color: rgba(0, 0, 0, 0.4);
		}
		.race_content{
			position: absolute;                                                                
		    font-size:5rem;
		    color: white;
		    z-index: 2;
		    width: 375px;
		    height: 610px;
		    text-align: center;
		    line-height: 610px;
		    border-radius: 10px;
		    background-color: rgba(0, 0, 0, 0.4);
		}
		.health2_content{
			position: absolute;                                                                
		    font-size:5rem;
		    color: white;
		    z-index: 2;
		    width: 345px;
		    height: 300px;
		    text-align: center;
		    line-height: 300px;
		    margin: 10px 0 0 10px;
		    border-radius: 10px;
		    background-color: rgba(0, 0, 0, 0.4);
		}
		.course{
			width:530px;
			height:450px;
			z-index: 20;
			color: white;
			position: absolute;
			line-height: 450px;
			font-size: 5rem;
			text-align: center;
			background-color: rgba(0, 0, 0, 0.4);
			border-radius: 7px;
		}
		
		
		
	</style>
	<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
	<script>
	$(document).ready(function(){
		var api = "http://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=5141ea7889133873d1ded5d335ff5ed8";
		var api1 = "http://api.openweathermap.org/data/2.5/weather?q=";
		var api2 = "&appid=5141ea7889133873d1ded5d335ff5ed8";
		var img = "img/we2/";
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
					$("#weather").find("img").attr("src",(img+"Fog.jpg"));
				}
				else{
					$("#weather").find("img").attr("src",(img+wea+".jpg"));
				}
				if(wea == "Clouds"){
						wea="흐림";
					}else if (wea == "Thunderstorm") {
						wea="낙뢰"
					}else if (wea == "Rain") {
						wea="비"
					}else if (wea == "Drizzle") {
						wea="이슬비"
					}else if (wea == "Clear") {
						wea="맑음"
					}else if (wea == "Fog") {
						wea="안개"
					}else if (wea == "Snow") {
						wea="눈"
					}
				$("#wcity").html("지역 : "+nam);
				$("#wtemp").html("온도 : "+temp+"℃");
				$("#whum").html("습도 : "+hum+" %");
				$("#wwea").html("날씨 : "+wea);
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
						$("#weather").find("img").attr("src",(img+"Fog.jpg"));
					}
					else{
						$("#weather").find("img").attr("src",(img+wea+".jpg"));
					}
					if(wea == "Clouds"){
						wea="흐림";
					}else if (wea == "Thunderstorm") {
						wea="낙뢰"
					}else if (wea == "Rain") {
						wea="비"
					}else if (wea == "Drizzle") {
						wea="이슬비"
					}else if (wea == "Clear") {
						wea="맑음"
					}else if (wea == "Fog") {
						wea="안개"
					}else if (wea == "Snow") {
						wea="눈"
					}
					
					$("#wcity").html("지역 : "+nam);
					$("#wtemp").html("온도 : "+temp+"℃");
					$("#whum").html("습도 : "+hum+" %");
					$("#wwea").html("날씨 : "+wea);
				}
			});
		});
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
	<script>
		$(document).ready(function(){
			$(".learn").hide();
			$(".course").hide();
			$(".mdivl img").hover(
				function(){
					$(".course").fadeIn();
					$(".learn").show();
				},
				function(){
					$(".course").hide();
					$(".learn").hide();
				}
			);
			
			// $(".learn").hover(
			// 	function(){
			// 		$(".course").show();
			// 		$(this).show();
			// 	},
			// 	function(){
			// 		$(".course").hide();
			// 		$(this).hide();					
			// 	}
			// );
			$(".learn").mouseover(
				function(){
					$(".course").show();
					$(this).show();
				});

			$(".course").hover(
				function(){
					$(this).show();
					$(".learn").fadeIn();
				},
				function(){
					$(this).fadeOut();
					$(".learn").fadeOut();
				}
			);


		});
	</script>
	<script>
		$(document).ready(function(){
			$(".health_content").hide();
			$(".health2_content").hide();
			$(".bike_content").hide();
			$(".race_content").hide();

			//health
			$(".img_health").hover(
				function(){
					$(".health_content").fadeIn();
				},
				function(){
					$(".health_content").hide();	
				}
			);
			$(".health_content").hover(
				function(){
					$(".health_content").show();
				},
				function(){
					$(".health_content").fadeOut();
				}
			);

			//community
			$(".img_community").hover(
				function(){
					$(".health2_content").fadeIn();
				},
				function(){
					$(".health2_content").hide();	
				}
			);
			$(".health2_content").hover(
				function(){
					$(".health2_content").show();
				},
				function(){
					$(".health2_content").fadeOut();
				}
			);

			//bike
			$(".img_bike img").hover(
				function(){
					$(".bike_content").fadeIn();
				},
				function(){
					$(".bike_content").hide();	
				}
			);
			$(".bike_content").hover(
				function(){
					$(".bike_content").show();
				},
				function(){
					$(".bike_content").fadeOut();
				}
			);

			//race
			$(".img_race").hover(
				function(){
					$(".race_content").fadeIn();
				},
				function(){
					$(".race_content").hide();	
				}
			);
			$(".race_content").hover(
				function(){
					$(".race_content").show();
				},
				function(){
					$(".race_content").fadeOut();
				}
			);

			


			
		})
	</script>
<body>
	
 	<header>
		<jsp:include page="header2.jsp"/>
	</header>
		<div>
			<img src = "img/white_bike21.jpg" class="main_img">
		</div>
	<div id = "wrap">
		<div class = "mdiv">
			<div class = "mdivl">
				<div class="course">COURSE</div>				
				<img src = "img/course13.jpg">	
			</div>
			
			<div id = "weather">
				
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
						<li id = "wwea"><img src = "img/loading.gif"/></li>
						<li id = "wtemp"><img src = "img/loading.gif"/></li>
						<li id = "whum"><img src = "img/loading.gif"/></li>						
					</ul>
				</div>
			</div>
			<div  class = "mdivr">
				<div>최신 뉴스<span class="mdivrspan">더보기 ▶</span></div>
				<ul>
					<li>
						<ul>
							<li>GS칼텍스 주유소, 카카오 전기자전거 충전소로 변신</li>
							<li>2020-07-21</li>
						</ul>
					</li>
					<li>
						<ul>
							<li>코로나 영향.. 전세계 자전거 이용 40% '급증'</li>
							<li>2020-07-22</li>
						</ul>
					</li>
					<li>
						<ul>
							<li>'안전,크기,AS' 어린이 자전거 구매 팁 3가지</li>
							<li>2020-07-17</li>
						</ul>
					</li>
					<li>
						<ul>
							<li>구글 맵에 자전거 내비게이션 기능 도입된다</li>
							<li>2020-07-21</li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
		</div>
		<section class="section_hei">
			<table>
				<tr>
					<td colspan="2"><div class="cate4" >CATEGORY</div></td>

					<td rowspan="2" class="race">
						<div><a href = "eventlisting.b">
							<div class="race_content">
								EVENT
							</div>
							<img src="img/race11.jpg" class="img_race">
						</a></div>
					</td>

					<td class="community">
						<div>
							<div class="health2_content">
								COMMUNITY
							</div>
							<a href="board.jsp"><img src="img/community.jpg" class="img_community"></a>
						</div>
					</td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td class="vital">
						<div>
							<div class="health_content">
								HEALTH
							</div>
							<img src="img/vital.jpg" class="img_health">
						</div>
					</td>
					<td colspan="2" class="bike">
						<div><a href = "bike_kind.jsp">
							<div class="bike_content">
								BICYCLE
							</div>
							<div class="img_bike"><img src="img/bb13.jpg"></div>
						</a></div>
					</td>
				</tr>
			</table>
	</section>	
	

	
	
	<hr style="clear:both;">
		<footer>
			<jsp:include page="footer2.jsp"/>
		</footer>
	</div>

</body>
</html>