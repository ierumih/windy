<%@ page language = "java" contentType = "text/html; charset = UTF-8" pageEncoding = "UTF-8" %>
<%
	String id = (String) session.getAttribute("id");
	String nick = (String) session.getAttribute("nick");
	if(id!=null&&nick!=null){
		out.print("<script>alert('이미 로그인 되어 있습니다.');history.back();</script>");
	}
%>
<!DOCTYPE html>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap"
	rel="stylesheet">
<!-- 폰트 CSS -->
<html>
<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
	<!--
	폰트CSS
	-->
}

body {
	background-image: url("img/UHD1.jpg");
	background-position: center;
	background-origin: content-box;
	background-repeat: no-repeat;
	background-size: cover;
	min-height: 100vh;
	font-family: 'Noto Sans', sans-serif;
}

.text-center {
	color: #fff;
	text-transform: uppercase;
	font-size: 23px;
	margin: -50px 0 80px 0;
	display: block;
	text-align: center;
}

.box {
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
	background-color: rgba(0, 0, 0, 0.89);
	border-radius: 3px;
	padding: 70px 100px;
}

.input-container {
	position: relative;
	margin-bottom: 25px;
}

.input-container label {
	position: absolute;
	top: 0px;
	left: 0px;
	font-size: 16px;
	color: #fff;
	pointer-event: none;
	transition: all 0.5s ease-in-out;
}

.input-container input {
	border: 0;
	border-bottom: 1px solid #555;
	background: transparent;
	width: 100%;
	padding: 8px 0 5px 0;
	font-size: 16px;
	color: #fff;
}

.input-container input:focus {
	border: none;
	outline: none;
	border-bottom: 1px solid #e74c3c;
}

.btn {

	color: #fff;
	background-color: #e74c3c;
	outline: none;
	border: 0;
	color: #fff;
	padding: 10px 20px;
	text-transform: uppercase;
	margin-top: 50px;
	border-radius: 2px;
	cursor: pointer;
	position: relative;
}
.input-container input:focus ~ label, .input-container input:valid ~
	label {
	top: -12px;
	font-size: 12px;
}
.cbox{
	color: white;
	font-size: 5px;
}
.a1{
	font-size: 7px;
	color: white;
}


</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<div class="box">
		<form action='loginaction.b' method='post'>
			<span class="text-center">login</span>
			<div class="input-container">
				<input type="text" required="" name = "id"/> <label>ID</label>
			</div>
			<div class="input-container">
				<input type="password" required="" name = 'pw'/> <label>PASSWARD</label>
			</div>
			<input type= "checkbox" name = "maintain" value = "mt"> <label class="cbox">로그인유지</label><br>
			<input type = "hidden" name = "ur" value = "<%=request.getHeader("referer")%>">
			<input type="submit" class="btn" value = "SUBMIT"'>
			
			<br> <br>
			<a href="..." class="a1">CAN'T SIGN IN?</a><br>
			<a href="..." class="a1">CREATE ACCOUNT</a><br>
			<a href="..." class="a1">GO MAIN PAGE</a>
		</form>
	</div>
</body>
</html>