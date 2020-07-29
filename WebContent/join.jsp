<%@ page language = "java" contentType = "text/html; charset = UTF-8" pageEncoding = "UTF-8" %>
<%
	String id = (String) session.getAttribute("id");
	String nick = (String) session.getAttribute("nick");
	if(nick!=null){
		out.print("<script>alert('이미 로그인 되어 있습니다.');history.back();</script>");
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>회원가입</title>
	  <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	  <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	  <!--tap bar slide-->
	  <script src="tendina-master/dist/tendina.js"></script>
	  <!--font-->
	  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap"  rel="stylesheet">
</head>
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
		#logo{
			margin-top:-8px;
			width:70px;
			height:70px;
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
		#wrap{
			position:relative;
			width:1080px;
			height:1000px;
			min-height:1000px;
		}
		main{
			width:980px;
			height:1000px;
			float:left;
		}
		/*=========================================
		main
		===========================================*/
		article{
			width:904px;
			margin-left:30px;
		}
		.main_head{
			width:400px;
			height:45px;
			margin:60px 0 0 165px;
			font-size:18pt;
			border-bottom:2px solid black;
		}
		table{
			margin: 40px auto 0 auto;
			height: 870px
			width:500px;
		}
		table tr{
			height: 45px;
		}
		
		table th{
			text-align: center;
			border-radius: 10px;
			border-bottom: 1px double #ddd;
			border-collapse: separate;
			width: 140px;
			font-size: 13pt;
		}
		table td{
			padding-left: 60px;
		}
		input text: hover{
			width:290px; 
			height:51px;
			background:url('input_bg.jpg') no-repeat;
			border:none;
			padding:15px;
			font-size:16px;
			color:#aaa;
		}
		.pw_height{
			height: 110px;
		}
		.submit{
			text-align: center;
		}
		.btn{
			border-radius: 5px;
			background-color: #f9f10280;
			font-size: 9pt;
			text-align: center;
			padding: 0 0 0 0;
			height: 32px;
			width: 70px;
		}
		.btn2{
			margin-left: 5px;
			background-color: #ddd;
			border-radius: 5px;
			border:0;
			size: 30px;
			height: 32px;
			width: 85px;
			font-size: 9pt;
			text-align: center;
			padding: 0 0 0 0;
		}
		.btn3{
			border-radius: 5px;
			background-color: #ddd;
			font-size: 9pt;
			text-align: center;
			padding: 0 0 0 0;
			height: 32px;
			width: 70px;
			margin-top: 30px;
			border:none;
		}
		.p{
			font-size:8pt;
			color:#bf0d0a;
		 }
		/*=========================================
		input type text / select
		===========================================*/
		.txt_nick{
			width : 80px;
			height : 32px;
		}
		.txt_middle{
			width:210px;
			height: 32px;
		}
		.txt_solo{
			width: 315px;
			height: 32px;
		}
		.sel_email{
			height: 32px;
		}
		.sel_tel{
			height: 32px;
			width:92px;
		}
		.txt_addres{
			width: 70px;
		}
		.txt_addres2{
			width: 320px;
			height: 32px;
			margin: 10px 0;
		}
		.txt_addres3{
			width: 157px;
			height: 32px;
		}
		.txt_addres_height{
			height: 120px;
		}
		.txt_solo : hover{
			border-color: skyblue;
		}
		input[type="text"]:disabled {
 			background: #ddd;
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
			$('#id').blur(function(){
				if($('#id').val().length<4){
							$('#id').val("");
							$('#dupc').html("* ID는 4글자 이상으로 입력해 주세요.");
				}
				else{
					$.ajax({
						url : 'dup.jsp',
						data : {'id':$('#id').val()},
						success : function(req){
							var i = parseInt(req);
							if(i==0){
								$('#dupc').html("<font color = blue>사용할 수 있는 아이디입니다.</font>");
							}
							else{
								$('#id').val("");
								$('#dupc').html("* 이미 가입되어 있는 ID입니다.");
							}
						}
					});
				}
			});
			$("#etc").change(function(){
				if ($("#etc").is(":checked")) { //
					$("#etc2").attr('disabled',false);
				}else{
					$("#etc2").val("");
					$("#etc2").attr('disabled',true);
				}
			});
			$("#pw").blur(function(){
				if($("#pw").val().length<5||$("#pw").val().length>20){
					$("#dupp").html("* 비밀번호는 5~20자 사이로 입력하세요.");
					$("#pw").val("");
					$("#pw2").val("");
				}
				else{
					$("#dupp").html("* 위에 입력한 비밀번호와 동일한 비밀번호를 입력하세요.");
				}
			});
			$("#pw2").blur(function(){
				if($("#pw").val()!=""){
					if($("#pw").val()==$("#pw2").val())
						$("#dupp").html("<font color = blue>비밀번호가 일치합니다.</font>");
					else
						$("#dupp").html("* 위에 입력한 비밀번호와 동일한 비밀번호를 입력하세요.");
				}
				else{
					$("#pw2").val("");
				}
			});
			$("#nick").blur(function(){
				if($("#nick").val().length<4){
					$("#dupn").html("* 닉네임은 4글자 이상으로 입력하세요.");
				}
				else{
					$.ajax({
						url : 'dupn.jsp',
						data : {'nick':$('#nick').val()},
						success : function(req){
							var i = parseInt(req);
							if(i==0){
								$('#dupn').html("<font color = blue>사용할 수 있는 닉네임입니다.</font>");
							}
							else{
								$('#nick').val("");
								$('#dupn').html("* 이미 사용중인 닉네임입니다.");
							}
						}
					});
				}
			});
		});
	</script>
	
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	    function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("sample6_extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("sample6_extraAddress").value = '';
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample6_postcode').value = data.zonecode;
	                document.getElementById("sample6_address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("sample6_detailAddress").focus();
	            }
	        }).open();
	    }
	</script>
	<script>
		function input(){

			var id = document.info.id.value;
			var pw = document.info.pw.value;
			var pw2 = document.info.pw2.value;
			var name = document.info.name.value;
			var birth1 = document.info.birth1.value;
			var birth2 = document.info.birth2.value;
			var birth3 = document.info.birth3.value;
			var tel2 = document.info.tel2.value;
			var tel3 = document.info.tel3.value;
			var sex = document.info.sex.value;
			var addr2 = document.info.addr2.value;
			var addr3 = document.info.addr3.value;
			var have = document.info.have.value;
			var bike = document.getElementsByName("bike");
			var bikes="";
			var etc2 = document.querySelector("input#etc2");
			var cnt = 0;
			for(var i=0;i<bike.length;i++){
				if(bike[i].checked&&count==0){
					bikes += bike[i].value;
				}
				else if(bike[i].checked){
					bikes += ", "+bike[i].value;
				}
			}
			
			if (id == "") {
				alert("아이디를 입력하세요");
				return false;
			}
			if (pw == "") {
				alert("비밀번호를 입력하세요");
				return false;
			}
			if (pw2 == "") {
				alert("비밀번호 확인을 입력하세요");
				return false;
			}
			if (name == "") {
				alert("이름을 입력하세요");
				return false;
			}
			if (birth1 == "") {
				alert("생년월일 '연도'를 입력하세요");
				return false;
			}
			if (birth2 == "") {
				alert("생년월일 '월'을 입력하세요");
				return false;
			}
			if (birth3 == "") {
				alert("생년월일 '일'을 입력하세요");
				return false;
			}

			if (tel2 == "") {
				alert("휴대전화번호를 입력하세요");
				return false;
			}
			if (tel3 == "") {
				alert("휴대전화번호를 입력하세요");
				return false;
			}
			if (sex == "") {
				alert("성별을 선택하세요");
				return false;
			}

			if (addr2 == "") {
				alert("주소를 입력하세요");
				return false;
			}
			/*if (addr3 == "") {
				alert("나머지 주소를 입력하세요");
				return false;
			}*/
			
			if (have == "") {
				alert("자전거 보유 여부를 선택하세요");
				return false;
			}
			if (bike == "") {
				alert("선호하는 자전거를 선택하세요");
				return false;
			}
			
		}
		
	</script>
	
