<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.windy.dao.DAO" %>
<%@page import="com.windy.vo.Product" %>
<%@page import="java.text.DecimalFormat" %>
<%@page import="java.util.*" %>
<%
	List<Product> Blist = (List<Product>)request.getAttribute("Blist");
	DecimalFormat formatter = new DecimalFormat("###,###");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>a</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/shop_form.css">
<script type="text/javascript">
	$(function(){
		/*$("#menu9").hide();
		$("#menubtn9").mouseenter(function(){
			$("#menu9").stop().fadeIn();

		});
		$("#menu9").mouseleave(function(){
			$("#menu9").stop().fadeOut();	
		 });	
		$("#f li").hover(function(){
			$(this).css('color','rosybrown');
		},
		function(){
			$(this).css('color','black');
		});*/
		
		$(window).scroll(function(){
				var scr = $(document).scrollTop();
			if (scr>969&&scr<1926)
				{
					$("#mtb").removeClass("fix");
					$("#rb").addClass("fix");
					$(".left").css("margin-top","90px");
				}
			else if(scr>1926&&scr<2880){
				$("#hb").removeClass("fix");
				$("#mtb").addClass("fix");
				$(".left").css("margin-top","90px");
			}
			else if(scr>=2880){

				$("#hb").addClass("fix");
				$(".left").css("margin-top","90px");
			}

			else {
					$("#rb").removeClass("fix");
					$("#mtb").removeClass("fix");
					$("#hb").removeClass("fix");
					$(".left").css("margin-top","0");
				}
			});
			$(window).resize(function(){
				var width_size = window.outerWidth;
				if(width_size<=1800){
					$("#menu9").hide();
				}
				else{
					$("#menu9").show();
				}
			})
	});
	
	// 폰트 color:#866565;
	
</script>
<style type="text/css">
		
	body{
		background-image: url('img/asoggetti_f.jpg');
		background-repeat: no-repeat;

	}
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
<body>
	<jsp:include page="shop_form.jsp"/>
	<div class="wrap">
		<div id="pp"></div>
		<div class="sub_t" id="rb">Road Bike</div><div class="left">
		<%for(int i=0;i<Blist.size();i++) {
			if(Blist.get(i).getP_kind().equals("road")){
				
				out.println("<ul><a href='productDetail.b?p_code="+Blist.get(i).getP_code()+"'><li class='pic hvr-reveal'><img src="+Blist.get(i).getP_img()+"></li></a>");
					out.println("<li>"+Blist.get(i).getP_name()+"</li>");
					out.println("<li>"+Blist.get(i).getP_summary()+"</li>");
					out.println("<li>"+formatter.format(Blist.get(i).getP_price())+"</li></ul>");
			}}%>
			</div>
			<div class="sub_t" id="mtb">MTB</div><div class='left'>
			<%for(int i=0;i<Blist.size();i++) {
			if(Blist.get(i).getP_kind().equals("mtb")){
				out.println("<ul><a href='productDetail.b?p_code="+Blist.get(i).getP_code()+"'><li class='pic hvr-reveal'><img src="+Blist.get(i).getP_img()+"></li></a>");
					out.println("<li>"+Blist.get(i).getP_name()+"</li>");
					out.println("<li>"+Blist.get(i).getP_summary()+"</li>");
					out.println("<li>"+formatter.format(Blist.get(i).getP_price())+"</li></ul>");
			}}%>
			</div>
				
			<div class="sub_t" id="hb">Hybrid Bike</div><div class='left'>
			<%for(int i=0;i<Blist.size();i++) {
			if(Blist.get(i).getP_kind().equals("hy")){
				out.println("<ul><a href='productDetail.b?p_code="+Blist.get(i).getP_code()+"'><li class='pic hvr-reveal'><img src="+Blist.get(i).getP_img()+"></li></a>");
					out.println("<li>"+Blist.get(i).getP_name()+"</li>");
					out.println("<li>"+Blist.get(i).getP_summary()+"</li>");
					out.println("<li>"+formatter.format(Blist.get(i).getP_price())+"</li></ul>");
			}}%>
			</div>
	</div>
</body>
</html>