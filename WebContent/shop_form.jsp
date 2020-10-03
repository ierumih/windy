<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String id = (String) session.getAttribute("id");
	String nick = (String) session.getAttribute("nick");
	
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title></title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/shop_form.css">
	<script type="text/javascript">
	$(function(){
		$(window).resize(function(){
			var width_size = window.outerWidth;
			if(width_size<=1800){
				$("#menu9").hide();
			}
			else{
				$("#menu9").show();
			}
		});
		
		$('#findProduct').hide();
		$('#fp').on("click",function(){
			$('#findProduct').fadeIn();
			$('#menu9').attr('width','100%');
		});
		$('#xb').on("click",function(){
			$('#findProduct').fadeOut();
			$('#menu9').attr('width','360px');
		});
		$('input[name=f_cost]').on('click',function(){
			var chkc = $("input:checkbox[name=f_cost]:checked").length;
			
			if(chkc>1){
				$(":checkbox[name=f_cost]:not(:checked)").attr("disabled","disabled");
				alert("가격대는 하나만 선택가능합니다.");	
				$(this).attr("checked",false);
			}else{
				$('input[name=f_cost]:checkbox').removeAttr('disabled');
			}
		});
		
		$('#fb').on('click',function(){
			var cnt = $('#checklabel').find('input:checkbox[name=f_kind]:checked').length;
			var cnt1 = $('#checklabel').find('input:checkbox[name=f_size]:checked').length;
			var cnt2 = $('#checklabel').find('input:checkbox[name=f_cost]:checked').length;
			var cnt3 = $('#checklabel').find('input:checkbox[name=f_brand]:checked').length;
			if(cnt==0||cnt1==0||cnt2==0||cnt3==0){
				alert("항목별로 모두 체크해주세요");
			}else{
				$('#fpf').submit();
			}
		});
		
		
	});
	</script>
	<style type="text/css">
	
	#title1{
		font-size : 11pt;
		position: fixed;
		top: 46px;
		left: 150px;
		font-weight: bold;
	}
	#inout{
		float:right;
		position:relative;
		right:15px;
		top:20px;
		color:rosybrown;
	}
	.inoutla{
		color:rosybrown;
		font-weight:bold;
	}
	.inoutla:hover{
		cursor:pointer;
	}
	#m_top{
		position:fixed;
		bottom:0;
		right:0;
	}
	#m_top:hover{
		cursor:pointer;
	}
	/*상품찾기*/
	#findProduct{
		height: 360px;
		width: 780px;
		background-color: white;
		position: fixed;
		text-align: center;
		margin-top: 350px;
		border: 1px solid #d8d3d3;
		z-index: 99;
		left:0;
		right:0;
	}
	#findProduct ul{
		list-style-type: none;
	}
	#toplabel{
		font-size: 11pt;
		font-weight: bold;
	}
	#toplabel li{
		display: table-cell;
		width: 200px;
		height: 40px;
		background-color: #ffc88a;
		vertical-align: middle;
		
	}
	#toplabel li:last-child{
		width:320px;
	}
	#checklabel{
		width: 780px;
		margin-bottom: 5px;
	}
	#checklabel ul{
		display: table-cell;
		width: 150px;
		height: 250px;
		border-left: 1px dotted #a6d8ec;
		text-align: left;
	
	}
	#checklabel li{
		padding:5px;
		font-size: 10pt;
	}
	
	#checklabel ul:last-child li{
		display: inline-block;
		margin: 0;
		
	}
	#checklabel ul:last-child{
		width: 260px;
		height: 260px;
	}
	
	
	#xb{
		float:right;
		padding-right: 15px;
		font-size: 2.6rem;
		width: 25px;
		height: 30px;
		font-weight: 700;
	}
	
	#xb:hover{
		cursor: pointer;
		opacity: .75;
		border: 0;
	}
	input[type="checkbox"] {
		display: none;
	}
	input[type="checkbox"] + label {
		display: inline-block;
		cursor: pointer;
		-webkit-user-select: none;
		-moz-user-select: none;
		-ms-user-select: none;
		user-select: none;
	
	}
	
	input[type="checkbox"] + label:before {
		content: '';
		display: inline-block;
		width: 15px;
		height: 15px;
		line-height:15px;
		margin: -2px 8px 0 0;
		text-align: center;
		vertical-align: middle;
		background: #fafafa;
		border: 1px solid #cacece;
		border-radius: 3px;
		box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05);
	
	}
	
	input[type="checkbox"] + label:active:before,
	input[type="checkbox"]:checked + label:active:before {
	    box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px 1px 3px rgba(0,0,0,0.1);
	       
	}
	
	input[type="checkbox"]:checked + label:before {
		content: '\2713';
		color: gray;
		background: white;
		font-weight: bold;
		border-color: #adb8c0;
		box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05);
	}
	
	label{
		font-weight: normal;
	}
	#fb{
		font-size:10pt;
		font-weight:bold;
		width:70px;
		height:40px;
		background-color:#ffc88a;
		border-radius: 10px;
		border:1px solid #fff7ee;
		margin-top:10px;
	}
	</style>
