<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Tour</title>
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
			min-height:1000px;
		}
	
	
	

		#mapwrap{
			width:1080px;
			height:900px;
			position:relative;
		}
		#courset{
			width:710px;
			height:900px;
			position:absolute;
			top:0;
			left:0;
			z-index:200;
		}
		#course{
			width:710px;
			height:900px;
			position:absolute;
			top:0;
			left:0;
			z-index:100;
		}
		#courset img{
			position:absolute;
			top:0;
			left:0;
		}
		#course img{
			position:absolute;
			top:0;
			left:0;
		}
		#explain{
			width:370px;
			height:900px;
			position:absolute;
			right:0;
		}
		#explaint{
			width:370px;
			height:100px;
			position:relative;
			font-size:20pt;
			line-height:100px;
			font-weight:bold;
		}
		#explainb{
			position:relative;
		}
		.preview{
			height:80px;
			position:relative;
			margin-top:15px;
			margin-bot:15px;
		}
		.previewl{
			position:absolute;
			width:100px;
			height:80px;
			left:0;
		}
		.previewr{
			position:absolute;
			font-weight:600;
			width:260px;
			height:80px;
			right:0;
		}
		.previewrt{
			position:relative;
			height:40px;
			font-size:15pt;
			line-height:40px;
			font-weight:600;
		}
		.previewrb{
			position:relative;
			height:40px;
			line-height:40px;
			font-size:12pt;
		}
		
	</style>
</head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script>
		$(document).ready(function() {
			$('#course img').hide();
			$('#image-map area').mouseenter(function() {
				var id = $(this).attr('id');
				$('#i'+id).show();
				$('#national').stop().animate({opacity:"0"}, 0);
			});
			$('#image-map area').mouseleave(function() {
				var id = $(this).attr('id');
				$('#i'+id).hide();
				$('#national').stop().animate({opacity:"1"}, 0);
			});
			$('#image-map area').click(function(){
				var c_area = $(this).attr('id');
				var i = 0;
				var title = $(this).attr('title');
				$.ajax({
					url : "courselist.b",
					dataType:"json",
					type:"post",
					data : {'c_area' : c_area},
					success : function(req){
						$('#explaint').html(title+"의 추천 코스");
						$('#explainb').html("");
						for(i=0;i<req.length;i++){
							var img = req[i].c_img.split(',');
							$('#explainb').append("<a href = 'courseboardview.b?c_num="+req[i].c_num+"'><div class = 'preview'><div class = 'previewl'><img src = 'img/course/"+img[0]+"' width='100px' height='80px'></div><div class = 'previewr'><div class = 'previewrt'>"+req[i].c_name+"</div><div class = 'previewrb'>"+req[i].c_location+"</div></div></a>");
						}
					}	
				});
			});

		});
	</script>