<body>
	<form name="info" action="joinaction.b" method="post" accept-charset="UTF-8">
		<div id = "wrapper">
	 	<header>
			<div id = "headt">
				<a href = "main.jsp">
					<div id = "headl">
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
						<a href = "board.html">게시판</a>
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
		<main>
			<article>
				<div class="main_head"><b>회원가입</b></div>
				<table border="0">
					<tr>
						<th>아이디</th>
						<td>
							<input type="text" name="id" class="txt_solo" id = "id">
							<div class="p" id = "dupc">* ID는 4글자 이상으로 입력해 주세요.</div>
						</td>
					</tr>
					<tr>
						<th rowspan="2" class="pw_height">비밀번호</th>
						<td><input type="password" name="pw" id = "pw" class="txt_solo"></td>
					</tr >
					<tr>
						<td>
							<input type="password" name="pw2" id = "pw2" class="txt_solo">
							<div class="p" id = "dupp">* 비밀번호는 5~20자 사이로 입력하세요.</div>
						</td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" name="name" class="txt_solo"></td>
					</tr>
					<tr>
						<th>닉네임</th>
						<td><input type="text" name="nick" id = "nick" class="txt_solo"><div class="p" id = "dupn">* 닉네임은 4글자 이상으로 입력하세요.</div></td>
						
					</tr>
					<tr>
						<th>생년월일</th>
						<td><input type="text" name="birth1" maxlength="4" placeholder="   YYYY" class="txt_nick"> 년 <input type="text" name="birth2" maxlength="2" placeholder="    MM" class="txt_nick"> 월 <input type="text" maxlength="2" name="birth3" placeholder="    DD" class="txt_nick"> 일</td>
					</tr>
					<tr>
						<th>E-MAIL</th>
						<td><input type="text" name="email1" class="txt_middle"> @
							<select name="email2" class="sel_email">
								<option>naver.com</option>
								<option>daum.net</option>
								<option>gmail.com</option>
							</select></td>
					</tr>
					<tr>
						<th>연락처</th>
						<td><select name="tel1" class="sel_tel">
							<option>010</option>
							<option>011</option>
							<option>019</option>
							<option>016</option>
						</select>
						- <input type="text" maxlength="4" name="tel2" class="sel_tel">
						- <input type="text" maxlength="4" name="tel3" class="sel_tel"></td>
					</tr>
					<tr>
						<th>성별</th>
						<td><input type="radio" name="sex" id="woman" value="woman"> <label for="woman">여자</label>
							<input type="radio" name="sex" id="man" value="man"> <label for="man">남자</label>
						</td>
					</tr>
					<tr>
						<th>주소</th>
						<td class="txt_addres_height">
							<input type="text" id="sample6_postcode" name="addr1" placeholder="우편번호" class="txt_nick">
							<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn2"><br>
							<input type="text" id="sample6_address" name="addr2" placeholder="주소" class="txt_addres2"><br>
							<input type="text" id="sample6_detailAddress"  name="addr4" placeholder="상세주소" class="txt_addres3">
							<input type="text" id="sample6_extraAddress" name="addr3" placeholder="참고항목" class="txt_addres3">
						</td>
					</tr>
					<tr>
						<th>자전거 보유</th>
						<td>
							<input type="radio" id="mi" name="have"> <label for="mi">미보유</label>
							<input type="radio" id="bo" name="have"> <label for="bo">보유</label>
						</td>
					</tr>
					<tr>
						<th rowspan="3"">선호하는 자전거</th>
						<td><input type="checkbox" id="road" name="bike" value="road"> <label for="road">로드바이크</label>
							<input type="checkbox" id="mtb" name="bike" value="mtb"> <label for="mtb">산악바이크</label>
							<input type="checkbox" id="ebike" name="bike" value="ebike"> <label for="ebike">E-bike</label>
						</td>
					</tr>
					<tr>
						<td>
							<input type="checkbox" id="hybrid" name="bike" value="hybrid"> <label for="hybrid">하이브리드</label>
							<input type="checkbox" id="fixed" name="bike" value="fixed"> <label for="fixed">픽시바이크</label>
							<input type="checkbox" id="etc" name="bike" value=""> <label for="etc">기타</label>							
						</td>
					</tr>
					<tr>
						<td>
							
							<input type="text" id="etc2" class="txt_solo" disabled="true" placeholder="선호하는 자전거를 입력해주세요.">
						</td>
					</tr>
					<tr>
						<th>SMS 수신</th>
						<td>
							<input type="radio" id="po" name="sms" value="yes" checked=""> <label for="po">동의</label>
							<input type="radio" id="na" name="sms" value="no"> <label for="na">비동의</label>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="submit">
							<input type="submit" name="push" value="회원가입" class="btn3" onclick="return input()">
						</td>
					</tr>
				</table>
			</article>
		</div>
		</main>
		<hr style="clear:both;">
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
	<form >

</body>
</html>