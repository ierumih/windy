<%@ page language = "java" contentType = "text/html; charset = UTF-8" pageEncoding = "UTF-8" %>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.windy.dao.DAO" %>
<%@page import="com.windy.vo.Board" %>
<%@page import="com.windy.vo.Page" %>
<%@page import="java.util.*" %>
<%
	//로그인
	String id = (String) session.getAttribute("id");
	String nick = (String) session.getAttribute("nick");
%>
<%
	List<Board> listb = (List<Board>)request.getAttribute("listb");
	Page pages = (Page)request.getAttribute("pages");
	int p = pages.getCurrentpage();
	int pag = pages.getEndpage();
	String board_name = pages.getBoard_name();
	request.setAttribute("listb", listb);
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
		#wb{
			height:40px;
			padding-top:15px;
		}
		#cp{
			color:red;
		}
	</style>
	<script>
	    $(document).ready(function(){
			$(".board_inner:nth-child(n+2)").click(function(){
				var board_name = "<%=board_name%>"
				$(location).attr("href","boardview.b?board_name="+board_name+"&board_num="+$(this).children(':nth-child(1)').text());
			});
			$("#write").click(function(){
				var lid = "<%=id%>"
				var board_name = "<%=board_name%>"
				var p = <%=p%>
				if(lid=="null")
					alert('로그인하셔야 글을 작성하실 수 있습니다.');
				else
					$(location).attr("href","write.b?board_name="+board_name+"&p="+p);
			});
			$("#searchb").click(function(){
				var board_name = "<%=board_name%>"
				$(location).attr("href",encodeURI("boardlist.b?board_name="+board_name+"&s_type="+$("#ssel option:selected").val()+"&s_key="+$("#sbar").val()+"&p=1"));
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
					<%
						out.print("<ul class='board_inner'><li>번호</li><li>제목</li><li>글쓴이</li><li>작성일</li><li>조회</li><li>추천</li></ul>");
						for(int i=0; i<listb.size(); i++){
							out.print("<ul class = 'board_inner'><li>"+listb.get(i).getBoard_num()+"</li><li>"+listb.get(i).getBoard_title()+"</li><li>"+listb.get(i).getNick()+"</li><li>"+listb.get(i).getBoard_date()+"</li><li>"+listb.get(i).getBoard_view()+"</li><li>"+listb.get(i).getBoard_good()+"</li></ul>");
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
								if(p>1){%>
									<td><input type='button' value='<' class='search' onclick = "location.href='boardlist.b?board_name=<%=board_name %>&p=<%=p-1 %>'"></td>
								<%}%>
							<td><ul class="num">
								<%
									for(int i=(p-5); i<(p+5); i++){
										if((i>0)&&(i<=pag)){
											if(i!=p){%>
												<a href = 'boardlist.b?board_name=<%=board_name%>&p=<%=i %>'><li><%=i %></li></a><%
											}else{%>
												<li id = 'cp'><%=i %></li>
											<%}
										}
									}
								%>
							</ul></td>
							<%
								if(p<pag){%>
									<td><input type='button' value='>' class='search' onclick = "location.href='boardlist.b?board_name=<%=board_name %>&p=<%=p+1 %>'"></td>
								<%}%>
						</tr>
					</table>
				</div>
				<div>
					<table>
						<tr>
							<td><select id = "ssel" style="height:32px;">
								<option value = "board_title">제목</option>
								<option value = "nick">글쓴이</option>
								<option value = "board_content">내용</option>
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
			<jsp:include page="footer2.jsp"/>
		</footer>
	</div>
	</body>
</html>
