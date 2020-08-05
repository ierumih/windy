<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<!DOCTYPE html>
<%
	String name = (String) session.getAttribute("name");
	String nick = (String) session.getAttribute("nick");
	String phone_num = (String) session.getAttribute("phone_num");
	String email = (String) session.getAttribute("email");
	String email_tail = (String) session.getAttribute("email_tail");
	String addr = (String) session.getAttribute("addr");
	String addr_detail = (String) session.getAttribute("addr_detail");
	

	name = "홍구리동";
	nick = "Admin_xxxkf_ang";
	phone_num = "010-4444-4444";
	email = "angtanga";
	email_tail = "eXam.com";
	addr = "강남";
	addr_detail = "출력되는 값들은 임의로 준값들 입니다";

	int boards_count = 11;
	int my_bike_count = 2;
	int wish_list_count = 5;
	int challenge_count = 4;
%>
<html>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap"
	rel="stylesheet">
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
	width: 1000px;
}

.test_b tr {
	
}

.test_b tr td {
	padding-top: 15px;
	border-top: solid 1px;
	text-align: center;
	font-size: 22px;
	width: 25%;
}

.test_b tr td a {
	text-decoration: none;
	color: black;
}

.categori1 {
	width: 1000px;
}

.categori1 tr td {
	border: solid 1px;
	width: 20%;
	text-align: center;
}

.categori2 tr {
	border: solid 1px;
	text-align: center;
}




.receipt{
	width: 1000px;
}

.receipt tr td{
	width: 20%;
	text-align: center;
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
	$(document).ready(function() {
		$('#board_div').hide();
		$('#my_bike_div').hide();
		$('#wish_list_div').hide();
		$('#challenge_div').hide();

		$('#boards').click(function() {
			$('#board_div').toggle('slow');
			$('#my_bike_div').hide();
			$('#wish_list_div').hide();
			$('#challenge_div').hide();
		});
		$('#my_bike').click(function() {
			$('#my_bike_div').toggle('slow');
			$('#board_div').hide();
			$('#wish_list_div').hide();
			$('#challenge_div').hide();
		});

		$('#wish_list').click(function() {
			$('#wish_list_div').toggle('slow');
			$('#board_div').hide();
			$('#my_bike_div').hide();
			$('#challenge_div').hide();
		});

		$('#challenge').click(function() {
			$('#challenge_div').toggle('slow');
			$('#board_div').hide();
			$('#my_bike_div').hide();
			$('#wish_list_div').hide();
		});

	});
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
					style="border: none; font-size: 30px; margin-left: 40px; text-align: center;"
					readonly="readonly" placeholder="<%out.print(nick);%>"><br>
					<br>
					<button type="button" class="btn btn-danger" onclick="update()"
						style="margin-left: 158px;">SETTING</button></td>
			</tr>
			<tr>

				<td><label for="exampleInputName2">Name</label> <input
					type="text" readonly="readonly" style="width: 256px;"
					class="form-control" id="exampleInputName2"
					placeholder="<%out.print(name);%>"></td>
			</tr>
			<tr>

				<td><label for="exampleInputName3">Phone Number</label> <input
					type="text" readonly="readonly" style="width: 256px;"
					class="form-control" id="exampleInputName3"
					placeholder=" <%out.print(phone_num);%> "></td>
			</tr>
			<tr>

				<td><label for="exampleInputName5">Email</label> <input
					type="text" readonly="readonly" style="width: 256px;"
					class="form-control" id="exampleInputName5"
					placeholder="<%out.print(email + "@" + email_tail);%>"></td>
			</tr>
			<tr>

				<td><label for="exampleInputName4">Addr</label> <input
					type="text" readonly="readonly" style="width: 256px;"
					class="form-control" id="exampleInputName4"
					placeholder="<%out.print(addr);%>"> <label
					for="exampleInputName6">Detail</label> <textarea
						readonly="readonly" style="width: 256px; resize: none;"
						class="form-control" id="exampleInputName6"
						placeholder="<%out.print(addr_detail);%>"></textarea></td>
			</tr>
		</table>
		<br> <br> <br> <br> <br> <br> <br>

		<table class="test_b">
			<tr>
				<td><a id="boards">Boards <%
					out.print(boards_count);
				%></a></td>
				<td><a id="my_bike">My_Bike <%
					out.print(my_bike_count);
				%></a></td>
				<td><a id="wish_list">Wish_List <%
					out.print(wish_list_count);
				%></a></td>
				<td><a id="challenge">Challenge <%
					out.print(challenge_count);
				%></a></td>
			</tr>
		</table>
		<br> <br>
		<div id="board_div">
			<table class="categori1">
				<%
					for (int i = 0; i < boards_count; i++) {
				%>
				<tr>
					<td><input type="checkbox"> 글번호</td>
					<td>제목</td>
					<td>날짜</td>
					<td>댓긓 수</td>
					<td>추천 , 조하수</td>
				</tr>
				<%
					}
				%>
			</table>
			<input type="button" value="선택 삭제">
		</div>

		<div id="my_bike_div">
			<table class="categori2">
				<tr>
					<td>선호자전거</td>
				</tr>
				<tr>
					<td><input type="checkbox" id="blankCheckbox" value="type1"
						aria-label="X">로드 바이크</td>
					<td><input type="checkbox" id="blankCheckbox" value="type2"
						aria-label="X">산악 바이크</td>
					<td><input type="checkbox" id="blankCheckbox" value="type3"
						aria-label="X">E-bike</td>
					<td><input type="checkbox" id="blankCheckbox" value="type3"
						aria-label="X">하이브리드</td>
					<td><input type="checkbox" id="blankCheckbox" value="type3"
						aria-label="X">픽시</td>
					<td><input type="checkbox" id="blankCheckbox" value="type3"
						aria-label="X"><input type="text" placeholder="직접입력">
					</td>
				</tr>
				<tr>
					<td>등록된자전거</td>
					<td>자전거 명</td>
					<td>시리얼 넘버</td>
				</tr>
			</table>
		</div>

		<div id="wish_list_div">
			<table class="categori3">
				<tr>
					<td>위시 리스트</td>
				</tr>
			</table>
		</div>

		<div id="challenge_div">
			<table class="categori4">
				<tr>
					<td>업적</td>
				</tr>
			</table>
		</div>
		<br>
		<br>
		<hr>
		<br>
		<br>
		<p style="text-align: center; font-size: 28px;">주문 현황<p>
		<table class="receipt">
			<tr>
				<td style="width: 10%">주문번호</td>
				<td style="width: 30%">제품명</td>
				<td style="width: 15%">가격</td>
				<td style="width: 15%">주문날짜</td>
				<td style="width: 30%">상태</td>
			</tr>
			<tr>
				<td>85</td>
				<td>기대가됩니다 자전거</td>
				<td>59.99</td>
				<td>2020-06-05</td>
				<td>배송중</td>
			</tr>
			<tr>
				<td>51</td>
				<td>브배의 행복한 자전거</td>
				<td>59.99</td>
				<td>2020-03-16</td>
				<td>배송완료</td>
			</tr>
			<tr>
				<td>47</td>
				<td>하이브리드 자전거</td>
				<td>59999.99</td>
				<td>2016-10-10</td>
				<td>배송완료</td>
			</tr>
		</table>



		<hr style="clear: both;">
		<footer>
			<jsp:include page="footer2.jsp" />
		</footer>
	</div>

</body>
</html>