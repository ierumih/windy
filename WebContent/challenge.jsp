<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="java.util.List"%>
<%@page import="com.windy.vo.Challenge_list"%>
<!DOCTYPE html>
<%
	List<Challenge_list> cl = (List<Challenge_list>) session.getAttribute("CList");
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
<meta charset="utf-8">
<style>

form{
	position: relative;
	width: 100%;
}
.challenge{
		text-align: center;
		color: red;
		line-height: 400px;
		width: 1000px;
		font-family: 'Playfair Display', serif;
		font-size: 42pt;
}
</style>
<title>Insert title here</title>
</head>
<script>

</script>
<body>
	<header>
		<jsp:include page="header2.jsp" />
	</header>
	<br><br><br><br><br>
	<form>
		<div class="challenge">Callenge</div>
		<table style="width: 800px; position: relative;" class="table table-striped">
			<tr>
				<td style="width: 5%; color: red;">No</td>
				<td style="width: 15%; color: red;">Name</td>
				<td style="width: 70%; text-align: center; color: red;">Condition</td>
				<td style="width: 10p%; color: red;">Score</td>
			</tr>
			<%
				for (int i = 0; i < cl.size(); i++) {
				
			%>
			<tr>
				<td>
					<%
						out.println(cl.get(i).getC_code());
					%>
				</td>
				<td>
					<%
						out.println(cl.get(i).getC_name());
					%>
				</td>
				<td style="text-align: center;">
					<%
						out.println(cl.get(i).getC_content());
					%>
				</td>
				<td>
					<%
						out.println(cl.get(i).getC_score());
					%>
				</td>
			</tr>
			<%
				}
			%>
		</table>
	</form>
	<footer>
		<jsp:include page="footer2.jsp" />
	</footer>
	
	
</body>
</html>