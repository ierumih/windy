<%@ page language = "java" contentType = "text/html; charset = UTF-8" pageEncoding = "UTF-8" %>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.windy.dao.DAO" %>
<%@page import="com.windy.vo.Board" %>

<%@page import="java.util.*" %>
<%
	String id = (String) session.getAttribute("id");
	String nick = (String) session.getAttribute("nick");
%>

<%
	Board view = (Board) request.getAttribute("view");
	request.setAttribute("view", view);
	int board_num = view.getBoard_num();
	String board_name = view.getBoard_name();
	List<Board> listb = (List<Board>)request.getAttribute("listb");
%>
<!doctype html>
<html lang="en">
 <head>
  <meta charset = "utf-8">
  <title>게시판</title>
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
			height:1200px;
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
			$("#delete").click(function(){
				$(location).attr("href","boarddelete.b?board_num=<%=board_num%>");
			});
			$("#edit").click(function(){
				var nick = "<%=nick%>";
				if(nick=="null")
					alert('로그인하셔야 글을 수정하실 수 있습니다.');
				else if(nick!="<%=view.getNick()%>")
					alert('다른 사람이 작성한 글을 수정할 수 없습니다.');
				else
					$(location).attr("href","boardeditform.b?board_name=<%=board_name%>&board_num=<%=board_num%>");					
			});
			$("#good").click(function(){
				var nick = "<%=nick%>";
				var board_num = <%=board_num%>;
				var board_name = "<%=board_name%>";
				var g = parseInt(<%=view.getBoard_good()%>);
				$.ajax({
					url:'good.jsp',
					data:{'nick':nick, 'board_name':board_name, 'board_num':board_num},
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
						<li>자유게시판</li>
						<li>인증게시판</li>
						<li>거래게시판</li>
					</ul>
				</div>
				<div class="board">
					<div id = "board_title">
						<%=view.getBoard_title()%>
					</div>
					<hr>
					<div id = "board_inf">
						<div id = "infl">
							<span>작성자:<%=view.getNick()%></span>
							<span>작성일:<%=view.getBoard_date()%></span>
						</div>
						<div id = "infr">
							<span>조회:<%=view.getBoard_view()%></span>
							<span id = "recommend">추천:<%=view.getBoard_good()%></span>
						</div>
					</div>
					<hr>
					<div id = "board_cont">
						<%=view.getBoard_content()%>
					</div>
					<div id = "board_foot">
								<input type = 'button' value = '추천' id = 'good'>&nbsp
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
