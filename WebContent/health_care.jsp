<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<!DOCTYPE html>
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
<meta charset="utf-8">
<style>
	#state{
		border: none;
		text-align: center;
		background-color: white;
		font-size: 30px;
		width: 485px;
	}

</style>
<title>Insert title here</title>
</head>
<script>
	function InBody() {
		
	
		var kg = document.getElementById("wieght").value;
		var m = document.getElementById("height").value * 0.01;
		var bmi = kg / (m*m);
		var result = "키와 몸무게를 입력해주십시오";
		if(0 < bmi && bmi < 18.5){
			result = "저체중";
		}else if (18.5 < bmi && bmi < 23) {
			result = "정상";
		}else if (23 < bmi && bmi < 25) {
			result = "과체중";
		}else if (25 < bmi && bmi < 30) {
			result = "비만";
		}else if (30 < bmi) {
			result = "고도비만";
		}
		
		 var re = document.getElementById("state");
		 re.value = result;
	
	
	}
	
</script>
<body>
	<header>
		<jsp:include page="header2.jsp" />
	</header>
	<br><br><br><br><br>
	<form>
		<h2 align="center">건강 관리 페이지 입니다</h2>
		<br><br><br><br><br><br><br><br><br><br><br><br><br>
		<div align="center" style="position: relative; bottom: 200px;">
		<label for="height">키 : </label><input type="text" name="height" id="height">
		<label for="wieght">몸무게 : </label><input type="text" name="wieght" id="wieght">
			<br><br>
			<input type="button" value="건강상태 확인하기" style="width: 180px;" onclick="InBody();">
			<br><br>
			<input type="text" id="state" disabled="disabled">
		</div>
		<br>
		<div align="center">
			<img alt="" src="img/BMI.jpg">
		</div>
		<br><br>
		<div align="center">
			<a href="http://www.barudak.co.kr/?&utm_source=google&utm_medium=sa_pc&utm_campaign=lunchbox2&utm_content=200301_lunchbox2_1&utm_term=%EB%8B%A4%EC%9D%B4%EC%96%B4%ED%8A%B8%EB%8F%84%EC%8B%9C%EB%9D%BD&gclid=Cj0KCQjwtZH7BRDzARIsAGjbK2anSOXIT3ycBDtFklTgAVmJZEALt-xzJKfzKMgYBrCAjEdDm10t5hwaAt8vEALw_wcB" target="_blank" >다이어트 도시락 구매하기</a>
			<br><br><br>
			<a href="https://topguide.kr/%EC%8B%9D%ED%92%88/%EB%8B%A8%EB%B0%B1%EC%A7%88-%EB%B3%B4%EC%B6%A9%EC%A0%9C/%ED%94%84%EB%A1%9C%ED%8B%B4-%EC%B6%94%EC%B2%9C-2020%EB%85%84/">프로틴 추천</a>
			<br><br><br>
			<a href="...">스테로이드 빨기</a>
		</div>
		
		
	</form>
	<footer>
		<jsp:include page="footer2.jsp" />
	</footer>
	
	
</body>
</html>