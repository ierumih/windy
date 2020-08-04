<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="com.windy.vo.Product" %>
<%@page import="java.util.*" %>
<%
	Product detail = (Product)request.getAttribute("detail");
	List<Product> sm = (List<Product>)request.getAttribute("sm");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>상품정보</title>
<style>
	#pic_det{
		width:600px;
		height:600px;
		border:1px solid black;
	}
	#pic_det img{
		width:400px;
		height:400px;
		text-align:center;
	}
</style>
</head>
<body>
	<div>
		<jsp:include page="shop_form.html"/>
	</div>
	<!--
	
	<%= detail.getP_detail() %>/
	<img src="<%= detail.getP_img() %>"/>+
	<%= detail.getP_kind() %>/
	<%= detail.getP_name() %>/
	<%= detail.getP_price() %>/
	
	-->
	<div class="sub_t" id="rb">Road Bike</div><div class="left">
		<div id="pic_det"><img src="<%= detail.getP_img() %>"/></div>	
	</div>
	
	이름<%=detail.getP_name() %>/
	종류<%=detail.getP_kind() %>/
	가격<%=detail.getP_price() %>/
	사이즈<%=sm.get(0).getP_option()%>/
	재고<%=sm.get(0).getP_stock() %>/
	사이즈<%=sm.get(1).getP_option()%>/
	재고<%=sm.get(1).getP_stock() %>
	
	
	
	
</body>
</html>