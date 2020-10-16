<%@page import="com.windy.vo.Mypage_event"%>
<%@page import="com.windy.vo.Challenge_comp"%>
<%@page import="com.windy.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.windy.vo.User"%>
<%@page import="com.windy.vo.Order"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<%
	User info = (User) session.getAttribute("info");

	List<Board> board = (List<Board>) session.getAttribute("board");

	List<Challenge_comp> cc = (List<Challenge_comp>) session.getAttribute("ChallengeComp");

	List<Order> order = (List<Order>)session.getAttribute("OrderList");
	
	List<Mypage_event> event = (List<Mypage_event>)session.getAttribute("MyEvent");

	List<Order> wishList = (List<Order>)session.getAttribute("wishList");

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
	margin-left: 50px; 
	margin-right: 50px; 
	margin-top: 14px;
}

.profile_img_show {
	margin-top: 20px;
}

.test_t {
	width: 880px;
}

.test_t tr td {
	width: 200px;
	height: 80px;
}

.big_menu {
	width: 1000px;
}

.big_menu tr td {
	padding-top: 15px;
	border-top: solid 1px;
	text-align: center;
	font-size: 22px;
	width: 25%;
}

.big_menu tr td a {
	text-decoration: none;
	color: black;
}

#board_div table {
	width: 1000px;
}

#board_div table tr td {
	width: 20%;
	text-align: center;
}

.settingbt {
	border: none;
	margin-left: 192px;
}

.settingbt img {
	width: 20px;
	height: 20px;
}

#challenge_div {
	width: 1000px;
}
#challenge_div table tr td{
	text-align: center;
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
		$('#delete_bt').prop("disabled",true);
		$('#delete_bt').attr("disabled","disabled");
		$('#board_div').hide();
		$('#order_div').hide();
		$('#wish_list_div').hide();
		$('#challenge_div').hide();
		$('#save').hide();
		$('#cnacel').hide();
		$('#fix_addr').hide();
		$('#profile_img_setting').hide();
		$('#img_file').hide();
		$('#delete2').hide();

		$('#boards').click(function() {
			$('#board_div').toggle('slow');
			$('#order_div').hide();
			$('#wish_list_div').hide();
			$('#challenge_div').hide();
		});
		$('#my_bike').click(function() {
			$('#order_div').toggle('slow');
			$('#board_div').hide();
			$('#wish_list_div').hide();
			$('#challenge_div').hide();
		});

		$('#wish_list').click(function() {
			$('#wish_list_div').toggle('slow');
			$('#board_div').hide();
			$('#order_div').hide();
			$('#challenge_div').hide();
		});

		$('#challenge').click(function() {
			$('#challenge_div').toggle('slow');
			$('#board_div').hide();
			$('#order_div').hide();
			$('#wish_list_div').hide();
		});

		$(".settingbt").click(function() {//수정버튼
			$(".form-control").attr('disabled', false);
			$("#nick_name").attr('disabled', false);
			$('#save').show();
			$('#cnacel').show();
			$('.settingbt').hide();
			$('#show_addr').hide();
			$('#fix_addr').show();
			$('#profile_img_setting').show();
			$('#profile_img_show').hide();
			$('#img_file').show();
		});
		$('#delete1').click(function() {
			$('#delete2').toggle('slow');
			$('#delete_check').attr("checked",false);
			$('#delete_pw').attr('disabled', true);
			$("input[id='delete_pw']").val('');
		});
		$('#delete_check').change(function() {
			if($('#delete_check').is(':checked')){
				
				$('#delete_pw').attr('disabled', false);
				
				$('#delete_pw').on("propertychange change keyup paste input", function(){
					var text = $(this).val();	
					if(text == ''){
						return;
					}
					oldVal = text;
					$('#delete_bt').prop("disabled",false);
					$('#delete_bt').removeAttr("disabled");
				})
				
			}else{
				$('#delete_pw').attr('disabled', true);
				$("input[id='delete_pw']").val('');
			}
		});
		;
			
		
	});
