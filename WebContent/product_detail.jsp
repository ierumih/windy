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
	String [] man = detail.getP_name().split(" ");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>상품정보</title>
<style>
	#pic_det{
		width:600px;
		height:400px;
		float:left;
		border:1px solid #ececec;
		border-radius:10px;
	}
	#pic_det img{
		width:582px;
		height:386px;
		text-align:center;
		float:left;
		clear:both;
	}
	#obox{
		width:450px;
		height:380px;
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
	#thumbimg{
		float:left;
		width:600px;
		text-align:center;
		
	}
	#thumbimg img{
		width:150px;
		height:100px;
		margin:0 5px 0 5px;
	}
	hr{
		margin:10px 0 10px 0;
	}
	#otable{
		width:450px;
	}
	#otable th{
		width: 100px;
		font-weight:500;
		font-size:14px;
		padding:5px 0 5px 0;
		
	}
	#otable tr:nth-child(2) th{
		width: 100px;
		font-weight:500;
		font-size:14px;
		padding:10px 0 10px 0;
	}
	#otable tr:nth-child(2) td{
		color:red;
		font-weight:bold;
		font-size:15pt;
	}
</style>
</head>
<body>
	<div>
		<jsp:include page="shop_form.html"/>
	</div>
	
	<%if(detail.getP_kind().equals("road")){ %><div class="sub_t" id="rb">Road Bike</div>
	<%}else if(detail.getP_kind().equals("mtb")) {%><div class="sub_t" id="mtb">MTB</div>
	<%}else if(detail.getP_kind().equals("hy")) {%><div class="sub_t" id="hb">Hybrid Bike</div><%} %>
	<div class="wrap">
		<div id="pic_det">
			<img src="<%=mimg[0] %>"/>
		</div>
		
		<div id="obox">
			<table id="otable" border="0">
				<tr>
					<td colspan="2"><h2><%=detail.getP_name() %></h2><hr></td>
				</tr>
				<tr>
					<th>판매가</th>
					<td><%=formatter.format(detail.getP_price()) %></td>
				</tr>
				<tr>
					<td colspan="2"><hr></td>
				</tr>
				<tr>
					<th>제조사</th>
					<td><%=man[0] %></td>
				</tr>
				<tr>
					<th>스펙</th>
					<td><%=detail.getP_summary() %></td>
				</tr>
				<tr>
					<th>상품코드</th>
					<td><%=detail.getP_code() %></td>
				</tr>
				<tr>
					<th>사이즈</th>
					<td><select name="b_size">
						<option value=""></option>
					</select></td>
				</tr>
			</table>				
				
				
				
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