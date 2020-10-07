<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<title>windy</title>
	  <link rel="shortcut icon" type="image⁄x-icon" href="img/qwer.jpg">
	  <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	  <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	  <!--tap bar slide-->
	  <script src="tendina-master/dist/tendina.js"></script>
	  <!--font-->
	  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap"  rel="stylesheet">
	  <link href="https://fonts.googleapis.com/css2?family=Rowdies:wght@300&display=swap" rel="stylesheet">  <!--font-->
	  <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
	  <!-- FONT -->
	  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600&display=swap" rel="stylesheet">
</head>
<style>
	.wrap{
		position: relative;
		width: 100%;
		
	}
	.box{
		margin-top: 50px;
		background-color: linear-gradient(90deg, skyblue,violet);
	}
	.box tr td img{
		height: 550px;
		/*width: 100vmax;*/
		width: 1600px;
		margin-bottom: 10px;
	}
	.road{
		visibility: hidden;
		text-align: center;
		font-size: 20pt;
		z-index: 10;
		position: absolute;
		color: red;
		line-height: 550px;
		width: 1600px;
		font-family: 'Playfair Display', serif;
		font-size: 42pt;
		cursor: pointer;
	}
	.mtb{
		visibility: hidden;
		text-align: center;
		font-size: 20pt;
		z-index: 10;
		position: absolute;
		color: red;
		line-height: 550px;
		width: 1600px;
		font-family: 'Playfair Display', serif;
		font-size: 42pt;
		cursor: pointer;
	}
	.hybrid{
		visibility: hidden;
		text-align: center;
		font-size: 20pt;
		z-index: 10;
		position: absolute;
		color: red;
		line-height: 550px;
		width: 1600px;
		font-family: 'Playfair Display', serif;
		font-size: 42pt;
		cursor: pointer;
	}
	.etc{
		visibility: hidden;
		text-align: center;
		font-size: 20pt;
		z-index: 10;
		position: absolute;
		color: red;
		line-height: 550px;
		width: 1600px;
		font-family: 'Playfair Display', serif;
		font-size: 42pt;
		cursor: pointer;
	}
</style>
<script>
	$(document).ready(function () {
		$('#1').hover(function(){
			$('#road').attr("src","img/road23.jpg")
			$('.road').css("visibility","visible")
		},function(){
			$('#road').attr("src","img/road231.jpg")
			$('.road').css("visibility","hidden")
		});

		$('#2').hover(function(){
			$('#mtb').attr("src","img/mtb12.jpg")
			$('.mtb').css("visibility","visible")
		},function(){
			$('#mtb').attr("src","img/mtb121.jpg")
			$('.mtb').css("visibility","hidden")
		});

		$('#3').hover(function(){
			$('#hyb').attr("src","img/hyb11.jpg")
			$('.hybrid').css("visibility","visible")
		},function(){
			$('#hyb').attr("src","img/hyb111.jpg")
			$('.hybrid').css("visibility","hidden")
		});

		$('#4').hover(function(){
			$('#etc').attr("src","img/etc.jpg")
			$('.etc').css("visibility","visible")
		},function(){
			$('#etc').attr("src","img/etc1.jpg")
			$('.etc').css("visibility","hidden")
		});
		$('#1').click(function(){
			$(location).attr("href","bike_brand_road.jsp");
		});
		$('#2').click(function(){
			$(location).attr("href","bike_brand_mtb.jsp");
		});
		$('#3').click(function(){
			$(location).attr("href","bike_brand_hyb.jsp");
		});
		$('#4').click(function(){
			$(location).attr("href","bike_brand_other.jsp");
		});
	});
</script>
<body>
	
	<header>
		<jsp:include page="header2.jsp"/>
	</header>

	<div class="wrap">
		<table  class="box">
			<tr>
				<td id="1">
					<div class="road">ROAD</div>
					<img src="img/road231.jpg" id="road">
				</td>
			</tr>
			<tr>
				<td id="2">
					<div class="mtb">MTB</div>
					<img src="img/mtb121.jpg" id="mtb">
				</td>
			</tr>
			<tr>
				<td id="3">
					<div class="hybrid">CITY BIKE</div>
					<img src="img/hyb111.jpg" id="hyb">
				</td>
			</tr>
			<tr>
				<td id="4">
					<div class="etc">OTHER</div>
					<img src="img/etc1.jpg" id="etc">
				</td>
			</tr>
		</table>
	</div>
	
	<hr style="clear:both;">
	<footer>
		<jsp:include page="footer2.jsp"/>
	</footer>
</body>
</html>