</script>
<script>
	function Fixed(){
		
		var nick = document.getElementById("nick_name").value;//#쓰지않기
		if(nick.includes(" ")){
			alert("닉네임에 공백은 사용이 불가능 합니다");
			return false;
		}
		return true;

	}
	
	function Pwcheck(){
		
		var pwcheck = document.getElementById("delete_pw").value;
		
		var userpw = <%= info.getPw()%>;
		if(pwcheck == userpw){
			return true;
		}
		return false;
		alert("비밀번호를 다시입력해주세요");
	}
	
	
	function LoadImg(value) {
		if(value.files && value.files[0]) {
			var reader = new FileReader();
			reader.onload = function (e) {
				$('#profile_img_setting').attr('src', e.target.result);
			}
			reader.readAsDateURL(value.files[0]);
		}
	}
</script>
<body>

	<header>
		<jsp:include page="header2.jsp" />
	</header>
	<div id="wrapper">
		

			<br> <br>
		<form action="mypage_info_update.b" method="post" onsubmit="return Fixed();"> <!--  enctype="multipart/form-data 이미지 저장할떄 쓸려고 헀던거 -->
		<table class="test_t">
			<tr>
				<td rowspan="5">
					<img src="<% if(info.getProfile_img() != null){//보여지는 프로필 이미지 
						out.print("img/" + info.getProfile_img());
					}else{ out.print("img/profile_img.png");} %>" alt="프로필사진" 
					class="img-circle" id = "profile_img_show">
					
					
					<img src="<% if(info.getProfile_img() != null){//세팅 프로필
						out.print("img/" + info.getProfile_img());
					}else{ out.print("img/profile_img.png");} %>" alt="프로필사진"
					class="img-circle" id = "profile_img_setting">
					<input type="file" style="margin-left: 83px; margin-top: 10px" id="img_file" name="img_file" accept="image/*" onchange="profile_img_setting(this)">
					
					
					<br> <br> <input type="text" disabled="disabled"
					value="<%=info.getNick()%>" id="nick_name" name="nick_name">
					<br> <br>
					<button type="button" class="settingbt">
						<img alt="" src="img/setting.png">
					</button>
					<br>
					<button type="submit" id="save" style="margin-left: 167px;">저장</button>
					<button type="button" onclick="window.location.reload();" id="cnacel">취소</button></td>
			</tr>
			<tr>

				<td><label for="name">Name</label> 
				<input type="text" disabled="disabled" style="width: 256px;"
				 class="form-control" id="name" name="name" value="<%out.print(info.getName());%>"></td>
			</tr>
			<tr>

				<td><label for="tel">Phone Number</label> <input
					type="text" disabled="disabled" style="width: 256px;"
					class="form-control" id="tel" name="tel"
					value="<%out.print(info.getTel());%>"></td>
			</tr>
			<tr>

				<td><label for="email">Email</label> <input
					type="text" disabled="disabled" style="width: 256px;"
					class="form-control" id="email" name="email"
					value="<%out.print(info.getEmail());%>">
				
				</td>

			</tr>
			<tr>

				<td id="show_addr"><label for="addr">우편번호</label> <input
					type="text" disabled="disabled" style="width: 256px;"
					class="form-control" 
					value="<%out.print(info.getAddr1());%>"><label
					for="addr1">Detail</label> 
					<textarea disabled="disabled"
						style="width: 256px; height: 90px; resize: none;"
						class="form-control"><%out.print(info.getAddr()+"\n"+info.getAddr2()+"\n"+info.getAddr3());%></textarea>
				</td>
						
						
				<td id="fix_addr">
					<label for="addr1">우편번호 <input type="button" onclick="" value="우편번호 찾기" style="margin-left: 97px;"></label> 
					<input type="text" style="width: 256px;" class="form-control" id ="addr1" name="addr1" 
					value="<%out.print(info.getAddr1());%>">
					
					
					<label for="addr">주소</label> <input type="text" style="width: 256px;" class="form-control" id ="addr" name="addr"
					value="<%out.print(info.getAddr());%>">
					
					<label for="addr2">상세</label> <input type="text" style="width: 256px;" class="form-control" id ="addr2" name="addr2"
					value="<%out.print(info.getAddr2());%>">
					
					<label for="addr3">더 상세</label> <input type="text" style="width: 256px;" class="form-control" id ="addr3" name="addr3"
					value="<%out.print(info.getAddr3());%>">
				</td>
				
			</tr>
		</table>
		</form>
		<br> <br> <br> <br> <br> <br> <br>

		<table class="big_menu">
			<tr>
				<td>
					<a id="boards">Boards 
						<%out.print(board.size());%>
					</a>
				</td>
				<td>
					<a id="my_bike">Order 
						<%out.print(order.size());%>
					</a>
				</td>
				<td>
					<a id="wish_list">Wish_List 
						<%out.print(wishList.size());%>
					</a>
				</td>
				<td>
					<a id="challenge">Challenge 
						<%out.print(cc.size());%>
					</a>
				</td>
			</tr>
		</table>
		<br> <br>
		<div id="board_div">
			<table class="table table-hover">
				<tr>
					<td style="width: 10%; color: brown">게시물 번호</td>
					<td style="width: 40%; color: brown">제목</td>
					<td style="width: 10%; color: brown">댓글 수</td>
					<td style="width: 20%; color: brown">게시 날짜</td>
					<td style="width: 20%; color: brown">추천,조회</td>
				</tr>
				<%
					for (int i = 0; i < board.size(); i++) {
				%>
				<tr onclick=location.href=""><!-- 해당 게시판으로 보낼수 았는주소 입력 -->
					<td style="width: 10%;">
						<%
							out.print(board.get(i).getBoard_num());
						%>
					</td>
					<td style="width: 40%;">
						<%
							out.print(board.get(i).getBoard_title());
						%>
					</td>
					<td style="width: 10%;">
						<%
							out.print("댓글수");
						%>
					</td>
					<td style="width: 20%;">
						<%
							out.print(board.get(i).getBoard_date());
						%>
					</td>
					<td style="width: 20%;">
						<%
							out.print(board.get(i).getBoard_good() + " , " + board.get(i).getBoard_view());
						%>
					</td>
				</tr>
				
				
				<%
					}
				%>
			</table>
			<br>
			
		</div>


		<div id="order_div">
			<table class="table" style="width: 1000px;">
			<tr>
				<td style="width: 10%; color: brown;">주문번호</td>
				<td style="width: 30%; color: brown; text-align: center;">제품명</td>
				<td style="width: 10%; color: brown; text-align: center;">수량</td>
				<td style="width: 15%; color: brown; text-align: center;">가격</td>
				<td style="width: 15%; color: brown; text-align: center;">주문날짜</td>
				<td style="width: 20%; color: brown; text-align: center;">상태</td>
			</tr>
			<%
				for (int i = 0; i < order.size(); i++) {
				
			%>
			<tr onclick=location.href="http://windy1010.cafe24.com/productDetail.b?p_code=<%= order.get(i).getP_code()%>">
				<td style="">
					<%
						out.println(order.get(i).getO_code());
					%>
				</td>
				<td style="text-align: center;">
					<%
						out.println(order.get(i).getP_name());
					%>		
				</td>
				<td style="text-align: center;">
					<%
						out.println(order.get(i).getO_count());
					%>
				</td>
				<td style="text-align: center;">59.99</td>
				<td style="text-align: center;">
					<%
						out.println(order.get(i).getO_date());
					%>
				</td>
				<td style="text-align: center;">
					<%
						out.println(order.get(i).getO_state());
					%>
				</td>
			</tr>
			<%
				}
			%>
		</table>
		</div>

		<div id="wish_list_div">
			<table class="table" style="width: 1000px;">
			<tr>
				<td style="width: 15%; color: brown; text-align: center;">제품번호</td>
				<td style="width: 60%; color: brown; text-align: center;">제품명</td>
				<td style="width: 25%; color: brown; text-align: center;">가격</td>
			</tr>
			<%
				for (int i = 0; i < wishList.size(); i++) {
				
			%>
			<tr onclick=location.href="http://windy1010.cafe24.com/productDetail.b?p_code=<%= order.get(i).getP_code()%>">
				<td style="">
					<%
						out.println(wishList.get(i).getP_code());
					%>
				</td>
				<td style="text-align: center;">
					<%
						out.println(wishList.get(i).getP_name());
					%>		
				</td>
				<td style="text-align: center;">
					<%
						out.println(wishList.get(i).getO_price());
					%>
				</td>
			</tr>
			<%
				}
			%>
		</table>
		</div>

		<div id="challenge_div">
			<table class="table table-bordered" >
				<tr>
					<td style="width: 10%; color: brown">업적번호</td>
					<td style="width: 20%; color: brown">업적명</td>
					<td style="width: 50%; color: brown">달성내용</td>
					<td style="width: 10%; color: brown">달성날짜</td>
					<td style="width: 10%; color: brown">업적점수</td>
				</tr>
				<%
					for (int i = 0; i < cc.size(); i++) {
				%>
				<tr>
					<td style="width: 10%;">
						<%
							out.println(cc.get(i).getC_code());
						%>
					</td>
					<td style="width: 20%;">
						<%
							out.println(cc.get(i).getC_name());
						%>
					</td>
					<td style="width: 50%;">
						<%
							out.print(cc.get(i).getC_content());
						%>
					</td>
					<td style="width: 10%;">
						<%
							out.println(cc.get(i).getComp_date());
						%>
					</td>
					<td style="width: 10%;">
						<%
							out.print(cc.get(i).getC_score() + "점");
						%>
					</td>
					
				</tr>
				<%
					}
				%>
			</table>
			<div align="right" style="margin-right: 36px;">총점 : 
			<% 
				int total = 0;
				for (int i = 0; i < cc.size(); i++) {
					total = total + cc.get(i).getC_score(); 
				} 
				out.print(total + "점");
			%>
			</div>
		</div>
		<br> <br>
		<hr>
		<br> <br>
		<p style="text-align: center; font-size: 28px;">참여중인 이벤트</p>
		<table class="table table-hover" style="width: 1000px;">
			<tr>
				<td style="width: 10%; color: brown;">이벤트 번호</td>
				<td style="width: 50%; color: brown; text-align: center;">이벤트 명</td>
				<td style="width: 20%; color: brown; text-align: center;">시작날짜</td>
				<td style="width: 20%; color: brown; text-align: center;">마감날짜</td>
			</tr>
			<%
				for (int i = 0; i < event.size(); i++) {
			%>
			<tr onclick=location.href="#">
				<td style="">
					<%
						out.println(event.get(i).getE_num());
					%>
				</td>
				<td style="text-align: center;">
					<%
						out.println(event.get(i).getE_title());
					%>
				</td>
				<td style="text-align: center;">
					<%
						out.println(event.get(i).getS_date());
					%>
				</td>
				<td style="text-align: center;">
					<%
						out.println(event.get(i).getE_date());
					%>
				</td>
			</tr>
			<%
				}
			%>
		</table>
		<br><br><br>
		
		<form action ="deleteAccount.b" method="post" onsubmit="return Pwcheck();">
		<div align="right" style="width: 1000px"><button type="button" class="btn btn-default" id ="delete1">계정탈퇴 하기</button></div>
		<br>
		<div align="right" style="width: 1000px" id="delete2">
			
			
    		<input type="password" class="form-control" id="delete_pw" placeholder="PASSWORD" style="width: 200px;" disabled="disabled" name="delete_pw">
    		<input type="checkbox" id="delete_check"> 계정을 탈퇴합니다
			<br><br>
			
			<button type="submit" class="btn btn-danger" id="delete_bt" >계정탈퇴</button>
		</div>
		</form>



		<hr style="clear: both;">
		<footer>
			<jsp:include page="footer2.jsp" />
		</footer>
	</div>

</body>
</html>