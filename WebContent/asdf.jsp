<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
    Cookie[] cookies = request.getCookies();
	String asdf = "";
	String asdfg = "";
	String asdfgh = "";
	for(int i=0;i<cookies.length;i++){
		if(cookies[i].getName().equals("c_id")){
			asdf = cookies[i].getValue();
		}
		if(cookies[i].getName().equals("fbqwert23")){
			asdfgh = cookies[i].getValue();
		}
	}
	asdfg = (String) session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	alert('<%=asdf%>/<%=asdfg%>/<%=asdfgh%>');
</script>
</body>
</html>