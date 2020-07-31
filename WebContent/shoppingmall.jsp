<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html>
 <head>
  <meta charset="utf-8">
  <title>teamProject</title>
  <link rel="stylesheet" type="text/css" href="css/shop.css">	
 </head>
 <body>
 	<div id = "wrapper">
 	<header>
		<jsp:include page="header2.jsp"/>				
	</header>
	<script type="text/javascript">
		$(function(){
			$("#submenu").hide();
			$('.bxslider').bxSlider({
				auto: true,
				stopAutoOnClick: true,
				controls:false,
				pager:true
			});
			$('#findProduct').hide();
			$('#fp').on("click",function(){
				$('#findProduct').fadeIn();
			});
			$('#xb').on("click",function(){
				$('#findProduct').fadeOut();
			});
			$('#my-menu').tendina();
			$("#menu").mouseenter(function(){
			$("#submenu").stop().slideDown(400);
			});
			$("header").mouseleave(function(){
				$("#submenu").stop().slideUp(400);
			});
			
		});
	</script>
	<div id = "wrap">
		<nav>
			<div>
				<ul id="my-menu">
					<li><a href="#">자전거</a>
						<ul>
      						<li><a href="#">로드</a></li>
      						<li><a href="#">하이브리드</a></li>
      						<li><a href="#">MTB</a></li>
      						<li><a href="#">etc.</a></li>
      					</ul>
      				</li>
      				<li><a href="#">부수기재</a>
      					<ul>
      						<li><a href="#">고글</a></li>
      						<li><a href="#">헬멧</a></li>
      						<li><a href="#">속도계</a></li>
      						<li><a href="#">장갑</a></li>
      						<li><a href="#">신발</a></li>
      						<li><a href="#">etc.</a></li>
      					</ul>
      				</li>
      				<li><a href="#">관심물품</a></li>
      				<li><a href="#">장바구니</a></li>
      				<li><a href="#">가격비교</a></li>
				</ul>
				
			</div>

		</nav>
			<ul id="fp">
				<li>상품찾기</li>
			</ul>
				
		<div class="bxslider">
  			<div><img src="http://www.biclo.co.kr/data/editor/goods/200602/5e8d8e86f2f27bae1bd62e26face61f5_172332.jpg" /></div>
 			<div><img src=""></div>
 		</div>
			
		<main>
			
			<div style="float:left">
				<h2>NEW ProductList</h2>
			</div>
			<div id="findProduct">
				<div id="toplabel">
					<ul>
						<li>단수</li>
						<li>휠규격</li>
						<li>가격대</li>
						<li>프레임 소재</li>
						<li>사이즈</li>
						<li>브랜드</li>
					</ul>
				</div>
				<div id="checklabel">
					<ul style="padding-left:30px">
						<li><input type="checkbox" id="1"><label for="1">7단/8단</label></li>
						<li><input type="checkbox" id="2"><label for="2">21단</label></li>
						<li><input type="checkbox" id="3"><label for="3">24단</label></li>
						<li><input type="checkbox" id="4"><label for="4">27단</label></li>
					</ul>
					<ul style="padding-left:30px">
						<li><input type="checkbox" id="5"><label for="5">700C</label></li>
						<li><input type="checkbox" id="6"><label for="6">26인치</label></li>
						<li><input type="checkbox" id="7"><label for="7">24인치</label></li>
					</ul>
					<ul style="padding-left:25px">
						<li><input type="checkbox" id="8"><label for="8">10만원대</label></li>
						<li><input type="checkbox" id="9"><label for="9">20만원대</label> </li>
						<li><input type="checkbox" id="10"><label for="10">30만원대</label></li>
						<li><input type="checkbox" id="11"><label for="11">40만원대</label></li>
						<li><input type="checkbox" id="12"><label for="12">50만원 이상</label></li>
					</ul>
					<ul style="padding-left:20px">
						<li><input type="checkbox" id="13"><label for="13">하이텐스틸</label></li>
						<li><input type="checkbox" id="14"><label for="14">크로몰리</label></li>
						<li><input type="checkbox" id="15"><label for="15">알루미늄</label></li>
						<li><input type="checkbox" id="16"><label for="16">카본</label></li>
					</ul>
					<ul style="text-align: center">
						<li><input type="checkbox" id="17"><label for="17">440 (150이상)</label></li>
						<li><input type="checkbox" id="18"><label for="18">470 (160이상)</label></li>
						<li><input type="checkbox" id="19"><label for="19">490 (165이상)</label></li>
						<li><input type="checkbox" id="20"><label for="20">510 (170이상)</label></li>
						<li><input type="checkbox" id="21"><label for="21">530 (175이상)</label></li>
						<li><input type="checkbox" id="22"><label for="22">550 (180이상)</label></li>
						<li><input type="checkbox" id="23"><label for="23">570 (185이상)</label></li>
					</ul>
					<ul style="padding-left:10px">
						<li><input type="checkbox" id="24"><label for="24">도마스</label></li>
						<li><input type="checkbox" id="25"><label for="25">자이언트</label></li>
						<li><input type="checkbox" id="26"><label for="26">메리다</label></li>
						<li><input type="checkbox" id="27"><label for="27">후지</label></li>
						<li><input type="checkbox" id="28"><label for="28">삼천리</label></li>
						<li><input type="checkbox" id="29"><label for="29">벨로라인</label></li>
						<li><input type="checkbox" id="30"><label for="30">바이큰</label></li>
						<li><input type="checkbox" id="31"><label for="31">알톤</label></li>
						<li><input type="checkbox" id="32"><label for="32">스마트</label></li>
						<li><input type="checkbox" id="33"><label for="33">뮤트</label></li>
						<li><input type="checkbox" id="34"><label for="34">엔진11</label></li>
						<li><input type="checkbox" id="35"><label for="35">첼로</label></li>
						<li><input type="checkbox" id="36"><label for="36">스타카토</label></li>
						<li><input type="checkbox" id="37"><label for="37">아메키란이글</label></li>
						<li><input type="checkbox" id="38"><label for="38">루트코리아</label></li>
					</ul>
				</div>
				<div style="width: 1060px">
					<button type="button" class="btn btn-info">상품찾기</button>
					<div id="xb">&times;</div>
				</div>
				
			</div>
			<div id="resort">
			
			</div>
			<div class="left">
				<div id="pname"><b>R</b>oad <b>B</b>ike</div>
				<div class="lookmore">+더보기</div>
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
			<div class="left">
				<div id="pname"><b>M</b>ountain <b>T</b>errain <b>B</b>ike</div>
				<div class="lookmore">+더보기</div>
				<ul>
					<li class="pic hvr-reveal"><img src="https://shopping-phinf.pstatic.net/main_2112524/21125243678.20191231183431.jpg?type=f300"><div id="ww"></div></li>
					<li>알톤 썸탈</li>
					<li>알루미늄/시마노24단</li>
					<li>300,000원</li>
				</ul>
				<ul>
					<li class="pic hvr-reveal"><img src="https://shopping-phinf.pstatic.net/main_2202361/22023612874.20200221155058.jpg?type=f300"></li>
					<li>스페셜라이즈드 멘즈 시러스</li>
					<li>풀카본/시마노22단</li>
					<li>450,000원</li>
				</ul>
				<ul>
					<li class="pic hvr-reveal"><img src="https://shopping-phinf.pstatic.net/main_2202379/22023798095.20200221160900.jpg?type=f300"></li>
					<li>삼천리자전거 레스포 토러스 21</li>
					<li>알루미늄/시마노21단</li>
					<li>270,000원</li>
				</ul>
			</div>
			<table>
				<tr>
					<td><</td>
					<td>1</td>
					<td>2</td>
					<td>3</td>
					<td>4</td>
					<td>></td>
				</tr>
			</table>
		</main>
		</div>
	</div>
	<footer>
		<jsp:include page = "footer2.jsp"/>
	</footer>
	</body>
</html>
