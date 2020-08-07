<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.windy.vo.Product" %>
<%@page import="java.text.DecimalFormat" %>
    
 <%
 	List<Product> list = (List<Product>)request.getAttribute("list");
 	DecimalFormat formatter = new DecimalFormat("###,###");
 	String p_kind =(String) request.getAttribute("p_kind");
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style type="text/css">
	#pp{
		text-align: center;
		height: 969px;
	}
	
	.pic{
		margin:0;
		width:320px;
		height:270px;
		padding-top: 35px;
	}
	.pic img{
		width: 315px;
		height: 209px;
		padding-top: 5px;
	}
	.left{
		clear:both;
		width:100%;
		height:870px;
		
	}
	.left ul{
		list-style-type:none;
		text-align:center;
		float:left;
		margin:20px 20px 0 20px;
		padding-left:0;
	}
	.left ul:last-child{
		margin-bottom: 50px;

	}
	.left ul li{
		padding-bottom: 5px;
	}
	.left ul li:nth-child(2){
		font-size: 12pt;
		font-weight: bold;
	}
	.left ul li:last-child{
		color:red;
		font-size: 12pt;
		font-weight: bold;
	}
	
	.fix{
		position:fixed;
		top:0px;
		text-align: center;
		clear: both;
		z-index:99;
	}
	.hvr-reveal {
	  display: inline-block;
	  vertical-align: middle;
	  -webkit-transform: perspective(1px) translateZ(0);
	  transform: perspective(1px) translateZ(0);
	  box-shadow: 0 0 1px rgba(0, 0, 0, 0);
	  position: relative;
	  overflow: hidden;
	}
	.hvr-reveal:before {
	  content:'';
	  position: absolute;
	  z-index: 5;
	  left: 0;
	  right: 0;
	  top: 0;
	  bottom: 0;
	  border-color: #337ab7;
	  border-style: solid;
	  border-radius: 20px;
	  border-width: 0;
	  -webkit-transition-property: border-width;
	  transition-property: border-width;
	  -webkit-transition-duration: 0.1s;
	  transition-duration: 0.1s;
	  -webkit-transition-timing-function: ease-out;
	  transition-timing-function: ease-out;
	}
	.hvr-reveal:hover:before, .hvr-reveal:focus:before, .hvr-reveal:active:before {
	  -webkit-transform: translateY(0);
	  transform: translateY(0);
	  border-width: 4px;
	}
	
</style>
</head>
<body>
	<div>
		<jsp:include page="shop_form.html"/>
	</div>
	<div class="wrap">
		<div class="left">
			<%if(p_kind.equals("road")){ %><div class="sub_t" id="rb">Road Bike</div>
			<%}else if(p_kind.equals("mtb")) {%><div class="sub_t" id="mtb">MTB</div>
			<%}else if(p_kind.equals("hy")) {%><div class="sub_t" id="hb">Hybrid Bike</div><%} %>
			<%for(int i=0;i<list.size();i++) {
						out.println("<ul><a href='productDetail.b?p_code="+list.get(i).getP_code()+"'><li class='pic hvr-reveal'><img src="+list.get(i).getP_img()+"></li></a>");
						out.println("<li>"+list.get(i).getP_name()+"</li>");
						out.println("<li>"+list.get(i).getP_summary()+"</li>");
						out.println("<li>"+formatter.format(list.get(i).getP_price())+"</li></ul>");
				}
			%>
		</div>
	</div>
</body>
</html>