<body>
	
 	<header>
		<jsp:include page="header2.jsp"/>
	</header>
	<div id = "wrapper">
		<div id = "mapwrap">
			<div id = "courset">
				<img src="img/map.png" id = "national" usemap="#image-map">
			</div>
			<div id = "course">
				<img src="img/mapgyeonggi.png" id = "igyeonggi">
				<img src="img/mapseoul.png" id = "iseoul">
				<img src="img/mapincheon.png" id = "iincheon">
				<img src="img/mapgangwon.png" id = "igangwon">
				<img src="img/mapchungnam.png" id = "ichungnam">
				<img src="img/mapchungbuk.png" id = "ichungbuk">
				<img src="img/mapsejong.png" id = "isejong">
				<img src="img/mapdaejeon.png" id = "idaejeon">
				<img src="img/mapgyeongbuk.png" id = "igyeongbuk">
				<img src="img/mapdaegu.png" id = "idaegu">
				<img src="img/mapulsan.png" id = "iulsan">
				<img src="img/mapjeonbuk.png" id = "ijeonbuk">
				<img src="img/mapgyeongnam.png" id = "igyeongnam">
				<img src="img/mapbusan.png" id = "ibusan">
				<img src="img/mapjeonnam.png" id = "ijeonnam">
				<img src="img/mapgwangju.png" id = "igwangju">
				<img src="img/mapjeju.png" id = "ijeju">
			</div>
			
			<div id = "explain">
				<div id = "explaint">
				</div>
				<div id = "explainb">
				</div>
			</div>
			
			
			<map id = "image-map" name="image-map">
			    <area target="" title = "경기도" alt="gyeonggi" id="gyeonggi" coords="217,84,206,100,174,167,176,200,194,190,213,200,232,182,256,177,261,197,269,201,258,228,234,232,211,223,208,214,206,228,196,246,220,256,211,262,196,268,197,281,209,276,213,288,205,299,214,302,228,323,245,317,253,318,269,311,278,322,293,317,297,307,315,298,332,288,333,279,342,277,346,271,350,239,356,230,351,218,352,208,356,203,326,194,316,188,319,176,312,173,319,150,328,139,306,118,300,104,283,106,281,95,269,90,250,75,238,85" shape="poly">
			    <area target="" title = "서울특별시" alt="seoul" id="seoul" coords="207,202,217,214,228,222,238,221,248,223,260,216,264,208,254,207,253,190,243,184,238,193,228,191,229,200,218,205" shape="poly">
			    <area target="" title = "인천광역시" alt="incheon" id="incheon" coords="166,163,154,151,113,158,126,178,145,206,153,230,173,230,102,255,96,269,115,279,163,274,182,278,188,260,189,247,200,231,199,216,201,208,190,195,176,204,170,192" shape="poly">
			    <area target="" title = "강원도" alt="gangwon" id="gangwon" coords="261,65,260,72,267,74,270,85,287,83,289,100,305,97,310,114,324,121,334,142,327,156,323,173,326,188,364,200,368,206,358,217,362,230,356,263,354,274,361,277,376,274,377,264,391,260,398,269,414,259,442,264,438,275,451,276,457,282,476,281,488,288,500,297,505,286,522,292,531,285,545,289,555,284,572,293,577,285,592,275,590,264,593,259,580,247,574,234,568,231,562,220,556,207,553,198,544,192,543,175,526,162,441,8,434,10,428,43,400,62,374,60,360,65,354,59,322,62,318,67,302,62,284,65,277,61" shape="poly">
			    <area target="" title = "충청남도" alt="chungnam" id="chungnam" coords="267,319,247,325,241,324,223,331,213,340,204,316,179,309,167,297,114,326,101,349,114,373,125,373,165,471,180,481,192,494,213,489,225,473,249,468,257,480,288,471,302,488,311,490,317,498,320,487,332,490,332,476,325,475,330,464,318,454,305,461,300,454,294,461,287,461,276,445,279,421,270,410,270,392,260,384,256,362,266,358,283,364,287,355,301,352,291,343,284,332" shape="poly">
			    <area target="" title = "충청북도" alt="chungbuk" id="chungbuk" coords="435,269,422,265,415,270,396,276,389,266,383,272,380,281,359,283,354,279,344,284,337,283,333,296,325,302,315,303,302,312,303,320,286,326,295,340,306,348,304,357,290,361,288,374,285,380,295,387,301,394,299,401,304,406,315,404,321,414,328,416,319,437,318,447,326,451,332,460,331,472,338,475,340,483,349,483,359,490,371,488,382,481,386,469,384,460,393,456,393,448,386,448,379,443,371,445,365,439,371,432,367,419,370,401,365,389,357,385,369,375,383,358,397,360,394,351,410,338,418,339,422,333,433,329,443,339,452,336,454,324,483,296,478,291,469,290,451,290,446,282,430,285" shape="poly">
			    <area target="" title = "세종시" alt="sejong" id="sejong" coords="284,368,278,369,266,363,266,375,274,387,274,407,288,416,295,396,282,385,282,377" shape="poly">
			    <area target="" title = "대전광역시" alt="daejeon" id="daejeon" coords="283,424,280,440,290,458,296,448,305,444,305,454,312,450,312,442,319,424,315,420,311,412,303,412,297,406,293,418" shape="poly">
			    <area target="" title = "경상북도" alt="gyeongbuk" id="gyeongbuk" coords="594,280,581,286,578,296,566,298,558,289,550,294,530,292,528,298,511,294,504,302,489,300,479,303,460,326,461,336,445,348,435,339,424,336,425,342,419,348,413,344,400,353,406,361,398,366,392,361,381,368,386,376,383,383,374,381,368,383,377,403,375,423,376,434,371,439,383,439,390,443,400,443,406,459,393,464,391,473,391,482,377,489,382,505,376,514,387,521,393,519,396,525,414,525,427,550,422,558,442,559,453,566,446,553,458,548,451,540,454,530,462,527,451,524,449,515,459,506,466,504,471,510,471,500,477,495,488,489,504,488,511,509,514,518,505,523,498,549,486,551,481,549,476,556,485,568,505,571,515,571,523,562,535,557,542,561,549,558,557,558,559,545,571,541,587,546,591,555,598,550,612,553,629,488,619,498,604,493,600,482,605,473,598,447,599,421,605,416,609,391,606,380,605,367,608,357,610,345,602,329,603,305,605,294" shape="poly">
			    <area target="" title = "대구광역시" alt="daegu" id="daegu" coords="503,495,492,494,483,502,477,502,474,515,465,515,464,509,453,517,466,522,469,529,463,532,455,539,463,547,456,554,456,555,456,562,471,561,472,548,479,543,489,544,497,544,501,523,507,516" shape="poly">
			    <area target="" title = "울산광역시" alt="ulsan" id="ulsan" coords="553,565,564,562,566,553,577,549,587,560,598,559,609,560,614,587,602,614,594,620,593,608,583,606,583,599,569,598,561,584,547,578" shape="poly">
			    <area target="" title = "전라북도" alt="jeonbuk" id="jeonbuk" coords="370,510,375,505,371,495,358,495,345,489,338,487,335,497,324,492,323,500,308,500,305,494,300,495,293,479,282,477,279,482,266,483,256,487,246,475,228,473,221,488,175,503,182,508,189,517,210,512,214,520,199,526,206,533,202,541,187,538,183,547,162,561,162,570,156,602,166,612,171,623,184,618,198,608,197,599,211,590,230,602,243,596,249,599,250,621,256,623,267,617,282,621,290,625,301,615,323,617,328,623,335,618,333,610,338,605,342,601,335,598,338,590,332,584,329,575,336,568,332,557,338,553,339,540,345,533,350,524,365,520" shape="poly">
			    <area target="" title = "경상남도" alt="gyeongnam" id="gyeongnam" coords="373,517,367,523,351,526,344,539,342,552,336,559,340,568,332,575,337,584,340,592,341,600,346,604,339,612,337,626,332,631,339,637,339,648,345,654,350,665,361,677,361,690,374,741,396,742,421,746,501,737,502,725,509,720,513,706,532,682,522,667,515,653,524,648,531,638,541,637,556,625,564,624,565,612,576,609,576,602,569,603,556,587,544,585,541,578,548,572,547,566,541,570,534,564,528,567,521,572,501,574,493,572,483,573,476,565,463,566,456,570,450,572,446,566,431,565,416,558,420,551,412,532,395,532,388,527" shape="poly">
			    <area target="" title = "부산광역시" alt="busan" id="busan" coords="540,643,530,645,529,651,523,655,527,663,541,656,542,667,553,661,562,660,564,653,573,649,583,637,584,624,589,616,586,610,579,610,576,618,569,617,567,626,559,627" shape="poly">
			    <area target="" title = "전라남도" alt="jeonnam" id="jeonnam" coords="251,627,264,625,273,628,279,626,294,629,305,619,319,620,328,633,333,638,334,651,341,659,346,669,357,682,361,725,368,756,367,780,353,784,338,777,327,795,315,796,304,786,285,791,261,798,257,813,240,824,231,846,210,842,195,850,173,852,154,840,155,815,144,803,95,808,91,792,94,777,63,733,70,713,96,694,83,669,101,651,131,647,185,654,182,662,199,667,206,675,226,669,239,670,246,664,245,651,237,646,230,635,219,635,210,640,198,636,195,641,182,656,139,651,130,637,150,607,158,606,161,615,164,621,170,627,195,616,203,611,203,602,204,596,212,595,217,601,224,600,230,612,240,609,243,603,247,610" shape="poly">
			    <area target="" title = "광주광역시" alt="gwangju" id="gwangju" coords="199,640,198,646,192,648,190,654,190,662,204,664,211,670,225,664,232,667,240,663,239,652,233,649,230,641,221,639,211,646" shape="poly">
			    <area target="" title = "제주도" alt="jeju" id="jeju" coords="530,792,522,801,512,805,509,828,521,840,530,838,578,836,583,826,596,828,603,824,612,824,614,816,629,801,632,794,639,787,638,777,632,779,629,784,625,778,615,775,611,767,600,767,592,772,579,774,576,781,557,778" shape="poly">
			</map>
		</div>
		<footer>
			<jsp:include page="footer2.jsp"/>
		</footer>
	</div>

</body>
</html>