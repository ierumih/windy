<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<!DOCTYPE html>
<%
	String name = (String) session.getAttribute("name");
	String phone_num = (String) session.getAttribute("phone_num");
	String email = (String) session.getAttribute("email");
	String email_tail = (String) session.getAttribute("email_tail");
	String addr = (String) session.getAttribute("addr");
%>
<html>
<!-- 합쳐지고 최소화된 최신 CSS 부터스트랩-->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 부터스트랩-->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 부터스트랩-->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<head>
<title>WINDY</title>
</head>
<meta charset="utf-8">
<style>
.img-circle {
	width: 300px;
	height: 300px;
}

.profile_img {
	margin-top: 20px;
}

.test_t {
	width: 880px;
}

.test_t tr {
	
}

.test_t tr td {
	width: 200px;
	height: 80px;
}

.test_b {
	width: 900px;
}

.test_b tr {
	
}

.test_b tr td {
	padding-top: 15px;
	border-top: solid 1px;
	text-align: center;
	font-size: 22px;
	width: 300px;
}

.test_b2 {
	width: 300px;
}

.test_b2 tr {
	
}

.test_b2 tr td {
	padding-top: 15px;
	border-top: solid 1px;
	text-align: center;
	font-size: 22px;
}
</style>

<script>
	$(document).ready(function() {
		$('#tapbar').tendina({});
		$('.slider').bxSlider({
			auto : true,
			pause : 4000,
			controls : false,
			stopAutoOnClick : true,
		});
	});
</script>
<script>
	function update() {

	}
</script>
<body>

	<header>
		<jsp:include page="header2.jsp" />
	</header>
	<div id="wrapper">
		<div class="profile_img">

			<br> <br>
		</div>
		<table class="test_t">
			<tr>
				<td rowspan="5"><img src="img/1.jpg" alt="프로필사진"
					class="img-circle"
					style="margin-left: 50px; margin-right: 50px; margin-top: 14px;">
					<br> <br> <input type="text"
					style="border: none; font-size: 30px; margin-left: 40px;"
					readonly="readonly" placeholder="ExamNIckName_Tlqkf"><br>
				<br>
					<button type="button" class="btn btn-danger" onclick="update()"
						style="margin-left: 120px;">개인정보 수정하기</button></td>
			</tr>
			<tr>

				<td><label for="exampleInputName2">Name</label> <input
					type="text" readonly="readonly" style="width: 256px;"
					class="form-control" id="exampleInputName2"
					placeholder="Real_Name_In_Here"></td>
			</tr>
			<tr>

				<td><label for="exampleInputName3">Phone Number</label> <input
					type="text" readonly="readonly" style="width: 256px;"
					class="form-control" id="exampleInputName3"
					placeholder="Phone Number_In_Here"></td>
			</tr>
			<tr>

				<td><label for="exampleInputName5">Email</label> <input
					type="text" readonly="readonly" style="width: 256px;"
					class="form-control" id="exampleInputName5"
					placeholder="Email_In_Here"></td>
			</tr>
			<tr>

				<td><label for="exampleInputName4">Addr</label> <input
					type="text" readonly="readonly" style="width: 256px;"
					class="form-control" id="exampleInputName4"
					placeholder="ADDR_In_Here"> <label for="exampleInputName6">Detail</label>
					<textarea readonly="readonly" style="width: 256px; resize: none;"
						class="form-control" id="exampleInputName6"
						placeholder="ADDR_Detail_In_Here"></textarea></td>
			</tr>
		</table>
		<br> <br> <br> <br> <br> <br> <br>

		<table class="test_b">
			<tr>
				<td>Boards 4</td>
				<td>My_Bike 2</td>
				<td>Wish_List 12</td>
			</tr>
		</table>
		<br>
		<br>
		<br>
		<br>
		<br>
		<table class="test_b2">
			<tr>
				<td>Challenge</td>
			</tr>
		</table>


		<hr style="clear: both;">
		<footer>
			<jsp:include page="footer2.jsp" />
		</footer>
	</div>

</body>
</html>