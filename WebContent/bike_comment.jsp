<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.windy.dao.DAO"%>
<%@page import="com.windy.vo.B_comment"%>
<%@page import="com.windy.vo.Bike"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.*, java.text.*"%>
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
<%
	List<B_comment> commentlist = (List<B_comment>) request.getAttribute("commentlist");
	List<Bike> bikelist = (List<Bike>) request.getAttribute("bikelist");
	String id = (String) session.getAttribute("id");
	String bike_num = request.getParameter("bike_num");
%>
<style>
.modal-content {
	background-color: #ddd;
	margin:5% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid red;
	width: 50%; /* Could be more or less, depending on screen size */
}
.more-btn {
	border-radius: 6px;
	height: 40px;
	width: 90%;
	text-align: center;
	background-color: #eab2b2;
	font-size: 20pt;
	font-weight: bold;
}
.more-btn a{
	color: black;
    text-decoration: none;
}
.more-btn a:hover{
	color: black;
    text-decoration: none;
}

.close-btn {
	border-radius: 6px;
	text-align: center;
	height: 40px;
	width: 90%;
	background-color: #ddd;
	font-size: 13pt;
	padding: 8px 0 10px 0;
	cursor: pointer;
	margin-top: 40px;
	font-weight: bold;
}

.comment-text {
	width: 82%;
	margin: 0 0 0 35px;
	height: 35px;
}

.comment-enter {
	width: 40px;
	margin-left: 10px;
	height: 35px;
	font-weight: bold;
}

.comment-content {
	min-height: 600px;
}

.comment-content ul li {
	display:inline-block;
	white-space:nowrap;
	overflow:hidden;
	text-overflow:ellipsis;
	list-style: none;
	width:90%;
	height: 18px;
	font-size: 15px;
	font-weight: bold;
	margin: 15px 0 0 35px;
	cursor: pointer;
}


.haha {
	font-size: 9px;
	min-width: 90%;
	border-bottom:1px solid #ddd;
	margin-left:35px;
}

.bike-name {
	margin: 20px 0 15px 0;
	font-weight: bold;
	font-size: 24pt;
	text-align: center;
}
.out_box{
	position: fixed;
    z-index: 200;
    background: #0808086e;
    width: 100%;
    height: 100%;
    top: 0;
}
.in_box{
	height: 600px;
    width: 900px;
    background: #fff;
    margin: 10% auto;
    border: 1px solid rgba(0,0,0,.2);
    border-radius: 10px;
    box-shadow: 2px 2px #fcf8e36b;
}
.comment_writer{
	margin: 5% 0 20px 35px;
    width: 800px;
    border-bottom: 1px solid #ddd;
    padding-bottom: 20px;
    font-weight: bold;
}
.comment_detail{
	margin: 3% 0 20px 35px;
    max-width: 800px;
    height:400px;
    word-break: break-all
}
.comment_close{
	float:right;
	margin-right:35px;
	font-weight:bold;
	font-size:13pt;
	cursor: pointer;
}
.modify{
	float: right;
	padding-left:7px;
	font-size:8pt;
	cursor: pointer;
	color: black;
}
.delete{
	float:right;
	font-size:8pt;
	cursor: pointer;
	color: black;
}
</style>
<script>
//	$(document).ready(function(){
//			$(".main_grid2 a").each(function(i){
//				$(this).click(function(){
//				$('#myModal').show(); 
//				$('.comment-enter').click(function(){
//					var id = "<%=id%>";
//					if(id=="null"){
//						alert("ID 값 비었다 이놈아");
//					}alert("작성가능하십니다요");
//				});
//			$("#close").click(function(){
//				 $('#myModal').hide();
//			});
//	});
	//로그인 상태가 아니면 댓글이 보이지않음.
	$(document).ready(function(){
		$('.out_box').hide();		
		var id = "<%=id%>";
		$('.comment-content').hide();
			if(id=="null"){
				alert("로그인 후 이용 가능합니다.");
				history.back();
			}else if(id!="null"){
				$('.comment-content').show();
				//공백 입력 방지.
				$('.comment-enter').click(function(){
					var text = $('.comment-text').val();
					if(text.replace(/\s| /gi, "").length==0){
						// /정규표현 시작   \s 공백or탭  | or
						// g 문자열의 모든 문자 검색    i 대소문자 무시
						alert("내용을 입력해주세요");
						return false;
						$(".comment-text").focus();
					}
				});
				
			}//if문
		//닫기 클릭시 목록으로 돌아가기.
		$('#close').click(function(){
//			history.back();
			$(location).attr("href","back.b?bike_num="+<%=bikelist.get(0).getBike_num()%>);
		});
		
		//n 번째 index 의 내용. / 수정 !!!!!!
		$('.modify').on("click",function(){
			var n = $('.modify').index(this);
			var id = "<%=id%>";
			var id2 = $(".hoho:eq("+n+")").text();
			if(id!=id2){
				alert("다른 사람의 댓글을 수정할 수 없습니다.");
				return false;
			}
		});
		// 삭제
		$('.delete').on("click",function(){
			var n = $('.delete').index(this);
			var id = "<%=id%>";
			var id2 = $(".hoho:eq("+n+")").text();
			if(id!=id2){
				alert("다른 사람의 댓글을 삭제할 수 없습니다.");
				return false;
			}
			
			
		});
		//자세히 보기.
		$('.comment-content ul li').click(function(){
			var id = $(this).next('.haha').find(".hoho").text();
			var content = $(this).text();
			$('.comment_writer').text("작정자 : " + id);
			$('.comment_detail').text(content);
			$('.out_box').show();
		});
		$('.comment_close').click(function(){
			$('.out_box').hide();
		});
	});
