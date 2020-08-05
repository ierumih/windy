<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="com.windy.vo.Product" %>
<%@page import="java.util.*" %>
<%@page import="java.text.DecimalFormat" %>
<%
	Product detail = (Product)request.getAttribute("detail");
	List<Product> sm = (List<Product>)request.getAttribute("sm");
	DecimalFormat formatter = new DecimalFormat("###,###");
	String [] dimg = detail.getP_detail().split(" "); 
	String [] mimg = detail.getP_img().split(" ");
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
		margin-left:453px;
	}
	#pic_det img{
		width:582px;
		height:386px;
		text-align:center;
		float:left;
	}
	#obox{
		width:450px;
		height:400px;
		border:1px solid #ececec;
		margin-right:0;
		border-radius:10px;
		padding:10px;
	}
	#depic{
		text-align:center;
	}
	#depic img{
		width:1080px;
	}
	#thumbimg img{
		width:100px;
		height:100px;
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
	<%if(detail.getP_kind().equals("road")){ %><div class="sub_t" id="rb">Road Bike</div>
	<%}else if(detail.getP_kind().equals("mtb")) {%><div class="sub_t" id="mtb">MTB</div>
	<%}else if(detail.getP_kind().equals("hy")) {%><div class="sub_t" id="hb">Hybrid Bike</div><%} %>
	<div class="wrap">
		<span id="pic_det">
			<img src="<%=mimg[0] %>"/>
		</span>
		
		<div id="obox">
			<h2><%=detail.getP_name() %></h2>
			
			가격 : <%=formatter.format(detail.getP_price()) %>/
			사이즈<%=sm.get(0).getP_option()%>/
			재고<%=sm.get(0).getP_stock() %>/
			사이즈<%=sm.get(1).getP_option()%>/
			재고<%=sm.get(1).getP_stock() %>
		</div>
		<div id="thumbimg">
			<%for(int i=0;i<mimg.length;i++){ %>
				<img src="<%=mimg[i] %>">
			<%} %>
		</div>
		<%for(int i=0;i<dimg.length;i++) {%>
		<div id="depic"><img src="<%=dimg[i]%>"/></div>
		<%} %>
	</div>
	
		
	
	
	
	
	
</body>
</html>