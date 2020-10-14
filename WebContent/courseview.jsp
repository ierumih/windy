<%@ page language = "java" contentType = "text/html; charset = UTF-8" pageEncoding = "UTF-8" %>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.windy.dao.DAO" %>
<%@page import="com.windy.vo.Course" %>
<%@page import="java.util.*" %>
<%
	String id = (String) session.getAttribute("id");
	String nick = (String) session.getAttribute("nick");
%>

<%
	Course courseview = (Course) request.getAttribute("courseview");
	request.setAttribute("courseview", courseview);
	int c_num = courseview.getC_num();
	String[] imga = courseview.getC_img().split(",");
	List<Course> listb = (List<Course>)request.getAttribute("listb");
%>
<!doctype html>
<html lang="en">
 <head>
  <meta charset = "utf-8">
  <title>코스</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<style>
		/*@font-face {
			font-family:Noto Sans CJK Regular;
			src:url(https://dl.dropboxusercontent.com/s/zkw6tapuv8oj6cn/NSKR400.woff);}
		*/
		*{
			margin:0 auto;
			padding:0;
			font-family: 'Nanum Gothic Coding', monospace;
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
		#wrapper{
			position:relative;
			width:100%;
			top:0;
			left:0;
			overflow:hidden;
			
		}
		
		.fix{
			position:fixed;
			text-align:center;
			top:0;
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
		
		#wrap{
			position:relative;
			width:1080px;
			min-height:1000px;
		}

		/*=========================================
		menutap
		===========================================*/
		/*=========================================
		board
		===========================================*/
		.board_head{
			width:1080px;
			height:45px;
			font-size:13pt;
			margin-top:30px;
			border-bottom:2px solid black;
			text-align:left;
		}
		.board_head ul li{
			display:inline;
		}
		.board_head ul li:first-child{
			font-size:18pt;
			font-weight:800;
		}
		.board_inner{
			width:1080px;
			height:37px;
			border-bottom:2px solid #ddd;
			padding-top:10px;
			margin-bottom:0px;
		}
		.board_inner:nth-child(n+2):hover{
			background-color:#f6f6f6;
		}
		.board_inner li{
			display:inline-block;
			font-size:10pt;
			width:130px;
			text-align:center;
		}
		.board_inner li:nth-child(2){
			width:400px;
			text-align:left;
		}
		.num{
			text-align:center;
			margin-top:20px;
			word-spacing:5px;
			padding-bottom:10px;
		}
		.num li{
			display:inline;
			word-spacing:10px;
		}
		.num li:first-of-type{
			margin-left:10px;
		}
		.num li:last-of-type{
			margin-right:10px;
		}
		.search {
			background-color: #cccccc;
			border: 1px solid black;
			align-items: center;
		  	border-radius: 5px;
		  	padding: 5px 10px 5px 10px;
		  	vertical-align: middle;
		}
		.searchbar{
			width:200px;
			height:30px;
			text-align:center;
			border:1px solid black;
		}

		.bx-wrapper .bx-pager, .bx-wrapper .bx-controls-auto{
			bottom:50px;
		}/*선택전의 색깔*/
		.bx-wrapper .bx-pager.bx-default-pager a{
			background: #e1e1e0;
		} /*선택후의 색깔*/
		.bx-wrapper .bx-pager.bx-default-pager a:hover, .bx-wrapper .bx-pager.bx-default-pager a.active, .bx-wrapper .bx-pager.bx-default-pager a:focus{
			background:#a42228;
		}
		.bx-wrapper{
			border:0;
			height:300px;
			width:300px;
		}
		.hvr-glow {
		  display: inline-block;
		  vertical-align: middle;
		  -webkit-transform: perspective(1px) translateZ(0);
		  transform: perspective(1px) translateZ(0);
		  box-shadow: 0 0 1px rgba(0, 0, 0, 0);
		  -webkit-transition-duration: 0.3s;
		  transition-duration: 0.3s;
		  -webkit-transition-property: box-shadow;
		  transition-property: box-shadow;
		}
		.hvr-glow:hover, .hvr-glow:focus, .hvr-glow:active {
		  box-shadow: 0 0 8px rgba(0, 0, 0, 0.6);
		}
		#cont{
			rows = 30;
			cols = 40;
		}
		#sm{
			float:right;
		}
		.bbtn{
			width:60px;
			height:30px;
		}
		#titlebox{
			margin-top:30px;
		}
		#titlebox input[type=text]{
			padding-left:5px;
		}
		#title{
			width:800px;
			height:28px;
		}
		#board_title{
			margin-top:10px;
			height:30px;
			font-size:20pt;
			padding:0 10px 0 10px;
		}
		#board_inf{
			height:20px;
			font-size:12pt;
			padding:0 10px 0 10px;
		}
		#infl{
			float:left;
		}
		#infr{
			float:right;
		}
		#map{
			width:700px;
			height:500px;
		}
		#board_cont{
			padding:0 10px 0 10px;
			clear:both;
			font-size:12pt;
			min-height:300px;
			text-align:center;
		}
		#board_cont img{
			margin:20px 0 20px 0;
		}		
		#wb{
			height:40px;
			padding-top:15px;
		}
		#board_foot{
			text-align:right;
		}
		#board_foot > input[type="button"]{
			width:60px;
			height:30px;
		}
		#sep{
			border:0;
			height:2px;
			background:black;
		}
	</style>
	<script>
		$(document).ready(function(){
			$("#delete").click(function(){
				$(location).attr("href","courseboarddelete.b?c_num=<%=c_num%>");
			});
			$("#edit").click(function(){
				var nick = "<%=nick%>";
				if(nick=="null")
					alert('로그인하셔야 글을 수정하실 수 있습니다.');
				else if(nick!="<%=courseview.getNick()%>")
					alert('다른 사람이 작성한 글을 수정할 수 없습니다.');
				else
					$(location).attr("href","courseboardeditform.b?c_num=<%=c_num%>");					
			});
			$("#like").click(function(){
				var nick = "<%=nick%>";
				var c_num = <%=c_num%>;
				var g = parseInt(<%=courseview.getC_like()%>);
				$.ajax({
					url:'course_like.jsp',
					data:{'nick':nick, 'c_num':c_num},
					success : function(req){
						var i = parseInt(req);
						if(i==0){
							$('#recommend').html("추천:"+(g+1));
						}
						else{
							alert('추천은 하루에 한 번만 가능합니다.');
						}
					}
				});	
			});
			$("#write").click(function(){
				var lid = "<%=id%>"
				if(lid=="null")
					alert('로그인하셔야 글을 작성하실 수 있습니다.');
				else
					$(location).attr("href","fbwrite.jsp");
			});
			$("#searchb").click(function(){
				$(location).attr("href",encodeURI("board.jsp?s_type="+$("#ssel option:selected").val()+"&s_key="+$("#sbar").val()+"&p=1"));
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
 </head>
 <body>
 	<div id = "wrapper">
 	<header>
		<jsp:include page="header2.jsp"/>
	</header>
	
	<div id = "wrap">
				<div class="board_head">
					<ul>
						<li>코스</li>
					</ul>
				</div>
				<div class="board">
					<div id = "board_title">
						<%=courseview.getC_name()%>
					</div>
					<hr>
					<div id = "board_inf">
						<div id = "infl">
							<span>작성자:<%=courseview.getNick()%></span>
							<span>작성일:<%=courseview.getC_date()%></span>
						</div>
						<div id = "infr">
							<span>조회:<%=courseview.getC_view()%></span>
							<span id = "recommend">추천:<%=courseview.getC_like()%></span>
						</div>
					</div>
					<hr>
					<div id="map">
						<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3d5b80ec92834dabf0669cbdb647c92c&libraries=services"></script>
						<script>
							var c_location = "<%=courseview.getC_location()%>";
							var c_name = "<%=courseview.getC_name()%>";
						
							var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
							mapOption = {
							    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
							    level: 3 // 지도의 확대 레벨
							};  
							
							//지도를 생성합니다    
							var map = new kakao.maps.Map(mapContainer, mapOption); 
							
							//주소-좌표 변환 객체를 생성합니다
							var geocoder = new kakao.maps.services.Geocoder();
							
							//주소로 좌표를 검색합니다
							geocoder.addressSearch(c_location, function(result, status) {
							
							// 정상적으로 검색이 완료됐으면 
							 if (status === kakao.maps.services.Status.OK) {
							
							    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
								//https://map.kakao.com/link/map/result[0].y,result[0].x
							    // 결과값으로 받은 위치를 마커로 표시합니다
							    var marker = new kakao.maps.Marker({
							        map: map,
							        position: coords
							    });
							
							    // 인포윈도우로 장소에 대한 설명을 표시합니다
							    var infowindow = new kakao.maps.InfoWindow({
							        content: '<div style="width:150px;text-align:center;padding:6px 0;">'+c_name+'</div>'
							    });
							    infowindow.open(map, marker);
							
							    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
							    map.setCenter(coords);
							} 
							});    
						</script>
					</div>
					<div id = "board_cont">
						<%=courseview.getC_cont()%>
					</div>
					
					<div id = "board_foot">
						<hr>
								<input type = 'button' value = '추천' id = 'like'>&nbsp
								<input type = 'button' value = '수정' id = 'edit'>&nbsp
								<input type = 'button' value = '삭제' id = 'delete'>
					</div>
					<hr id = "sep">
				</div>

			</article>
		</main>
		
	</div>

		<footer>
			<jsp:include page="footer2.jsp"/>
		</footer>
	</div>
	</body>
</html>
