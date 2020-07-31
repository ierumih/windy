<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style type="text/css">
	#ad_title{
		text-align:center;
		font-size:30pt;
		font-weight:bold;
		padding-top:20px;
	}
	#ad_img{
		width:270px;
		height:270px;
		border:1px solid black;
		float: left;
		font-size:40px;
		text-align:center;
			
	}
	#plus{
		padding-top:95px;
	}
</style>
</head>
<body>
	<header>
	<jsp:include page="shop_form.html"/>
	</header>
	<div class="wrap">
		<div id="ad_title">상품 등록 페이지</div>
		<div id="ad_img"><div id="plus">+</div></div>
	</div>
</body>
</html>