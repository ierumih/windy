<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
    <%
    	
    	String [] kind = request.getParameterValues("f_kind");
    	String [] size = request.getParameterValues("f_size");
    	String p_price = request.getParameter("f_cost");
    	String [] name = request.getParameterValues("f_brand");
    	String p_kind = String.join(",",kind);
    	String p_size= String.join("|",size);
    	String p_name = String.join("|",name);
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<%=p_kind %>
	<br>
	<%=p_size %>
	<br>
	<%=p_price %>
	<br>
	<%=p_name %>
	<br>
<input type="button" value="확인" style="height:25px;width:40px;" onclick="location.href='shopBestList.b'">
</body>
</html>