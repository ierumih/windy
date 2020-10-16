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
</head>
<style>
	.wrap{
		position: relative;
		width: 100%;
	}
	.pic{
		width: 100%;
		height: 700px;
	}
	.pic_detail{
		position: absolute;
		z-index: 1;
	}
	.pic_detail img{
		width: 100vmax;
		max-height: 550px;
	}
	.head_tag{
		margin: 0 auto;
		padding-bottom: 10px;
		width: 1080px;
		text-align: left;
		font-size: 15pt;
		font-weight: bold;
		border-bottom: 1px solid black;
	}
	.font{
		text-align: center;
		font-weight: bold;
		z-index: 10;
		position: absolute;
		color: red;
		line-height: 550px;
		width: 100vmax;
		font-family: 'Playfair Display', serif;
		font-size: 42pt;
	}
	.brand_grid{
		width: 1080px;
		margin: 20px auto 0 auto;
		position: relative;
	}
	.brand_cell{
		min-width: 350px;
		max-height: 130px;
		text-align: center;
		vertical-align: middle;
		border: 1px solid #ddd;
	}
	.brand_cell img{
		max-width: 350px;
	}
	.brand_cell2{
		min-width: 350px;
		max-height: 130px;
		text-align: center;
		vertical-align: middle;
		border: 1px solid #ddd;
		height:130px;
	}
	.brand_cell2 img{
		max-width: 350px;
	}
</style>
<body>
	
	<header>
		<jsp:include page="header2.jsp"/>
	</header>
	<main class="wrap">
		<div class="pic">
			<div class="font">ROAD</div>
			<div class="pic_detail"><img src="img/road21.jpg"></div>
		</div>
		
		<div class="head_tag">
			브랜드별 모아보기
		</div>
		<article>
			<div>
				<table class="brand_grid">
					<tr>
						<td class="brand_cell"><a href="brandselect.b?bike_brand=special_road"><img src="img/brand/brand_specialized.jpg"></a></td>
						<td class="brand_cell"><a href="brandselect.b?bike_brand=giant_road"><img src="img/brand/brand_giant.png"></a></td>
						<td class="brand_cell"><a href="brandselect.b?bike_brand=trek_road"><img src="img/brand/brand_trek.png"></a></td>
					</tr>
					<tr>
						<td class="brand_cell2"><a href="brandselect.b?bike_brand=merida_road"><img src="img/brand/brand_merida.png"></a></td>
					</tr>
				</table>
			</div>
		</article>
	</main>
	
	<hr style="clear:both;">
	<footer>
		<jsp:include page="footer2.jsp"/>
	</footer>
</body>
</html>