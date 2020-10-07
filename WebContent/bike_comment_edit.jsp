<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<title>windy</title>
	  <link rel="shortcut icon" type="image⁄x-icon" href="img/qwer.jpg">
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
<%
	String comment_no = String.valueOf(request.getParameter("comment_no"));
	String comment_content = request.getParameter("comment_content");
	String comment_id = request.getParameter("comment_id");
	String bike_num = String.valueOf(request.getParameter("bike_num"));
%>
<style>
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
	margin-right:60px;
	font-weight:bold;
	font-size:13pt;
	cursor: pointer;
}
.content{
	word-break: break-all;
	width:800px;
	height:400px;
	resize: none;
}
.edit_btn{
	background: white;
    border: 1px solid #ddd;
    width: 50px;
    height: 35px;
    border-radius : 5px;
}
</style>
<script>
	$(document).ready(function(){
		$('.edit_btn').click(function(){
			var content = $('.content').val();
			var no = $('input[type=hidden]').val();
			
			$.ajax(
					{ 
						url:"comment_edit.jsp",
						data:{'content':content,'no':no},
						success : function(data){
							location.href="bikecomment.b?bike_num="+<%=bike_num%>;
						}
					}
			)
		});
	});
</script>
<body>
	
	<header>

		<jsp:include page="header2.jsp"/>
	</header>
	<main>
		<!-- 상세 내용 -->
		<div class="out_box">
			<div class="in_box">
				<input type="hidden" value="<%=comment_no%>" name="comment_no">
				<div class='comment_writer'><%=comment_id %></div>
				<div class='comment_detail'><textarea name="comment_content"  class="content"><%=comment_content%></textarea></div>
				<div class='comment_close' ><input type="button" value="수정" class="edit_btn"></div>
			</div>
		</div>
	</main>
	<hr style="clear:both;">
	<footer>
		<jsp:include page="footer2.jsp"/>
	</footer>
</body>
</html>