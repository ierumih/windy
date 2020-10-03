<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.windy.dao.DAO" %>
<%@page import="com.windy.vo.Product" %>
<%@page import="java.text.DecimalFormat" %>
<%@page import="java.util.*" %>
<%
	List<Product> Rlist = (List<Product>)request.getAttribute("Rlist");
	List<Product> Mlist = (List<Product>)request.getAttribute("Mlist");
	List<Product> Hlist = (List<Product>)request.getAttribute("Hlist");
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
			else if(scr>2880){
				$("#mtb").removeClass("fix");
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
			<div class="sub_t" id="rb">Best Road</div><div class="left">
		<%for(int i=0;i<Rlist.size();i++) {
				out.println("<ul><a href='productDetail.b?p_code="+Rlist.get(i).getP_code()+"'><li class='pic hvr-reveal'><img src="+Rlist.get(i).getP_img()+"></li></a>");
					out.println("<li>"+Rlist.get(i).getP_name()+"</li>");
					out.println("<li>"+Rlist.get(i).getP_summary()+"</li>");
					out.println("<li>"+formatter.format(Rlist.get(i).getP_price())+"</li></ul>");
			}%>
			</div>
			<div class="sub_t" id="mtb">Best MTB</div><div class='left'>
			<%for(int i=0;i<Mlist.size();i++) {
			
				out.println("<ul><a href='productDetail.b?p_code="+Mlist.get(i).getP_code()+"'><li class='pic hvr-reveal'><img src="+Mlist.get(i).getP_img()+"></li></a>");
					out.println("<li>"+Mlist.get(i).getP_name()+"</li>");
					out.println("<li>"+Mlist.get(i).getP_summary()+"</li>");
					out.println("<li>"+formatter.format(Mlist.get(i).getP_price())+"</li></ul>");
			}%>
			</div>
				
			<div class="sub_t" id="hb">Best Hybrid</div><div class='left'>
			<%for(int i=0;i<Hlist.size();i++) {
				out.println("<ul><a href='productDetail.b?p_code="+Hlist.get(i).getP_code()+"'><li class='pic hvr-reveal'><img src="+Hlist.get(i).getP_img()+"></li></a>");
					out.println("<li>"+Hlist.get(i).getP_name()+"</li>");
					out.println("<li>"+Hlist.get(i).getP_summary()+"</li>");
					out.println("<li>"+formatter.format(Hlist.get(i).getP_price())+"</li></ul>");
			}%>
			</div>
	</div>
	<footer>
		<jsp:include page="footer2.jsp"/>
	</footer>
</body>
</html>