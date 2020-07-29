<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>WINDY</title>
</head>
	<meta charset="utf-8">
	<style>
		/*@font-face {
			font-family:Noto Sans CJK Regular;
			src:url(https://dl.dropboxusercontent.com/s/zkw6tapuv8oj6cn/NSKR400.woff);}
		*/
		*{
			margin:0 auto;
			padding:0;
			font-family: 'Nanum Gothic Coding', monospace;
		}
		header{
			position:relative;
			height:80px;
			background:white;
			background-position:center;
			top:0;
			margin:0 auto;
			left:0;
			right:0;
			z-index:999;
			width:100%;
			min-width:1080px;
		}
		#wrapper{
			position:relative;
			width:100%;
			top:0;
			left:0;
			overflow:hidden;
			
		}
		
		.fix{
			position:fixed;
			text-align:center;
			top:0;
		}
		
		
		div img{
			vertical-align:middle;
		}
		footer{
			position:relative;
			background-color:#5e5e5e;
			min-width:1080px;
			height:150px;
			margin:auto;
		}
		
		#wrap{
			position:relative;
			width:1080px;
			height:1200px;
			min-height:1000px;
		}
		.main_img{
			width: 100%;
			height: 100%;
		}
		
	</style>
	
	<script>
	  $(document).ready(function(){
		$('#tapbar').tendina({  
		});
		$('.slider').bxSlider({
	  	auto:true,
		pause:4000,
		controls:false,
		stopAutoOnClick:true,
		});
	  });
	</script>
<body>
	
 	<header>
		<jsp:include page="header2.jsp"/>
	</header>
	<div id = "wrapper">
		<div>
			<img src = "img/white_bike21.jpg" class="main_img">
		</div>
	
	
	<hr style="clear:both;">
		<footer>
			<jsp:include page="footer2.jsp"/>
		</footer>
	</div>

</body>
</html>