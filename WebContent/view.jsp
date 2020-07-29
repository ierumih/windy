<%@ page language = "java" contentType = "text/html; charset = UTF-8" pageEncoding = "UTF-8" %>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.windy.dao.DAO" %>
<%@page import="com.windy.vo.Board" %>
<%@page import="com.windy.vo.Search" %>
<%@page import="java.util.*" %>
<%
	String id = (String) session.getAttribute("id");
	String nick = (String) session.getAttribute("nick");
%>

<%
	String s_type="";
	String s_key="";
	int nop;
	int pag;
	int p = 1;
	if(request.getParameter("s_type")!=null&&request.getParameter("s_key")!=null){
		s_type = request.getParameter("s_type");
		s_key = request.getParameter("s_key");
	}
	if(request.getParameter("p")!=null)
		p = Integer.valueOf(request.getParameter("p"));
	int p1 = (p-1)*20;
	Search search = new Search();
	search.setS_type(s_type);
	search.setS_key("%"+s_key+"%");
	search.setP1(p1);
	int fb_num = Integer.valueOf(request.getParameter("fb_num"));
%>
<%
	SqlSessionFactory sqlfactory = DAO.getConn();
	List<Board> boardl;
	Board board = DAO.view(fb_num);
	if((nick!=null)&&(!nick.equals(board.getNick()))){
		DAO.boardviewupd(fb_num);
		board.setBoard_view(board.getBoard_view()+1);
	}
	if(request.getParameter("s_type")!=null&&request.getParameter("s_key")!=null){
		boardl = DAO.search(search);
		nop = DAO.csearch(search);
	}
	else{
		boardl = DAO.sel(p1);
		nop = DAO.count();
	}
	pag = (int) Math.ceil((double) nop/20);
%>
<!doctype html>
<html lang="en">
 <head>
  <meta charset = "utf-8">
  <title>게시판</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  <!--tap bar slide-->
  <script src="tendina-master/dist/tendina.js"></script>
  <!--font-->
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap"  rel="stylesheet">

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

		#headl{
				height:80px;
				float:left;
				font-size:25pt;
				font-weight:900;
				color:black;
				line-height:80px;
				font-family:"굴림";
		}
		#logo{
				margin-top:-8px;
				width:70px;
				height:70px;
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
			min-height:900px;
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
		main{
			position:absolute;
			left:100px;
			width:980px;
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
		#board_cont{
			padding:0 10px 0 10px;
			clear:both;
			font-size:12pt;
			min-height:300px;
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
			$(".board_inner").click(function(){
				$(location).attr("href","view.jsp?fb_num="+$(this).children(':nth-child(1)').text());
			});
			$("#delete").click(function(){
				$(location).attr("href","delete.jsp?fb_num="+<%=fb_num%>);
			});
			$("#edit").click(function(){
				$(location).attr("href","fbedit.jsp?fb_num="+<%=fb_num%>);
			});
			$("#good").click(function(){
				var nick = "<%=nick%>";
				var fb_num = "<%=fb_num%>";
				var g = parseInt(<%=board.getBoard_good()%>);
				$.ajax({
					url:'good.jsp',
					data:{'nick':nick, 'fb_num':fb_num},
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
					<a href = "board.jsp">게시판</a>
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
				<div class="board_head">
					<ul>
						<li>자유게시판</li>
						<li>인증게시판</li>
						<li>거래게시판</li>
					</ul>
				</div>
				<div class="board">
					<div id = "board_title">
						<%out.print(board.getBoard_title());%>
					</div>
					<hr>
					<div id = "board_inf">
						<div id = "infl">
							<span>작성자:<%out.print(board.getNick());%></span>
							<span>작성일:<%out.print(board.getBoard_date());%></span>
						</div>
						<div id = "infr">
							<span>조회:<%out.print(board.getBoard_view());%></span>
							<span id = "recommend">추천:<%out.print(board.getBoard_good());%></span>
						</div>
					</div>
					<hr>
					<div id = "board_cont">
						<%
							out.print(board.getBoard_content());
						%>
					</div>
					<div id = "board_foot">
						<%
							if(id!=null)
								out.print("<input type = 'button' value = '추천' id = 'good'>");
							if(board.getNick().equals(nick)){
								out.print("<input type = 'button' value = '수정' id = 'edit'>");
								out.print("<input type = 'button' value = '삭제' id = 'delete'>");
							}
						%>
					</div>
					<hr id = "sep">
				</div>
				<div class="board">		
					<%
						out.print("<ul class='board_inner'><li>번호</li><li>제목</li><li>글쓴이</li><li>작성일</li><li>조회</li><li>추천</li></ul>");
						for(int i=0; i<boardl.size(); i++){
							out.print("<ul class = 'board_inner'><li>"+boardl.get(i).getBoard_num()+"</li><li>"+boardl.get(i).getBoard_title()+"</li><li>"+boardl.get(i).getNick()+"</li><li>"+boardl.get(i).getBoard_date()+"</li><li>"+boardl.get(i).getBoard_view()+"</li><li>"+boardl.get(i).getBoard_good()+"</li></ul>");
						}
					%>
				</div>
				<div id = "wb">
					<input type="button" value="글쓰기" class="search" id = "write" style="float:right;">
				</div>
				<div style="clear:both;">
					<table>
						<tr>
							<%
								if(p>1)
									out.print("<td><input type='button' value='<' class='search' onclick = \"location.href='board.jsp?p="+(p-1)+"'\"></td>");
							%>
							<td><ul class="num">
								<%
									for(int i=(p-5); i<(p+5); i++){
										if((i>0)&&(i<=pag)){
											if(i!=p)
												out.print("<a href = 'board.jsp?p="+i+"'><li>"+i+"</li></a>");
											else
												out.print("<li id = 'cp'>"+i+"</li>");
										}
									}
								%>
							</ul></td>
							<%
								if(p<pag)
									out.print("<td><input type='button' value='>' class='search' onclick = \"location.href='board.jsp?p="+(p+1)+"'\"></td>");
							%>
						</tr>
					</table>
				</div>
				<div>
					<table>
						<tr>
							<td><select id = "ssel" style="height:32px;">
								<option value = "fb_title">제목</option>
								<option value = "nick">글쓴이</option>
								<option value = "fb_content">내용</option>
								</select>
							</td>
							<td><input type="text" class="searchbar" id = "sbar" placeholder="검색바" style="margin:0 5px"></td>	
							<td><input type="button" value="검색" class="search" id = "searchb"></td>
						</tr>
					</table>
				</div>
			</article>
		</main>
		
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
