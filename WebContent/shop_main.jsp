<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>a</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		// $("#menu9").hide();
		$("#menubtn9").mouseenter(function(){
			$("#menu9").stop().fadeIn();

		});
		// $("#menu9").mouseleave(function(){
		// 	$("#menu9").stop().fadeOut();	
		// });	
		$("#f li").hover(function(){
			$(this).css('color','rosybrown');
		},
		function(){
			$(this).css('color','black');
		});
		$(window).scroll(function(){
				var scr = $(document).scrollTop();
			if (scr>1025)
				{
					$("#sub_t").addClass("fix");
				}
			else {
					$("#sub_t").removeClass("fix");
				}
			});

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
		width:290px;
		height:300px;
		padding-top: 5px;
	}
	.pic img{
		width: 270px;
		height: 270px;
		padding-top: 5px;
	}
	.left{
		clear:both;
		width:1000px;
		height:400px;
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
	#pname{
		padding-top: 30px;
		font-size: 15pt;
		border-bottom: 2px solid black;
	}
	.fix{
		position:fixed;
		top:-50px;
		text-align: center;
		clear: both;
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
	<jsp:include page="shop_form.html"/>
	<div class="wrap">
		<div id="pp"></div>
		<div id="sub_t">Road Bike</div>
		<div class="left">
				<div id="pname">
				</div>
				<div class="lookmore"></div>
				<ul>
					<li class="pic hvr-reveal"><img src="https://shopping-phinf.pstatic.net/main_2229978/22299787784.20200326150316.jpg?type=f300"></li>
					<li>스캇 에딕트 RC 프리미엄</li>
					<li>풀카본/시마노22단</li>
					<li>13,000,000원</li>
				</ul>
				<ul>
					<li class="pic hvr-reveal"><img src="https://shopping-phinf.pstatic.net/main_2091719/20917195413.20190920170242.jpg?type=f300"></li>
					<li>스페셜라이즈드 타막 디스크 콤프</li>
					<li>풀카본/시마노11단/디스크</li>
					<li>3,500,000원</li>
				</ul>
				<ul>
					<li class="pic hvr-reveal"><img src="https://shop-phinf.pstatic.net/20191127_208/1574837754379VfDLa_JPEG/c6d07129f9.jpg?type=m510"></li>
					<li>스페셜라이즈드 2020년 에스웍스 루베</li>
					<li>풀카본/스렘 레드 이텝12단/디스크</li>
					<li>12,500,000원</li>
				</ul>
			</div>
			<div class="left">
				<div id="pname"><b>H</b>ybrid <b>B</b>ike</div>
				<div class="lookmore">+더보기</div>
				<ul>
					<li class="pic hvr-reveal"><img src="https://shopping-phinf.pstatic.net/main_2079373/20793733770.20190902115538.jpg?type=f300"></li>
					<li>메리다 빅나인 XT 에디션</li>
					<li>알루미늄/시마노24단/디스크</li>
					<li>1,850,000원</li>
				</ul>
				<ul>
					<li class="pic hvr-reveal"><img src="https://shopping-phinf.pstatic.net/main_2081006/20810061502.20190904112019.jpg?type=f300"></li>
					<li>자이언트 XTC 3</li>
					<li>알루미늄/시마노30단/디스크</li>
					<li>800,000원</li>
				</ul>
				<ul>
					<li class="pic hvr-reveal"><img src="https://shopping-phinf.pstatic.net/main_2204986/22049860226.20200225165241.jpg?type=f300"></li>
					<li>알톤 샌드스톤 3.0D</li>
					<li>알루미늄/시마노24단/디스크</li>
					<li>454,000원</li>
				</ul>
			</div>
	</div>
</body>
</html>