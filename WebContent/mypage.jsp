<%@page import="com.windy.vo.Challenge_comp"%>
<%@page import="com.windy.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.windy.vo.User"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<%
	User info = (User) session.getAttribute("info");

	List<Board> board = (List<Board>) session.getAttribute("board");

	List<Challenge_comp> cc = (List<Challenge_comp>) session.getAttribute("compChallenge");

	int my_bike_count = 2;
	int wish_list_count = 5;

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
	
	.test_t tr td {
		width: 200px;
		height: 80px;
	}
	
	.test_b {
		width: 1000px;
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
	
	#board_div table {
		width: 1000px;
	}
	
	#board_div table tr td {
		border: solid 1px;
		width: 20%;
		text-align: center;
	}
	
	#my_bike_div table {
		width: 1000px;
	}
	
	#my_bike_div table tr td {
		width: 33%;
		border: solid 1px;
		text-align: center;
	}
	
	.receipt {
		width: 1000px;
	}
	
	.receipt tr td {
		width: 20%;
		text-align: center;
	}
	
	.settingbt {
		border: none;
		margin-left: 190px;
	}
	
	.settingbt img {
		width: 20px;
		height: 20px;
	}
	
	#challenge_div {
		width: 1000px;
		height: 500px;
	}
	
	#challenge_div p {
		margin: 0;
		height: 500px;
	}
	
	#nick_name {
		border: none;
		font-size: 30px;
		margin-left: 45px;
		text-align: center;
		background-color: white;
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
			$('#save').hide();
			$('#cnacel').hide();
	
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
	
			$(".settingbt").click(function() {//수정버튼
				$(".form-control").attr('disabled', false);
				$("#nick_name").attr('disabled', false);
				$('#save').show();
				$('#cnacel').show();
				$('.settingbt').hide();
			});
		});
	</script>
	<script>
		function Save(){
			document.getElementById('name');
			document.getElementById('nick_name');
			document.getElementById('tel');
			document.getElementById('email');
			document.getElementById('addr');
			document.getElementById('addr1');
			alert("asd");
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
					<br> <br> <input type="text" disabled="disabled"
					placeholder="<%out.print(info.getNick());%>" id="nick_name">
					<br> <br>
					<button type="button" class="settingbt" onclick="SettingOn">
						<img alt="" src="img/setting.png">
					</button>
					<button type="button" onclick="Save" id="save"
						style="margin-left: 165px;">저장</button>
					<button type="button" onclick="window.location.reload();" id="cnacel">취소</button></td>
			</tr>
			<tr>

				<td><label for="name">Name</label> <input
					type="text" disabled="disabled" style="width: 256px;"
					class="form-control" id="name"
					placeholder="<%out.print(info.getName());%>"></td>
			</tr>
			<tr>

				<td><label for="tel">Phone Number</label> <input
					type="text" disabled="disabled" style="width: 256px;"
					class="form-control" id="tel"
					placeholder="<%out.print(info.getTel());%>"></td>
			</tr>
			<tr>

				<td><label for="email">Email</label> <input
					type="text" disabled="disabled" style="width: 256px;"
					class="form-control" id="email"
					placeholder="<%out.print(info.getEmail());%>"></td>
			</tr>
			<tr>

				<td><label for="addr">Addr</label> <input
					type="text" disabled="disabled" style="width: 256px;"
					class="form-control" id="addr"
					placeholder="<%out.print(info.getAddr());%>"> <label
					for="addr1">Detail</label> <textarea
						disabled="disabled"
						style="width: 256px; height: 90px; resize: none;"
						class="form-control" id="addr1"
						placeholder="<%out.print(info.getAddr1() + "\n" + info.getAddr2() + "\n" + info.getAddr3());%>"></textarea></td>
			</tr>
		</table>
		<br> <br> <br> <br> <br> <br> <br>

		<table class="test_b">
			<tr>
				<td><a id="boards">Boards <%
					out.print(board.size());
				%></a></td>
				<td><a id="my_bike">My_Bike <%
					out.print(my_bike_count);
				%></a></td>
				<td><a id="wish_list">Wish_List <%
					out.print(wish_list_count);
				%></a></td>
				<td><a id="challenge">Challenge <%
					out.print(cc.size());
				%></a></td>
			</tr>
		</table>
		<br> <br>
		<div id="board_div">
			<table>
				<%
					for (int i = 0; i < board.size(); i++) {
				%>
				<tr>
					<td style="width: 10%;"><input type="checkbox"> <%
 	out.print(board.get(i).getBoard_num());
 %></td>
					<td style="width: 40%;">
						<%
							out.print(board.get(i).getBoard_title());
						%>
					</td>
					<td style="width: 10%;">
						<%
							out.print("댓글수가 나와야하는대 데이터필드가없음");
						%>
					</td>
					<td style="width: 20%;">
						<%
							out.print(board.get(i).getBoard_date());
						%>
					</td>
					<td style="width: 20%;">
						<%
							out.print(board.get(i).getBoard_good());
								out.print(board.get(i).getBoard_view());
						%>
					</td>
				</tr>
				<%
					}
				%>
			</table>
			<br>
			<div style="text-align: center;">
				<button>선택목록 삭제</button>
			</div>
		</div>


		<div id="my_bike_div">
			<table>
				<tr>
					<td>자전거 명</td>
					<td>자전거 시리얼 넘버</td>
					<td>등록 날짜</td>
				</tr>
				<tr>
					<td><input type="checkbox">브베의 행복한 자전거</td>
					<td>3029-111-11</td>
					<td>2000-00-00</td>
				</tr>
				<tr>
					<td><input type="checkbox">무면라이더 자전거</td>
					<td>6669-1555-21</td>
					<td>2000-00-00</td>
				</tr>
				<tr>
					<td><input type="text" placeholder="이름"></td>
					<td><input type="text" placeholder="시리얼 넘버"></td>
					<td><input type="button" value="등록"></td>
				</tr>
				<tr>
					<td>===</td>
					<td><input type="button" value="체크한거 삭제하는 버튼"></td>
					<td>===</td>
				</tr>
			</table>
		</div>

		<div id="wish_list_div">
			<table>
				<tr>
					<td>위시 리스트</td>
				</tr>
			</table>
		</div>

		<div id="challenge_div">
			<p style="width: 45%; border: solid 1px;">
				<%
					for (int i = 0; cc.size() > i; i++) {
						out.println(cc.get(i).getC_code() + " 업적넘버");
						out.println(cc.get(i).getComp_date() + " 달성 날짜 <br>");
					}
				%>
			</p>
		</div>
		<br> <br>
		<hr>
		<br> <br>
		<p style="text-align: center; font-size: 28px;">주문 현황</p>
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
				<td>무면라이더 자전거</td>
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