</script>
<body>

	<header>

		<jsp:include page="header2.jsp" />
	</header>
	<main>
		<!-- 본문 내용 -->
		<div>
			<div class="modal-content">
				<div class="more-btn"><a href="<%= bikelist.get(0).getBike_content()%>" target="_blank"> > > > MORE DETAIL > > ></a></div>
				<div class="bike-name"><%=bikelist.get(0).getBike_name() %></div>
				<div>
					<form  action="commentinsert.b" method="post">
						<input type="text" name="comment" class="comment-text"> 
						<input type="submit" value="작성" class="comment-enter">
						<input type=hidden name="hidden" value="<%=id%>"/>
						<input type=hidden name="hidden2" value="<%=bike_num%>"/>
					</form>
				</div>
				<div class="comment-content">
					<ul>
						<%
							for (int z = 0; z < commentlist.size(); z++) {
								out.println("<li>" + commentlist.get(z).getComment_content() + "</li><div class='haha'><span class='hoho'>"
										+ commentlist.get(z).getComment_id() + "</span><a href='bike_comment_edit.jsp?comment_no="+commentlist.get(z).getComment_no()+"&comment_content="
										+commentlist.get(z).getComment_content()+"&comment_id="+commentlist.get(z).getComment_id()+
										"&bike_num="+commentlist.get(z).getBike_num()+"'><span class='modify'>수정</span></a><a href = 'commentdelete.b?comment_no="+commentlist.get(z).getComment_no()+"&bike_num="+commentlist.get(z).getBike_num()+"'><span class='delete'>삭제</span></a></div>");
							}
						%>
					</ul>
				</div>
				<div id="close" class="close-btn">닫기</div>
			</div>
		</div>
	</main>
	<article>
		<!-- 상세 내용 -->
		<div class="out_box">
			<div class="in_box">
				<div class='comment_writer'></div>
				<div class='comment_detail'></div>
				<div class='comment_close'>닫기</div>
			</div>
		</div>
	</article>
	<hr style="clear: both;">
	<footer>
		<jsp:include page="footer2.jsp" />
	</footer>
</body>
</html>