</head>
<body>
	<div id="menu9">
		<a href="shopBestList.b"><span id="title">WINDY</span><span id="title1">shop</span></a>
		<div id="f">
			<ul>
				<li><a href="bikelist.b?p_kind=road">Road</a></li>
				<li><a href="bikelist.b?p_kind=mtb">MTB</a></li>
				<li><a href="bikelist.b?p_kind=hy">Hybrid</a></li>
			</ul>
		</div>
		<div id="s">
			<ul>
				<li id="fp">FindProduct</li>
			</ul>
		</div>
		<div id="add_prod"><a href="admin_add_product.jsp">+</a></div>
	</div>
	<div id="menubtn9">
		<a href="main.jsp"><img src="img/qwer.jpg" id="logo"></a>
	</div>
	<div id="inout">
		<%if(id!=null) {%><label class="inoutla" onclick="location.href='mypage.b'">마이페이지</label> | <label class="inoutla" onclick="location.href='logout.jsp?ur=shopBestList.b'">로그아웃</label>
		<%}else {%><label class="inoutla" onclick="location.href='join.jsp'">회원가입</label> | <label class="inoutla" onclick="location.href='login.jsp'">로그인</label><%} %>
	</div>
	<span id="m_top" onclick="window.scrollTo(0,0);">TOP▲</span>
	<div id="findProduct">
			<div id="toplabel">
				<ul>
					<li>종류</li>
					<li>사이즈</li>
					<li>가격대</li>
					<li>브랜드</li>
				</ul>
			</div>
			<form id="fpf" action="findProduct.b">
			<div id="checklabel">
				<ul style="padding-left:30px">
					<li><input type="checkbox" id="1" name="f_kind" value="road"><label for="1">Road Bike</label></li>
					<li><input type="checkbox" id="2" name="f_kind" value="mtb"><label for="2">MTB</label></li>
					<li><input type="checkbox" id="3" name="f_kind" value="hy"><label for="3">Hybrid Bike</label></li>
					<li><input type="checkbox" id="4" name="f_kind" value="etc"><label for="4">기타</label></li>
				</ul>
				<ul style="text-align: center">
					<li><input type="checkbox" id="17" name="f_size" value="440|XXS|14"><label for="17">440 (150이상)</label></li>
					<li><input type="checkbox" id="18" name="f_size" value="470|XS|15"><label for="18">470 (160이상)</label></li>
					<li><input type="checkbox" id="19" name="f_size" value="480|S|16"><label for="19">480 (165이상)</label></li>
					<li><input type="checkbox" id="20" name="f_size" value="490|M|17"><label for="20">490 (170이상)</label></li>
					<li><input type="checkbox" id="21" name="f_size" value="500|510|520|L|18"><label for="21">510 (175이상)</label></li>
					<li><input type="checkbox" id="22" name="f_size" value="540|560|XL|19"><label for="22">540 (180이상)</label></li>
					<li><input type="checkbox" id="23" name="f_size" value="570|580|XXL|19"><label for="23">570 (185이상)</label></li>
				</ul>
				<ul style="padding-left:25px">
					<li><input type="checkbox" id="8" name="f_cost" value="1"><label for="8">낮은순</label></li>
					<li><input type="checkbox" id="9" name="f_cost" value="2"><label for="9">높은순</label> </li>
				</ul>
				<ul style="padding-left:10px">
					<li><input type="checkbox" id="24" name="f_brand" value="포커스"><label for="24">포커스</label></li>
					<li><input type="checkbox" id="25" name="f_brand" value="캐논데일"><label for="25">캐논데일</label></li>
					<li><input type="checkbox" id="26" name="f_brand" value="트위터"><label for="26">트위터</label></li>
					<li><input type="checkbox" id="27" name="f_brand" value="첼로"><label for="27">첼로</label></li>
					<li><input type="checkbox" id="28" name="f_brand" value="메리다"><label for="28">메리다</label></li>
					<li><input type="checkbox" id="29" name="f_brand" value="자이언트"><label for="29">자이언트</label></li>
					<li><input type="checkbox" id="30" name="f_brand" value="비앙키"><label for="30">비앙키</label></li>
					<li><input type="checkbox" id="31" name="f_brand" value="알톤"><label for="31">알톤</label></li>
					<li><input type="checkbox" id="32" name="f_brand" value="후지"><label for="32">후지</label></li>
					<li><input type="checkbox" id="33" name="f_brand" value="히들"><label for="33">히들</label></li>
					<li><input type="checkbox" id="34" name="f_brand" value="스페셜라이즈드"><label for="34">스페셜라이즈드</label></li>
					<li><input type="checkbox" id="35" name="f_brand" value="스타카토"><label for="35">스타카토</label></li>
					<li><input type="checkbox" id="36" name="f_brand" value="트렉"><label for="36">트렉</label></li>
				</ul>
			</div>
			<div>
				<input type="button" id="fb" value="상품찾기">
				<div id="xb">&times;</div>
			</div>
			</form>
		</div>
</body>
</html>