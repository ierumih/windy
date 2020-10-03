<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="com.windy.vo.Product" %>
<%@page import="com.windy.vo.P_review" %>
<%@page import="java.util.*" %>
<%@page import="java.text.DecimalFormat" %>
<%
	Product detail = (Product)request.getAttribute("detail");
	List<Product> option = (List<Product>)request.getAttribute("option");
	String id = (String)session.getAttribute("id");
	String nick = (String)session.getAttribute("nick");
	List<P_review> p_review = (List<P_review>)request.getAttribute("p_review");
	DecimalFormat aaa = new DecimalFormat("###,###");
	String [] dimg = detail.getP_detail().split(" "); 
	String [] mimg = detail.getP_img().split(" ");
	String [] man = detail.getP_name().split(" ");
	
	int pr_size = p_review.size();
	
	request.setAttribute("op_size", option.size());
	request.setAttribute("p_name", detail.getP_name());
	request.setAttribute("p_code", detail.getP_code());
	request.setAttribute("id", id);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>상품정보</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<style>
	#pic_det{
		width:600px;
		height:400px;
		float:left;
		border:1px solid #ececec;
		border-radius:10px;
		margin-top:50px;
	}
	#pic_det img{
		width:582px;
		height:386px;
		text-align:center;
		float:left;
		clear:both;
	}
	#obox{
		float:right;
		width:450px;
		min-height:380px;
		border:1px solid #ececec;
		margin-right:0;
		border-radius:10px;
		padding:10px;
		margin-top:50px;
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
		color:#ff5757;
		font-weight:bold;
		font-size:15pt;
	}
	.wrap{
		padding-left:100px;	
	}
	select { 
		width: 200px;
		font-family: inherit;
		border: 1px solid #999; 
		border-radius: 0px; 
	}
	#b_box{
		text-align: center;
	}
	#whis_b, #ord_b{
		font-size:16pt;
		font-weight:bold;
		width:210px;
		height:60px;
		background-color:#ffc88a;
		border-radius: 10px;
		border:1px solid #fff7ee;
		
	}
	#ord_b{
		margin-left:10px;
	}
	
	#pricebox{
		min-width:200px;
		height:70px;
		text-align: right;
	}
	#won{
		font-size:9pt;
		float:right;
		margin-top:17px;
		margin-right:7px;
	}
	#sumprice{
		font-size:20pt;
		color:#ff5757;
		font-weight:bold;
		float:right;
	}
	.card{
		widht:450px;
		height:70px;
		border:1px solid #e5e5e5;
	}
	#select_op{
		padding:10px 0 0 10px;
		font-size:12pt;
		font-weight:bold;
		
	}
	#count{
		margin:3px 0 0 10px;
	}
	#count input[type='text']{
		width:20px;
		height:17px;
		text-align:center;
		border:1px solid #b9b2b2;
		border-radius:0;
		
	}
	#count input[type='button']{
		width:18px;
		height:19px;
		border:1px solid #b9b2b2;
		border-radius:0;
		
	}
	.xb{
		float:right;
		font-size:20pt;
		padding-right:9px;
		height:30px;
		cursor:pointer;
	}
	.eachprice{
		float:right;
		font-weight:bold;
		padding-right:9px;
		margin-top:3px;
		
	}
	#p_menu{
		float:left;
		width:1080px;
		height:70px;
		font-size:17pt;
		font-weight:bold;
		margin-bottom:5px;
	}
	#p_menu tr td{
		width:360px;
		text-align:center;
		height:70px;
		background: #ececec;
		
	}
	#p_review{
		height:auto;
		margin-bottom:30px;
	}
	#p_review form{
		height:180px;
	}
	#write_b{
		font-size:14pt;
		font-weight:bold;
		width:100px;
		height:100px;
		margin-left:5px;
		background-color:#ffc88a;
		border-radius: 10px;
		border:1px solid #fff7ee;
	}
	.pr_list{
		margin-bottom:10px;
		cursor: pointer;
	}
	.pr_list li:nth-child(2){
		color:gray;
		font-size:10pt;
	}
	.pr_inner li{
		display:inline-block;
	}
	#pr_table{
		float:left;
	}
	.pr_content{
		display: none;
	}
	/*==========================
	별점
	============================*/
	.starR1{
	    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat -52px 0;
	    background-size: auto 100%;
	    width: 15px;
	    height: 30px;
	    float:left;
	    text-indent: -9999px;
	    cursor: pointer;
	}
	.starR2{
	    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
	    background-size: auto 100%;
	    width: 15px;
	    height: 30px;
	    float:left;
	    text-indent: -9999px;
	    cursor: pointer;
	}
	.starR1.on{background-position:0 0;}
	.starR2.on{background-position:-15px 0;}
	.starP .starR1{
		background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat -35px 0;
	    background-size: auto 100%;
	    width: 10px;
	    height: 20px;
	    float:left;
	    text-indent: -9999px;
	}
	.starP .starR2{
		background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
	    background-size: auto 100%;
	    width: 10px;
	    height: 20px;
	    float:left;
	    text-indent: -9999px;
	}
	.starP .starR1.on{background-position:0 0;}
	.starP .starR2.on{background-position:-10px 0;}
</style>
	<script type="text/javascript">
		function addComma(num) {
		  var regexp = /\B(?=(\d{3})+(?!\d))/g;
		  return num.toString().replace(regexp, ',');
		}
			$(function(){
			var results = 0;
			var result = <%=detail.getP_price()%>;
			var product_price = <%=detail.getP_price()%>;
			var sum = 0;
			var op_selected = new Array();

			var op_size = <%=option.size()%>;
			$("#sel_option").change(function(){
				var j = $("#sel_option option").index($("#sel_option option:selected"));
			    
				for(var i=0;i<op_selected.length;i++){
					if(op_selected[i]==j){
						alert("이미선택한 옵션입니다.");
						return;
					}
				}
			
			
				var option= $("#sel_option option:selected").val();
				if(option!=""){
					op_selected.push(j);
					sum += product_price;
					
					/*$("#optionbox").append("<div class='card'><div class='xb'>&times;</div><div id='select_op'>"+option+"</div><div class='eachprice'>"+
							"<span>&#92; </span><span id='ep'>"+addComma(product_price)+"</span></div><div id='count'><input type='button' value='-' class='bt_down'><input type='text' name='count"+i+"' value='1' class='num'>"+
							"<input type='button' value='+' class='bt_up'><input type='hidden' name='p_price' class='hidden_price' value='"+product_price+"'><input type='hidden' class='hidden_sum' value='"+sum+"'>"+
							"<input type='hidden' class='c_op' name='op"+i+"' value='"+option+"'></div></div>");*/
					$("#optionbox").append("<div class='card'><div class='xb'>&times;</div><div id='select_op'>"+option+"</div><div class='eachprice'>"+
							"<span>&#92; </span><span id='ep'>"+addComma(product_price)+"</span></div><div id='count'><input type='button' value='-' class='bt_down'><input type='text' name='count' value='1' class='num'>"+
							"<input type='button' value='+' class='bt_up'><input type='hidden' name='p_price' class='hidden_price' value='"+product_price+"'><input type='hidden' class='hidden_sum' value='"+sum+"'>"+
							"<input type='hidden' class='c_op' name='op' value='"+option+"'>"+
							"<input type='hidden' name='id' value='<%=id%>' ></div></div>");		
					$("#sumprice").text(addComma(sum));
					$(".hidden_sum").val(sum);
					//ord.op_count.value = op_selected.length;
					
				}

			});
			
			$(document).on("click",".bt_up",function(){ 
			  var n = $('.bt_up').index(this);
			  var num = $(".num:eq("+n+")").val();
			  num = $(".num:eq("+n+")").val(num*1+1);
			  result = product_price * num.val();
			  $(".eachprice:eq("+n+") #ep").text(addComma(result));
			  $(".hidden_price:eq("+n+")").val(result);
			  sum += product_price;
			  $("#sumprice").text(addComma(sum));
			  $(".hidden_sum").val(sum);
			  
			});
			
			$(document).on("click",".bt_down",function(){
			  var n = $('.bt_down').index(this);
			  var num = $(".num:eq("+n+")").val();
			  if(num>1){
				  num = $(".num:eq("+n+")").val(num*1-1);
				  result = product_price * num.val();
				  $(".eachprice:eq("+n+") #ep").text(addComma(result));
				  $(".hidden_price:eq("+n+")").val(result);
				  sum -= product_price;
				  $("#sumprice").text(addComma(sum));
				  $(".hidden_sum").val(sum);
			  }
			});
			
			$(document).on("click",".xb",function(){
				var n = $(".xb").index(this);
				var num = $(".num:eq("+n+")").val();
				sum = $(".hidden_sum").val();
				result = $(".hidden_price:eq("+n+")").val();
				sum -= result;
				$("#sumprice").text(addComma(sum));
				$(".hidden_sum").val(sum);
				op_selected.splice(n,1);
				$(this).parent().remove();
				for(var n=0;n<op_size;n++){
					$(".c_op:eq("+n+")").attr('name','op'+n);
					$(".num:eq("+n+")").attr('name','count'+n);
				}
			});
			/*
			============
			        별점주기
			============
			*/
			$('.starRev span').click(function(){
			  $(this).parent().children('span').removeClass('on');
			  $(this).addClass('on').prevAll('span').addClass('on');
			  var star_p = $(this).text();
			  cmt.star.value = star_p;
			  return false;
			});
			
			/*
			=============
				별점표시
			=============
			*/
			$('.starP').each(function(){
				var n = $('.starP').index(this);
				var ss = $('.starP #starscore:eq('+n+')').val();
				$('.starP:eq('+n+') span').each(function(){
					for(var i=0;i<10;i++){
						if($('.starP:eq('+n+') span:eq('+i+')').text()==ss){
							$('.starP:eq('+n+') span:eq('+i+')').addClass('on').prevAll('span').addClass('on');
						}
					}
				});
			});
			
			
			/*==============
			 마지막 리뷰 hr 제거
			==============*/
			$('.pr_list').each(function(){
				$('.pr_list').last().find('hr').hide();
			});
			
			/*==============
			본문 내용 클릭 시 노출
			==============*/
			//$('.pr_content').hide();
			
			$('.pr_list').click(function(){
				if($(this).children('.pr_content').css("display")=="none"){
					$(this).children('.pr_content').show();
				}else{
					$(this).children('.pr_content').hide();
				}
			});
			/*======================
			본문 내용 클릭 시 노출(동적 생성)
			======================*/
			$(document).on("click",".plist",function(){
				if($(this).children('.pr_content').css("display")=="none"){
					$(this).children('.pr_content').show();
				}else{
					$(this).children('.pr_content').hide();
				}
			});
			
			/*====================
				리뷰 ajax
			======================*/
			$('#write_b').on("click",function(){
				var title = $("#rev_title").val();
				var content = $("#rev_text").val();
				var star = $("#star").val();
				var nick = $("#nick").val();
				var code = $("#p_code").val();
				var id = "<%=id%>";
				if(id==null){
					alert("로그인을 먼저하세요");
				}else{
					$.ajax({
						url : 'p_review.jsp',
						data :{"title":title, "content":content, "star":star, "nick":nick, "code":code},
						datatype:'json',
						success : function(data){
							/*$('.pr_inner').append("<div class='pr_list plist'><hr color='#ececec' size='1'><ul><li><div class='starP'>"
									+"<span class='starR1'>0.5</span>"
									+"<span class='starR2'>1</span>"
									+"<span class='starR1'>1.5</span>"
									+"<span class='starR2'>2</span>"
									+"<span class='starR1'>2.5</span>"
									+"<span class='starR2'>3</span>"
									+"<span class='starR1'>3.5</span>"
									+"<span class='starR2'>4</span>"
									+"<span class='starR1'>4.5</span>"
									+"<span class='starR2'>5</span>"
									+"<input type='hidden' value='"+star+"' id='starscore'></div></li>"
									+"<li>"+nick+"</li>"
									+"<li>"+title+"</li></ul>"
									+"<div class='pr_content'>"+content+"</div></div>")*/
									window.location.reload();
						}
					})	
				}
			});
		});
		
		function cart(){
			document.ord.action = "productOrder.b?p_code=<%=detail.getP_code() %>&add=on";
			document.ord.submit();
		}
	</script>
</head>
<body>
	<div>
		<jsp:include page="shop_form.jsp"/>
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
					<td><%=aaa.format(detail.getP_price()) %></td>
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
					<th>옵션선택</th>
					<td><select name="b_option" id="sel_option">
						<option value="" selected>선택</option>
						<option value="">------------</option>
				<%for(int i=0;i<option.size();i++){ %>
					<%if(option.get(i).getP_stock()==0){ %>
						<option value="<%=option.get(i).getP_option()%>" disabled><%=option.get(i).getP_option()%> [품절]</option>
						<%}else{ %><option value="<%=option.get(i).getP_option()%>"><%=option.get(i).getP_option()%></option>
						
						<%} }%>
					</select></td>
				</tr>
			</table>
			<form name="ord" action="productOrder.b?p_code=<%=detail.getP_code() %>&add=" method="post">				
				<div id="optionbox">
					
					
					<!-- <input type="hidden" name="op_count" id="op_count" value=""> -->
				</div>
				
				<div id="pricebox"><div id="sumprice">0</div><div id="won">\</div></div>
				<div id="b_box"><input type="button" value="찜하기" id="whis_b" onclick="cart()"><input type="submit" value="주문하기" id="ord_b"
				<%if(id==null){ %> onclick="return lo()"<%} %>></div>
				</form>
			</div>
			<div id="thumbimg">
				<%for(int i=0;i<mimg.length;i++){ %>
					<img src="<%=mimg[i] %>">
				<%} %>
			</div>
			<div id="p_menu">
			<table border="0">
				<tr>
					<td>상세정보</td>
					<td><a href="#p_review">구매후기</a></td>
					<td>문의사항</td>
				</tr>
			</table>
			</div>
			<%for(int i=0;i<dimg.length;i++) {%>
			<div id="depic"><img src="<%=dimg[i]%>"/></div>
			<%} %>
		<div id="p_review">
		  <br/>
			<h2>구매후기(<%=pr_size %>)</h2>
			<hr/>
			<div class="pr_inner"><%if(pr_size==0){ %>
				<%="리뷰가 없습니다." %>
				<%}else{ %>
				<%for(int i=0;i<p_review.size();i++){ %>
				<div class="pr_list">
					<ul>
						<li>
							<div class="starP">
								  <span class="starR1">0.5</span>
								  <span class="starR2">1</span>
								  <span class="starR1">1.5</span>
								  <span class="starR2">2</span>
								  <span class="starR1">2.5</span>
								  <span class="starR2">3</span>
								  <span class="starR1">3.5</span>
								  <span class="starR2">4</span>
								  <span class="starR1">4.5</span>
								  <span class="starR2">5</span>
								  <input type="hidden" value=<%=p_review.get(i).getPr_star() %> id="starscore">
							</div>
						</li>
						<li><%=p_review.get(i).getNick() %></li>
						<li><%=p_review.get(i).getPr_title() %></li>
					</ul>
					<div class="pr_content"><%=p_review.get(i).getPr_text() %></div>
					<hr color="#ececec" size="1">
				</div>
				<%} }%>
				
			</div>
			<hr/>
				 <form name="cmt" action="productReview.b" >
					<table border="0" id='pr_table'>
						<tr>
							<td></td>
							<td colspan="2">
								<div class="starRev">
								  <span class="starR1 on">0.5</span>
								  <span class="starR2">1</span>
								  <span class="starR1">1.5</span>
								  <span class="starR2">2</span>
								  <span class="starR1">2.5</span>
								  <span class="starR2">3</span>
								  <span class="starR1">3.5</span>
								  <span class="starR2">4</span>
								  <span class="starR1">4.5</span>
								  <span class="starR2">5</span>
								  <input type="hidden" id="star" name="star" value="0.5">
								  <input type="hidden" id="nick" name="nick" value=<%=nick %>>
								  <input type="hidden" id="p_code" name="p_code" value=<%=detail.getP_code() %>>
								</div>
							</td>
						</tr>
						<script>
						$(function(){
							$('#rev_title').keyup(function(){
								var length = $(this).val().length;
								$('#rev_title + span').text(length);
							});
						});
						</script>
						<tr>
							<td style="width:100px;padding-left:40px;">한줄평</td>
							<td colspan="2"><input type="text" id="rev_title" name="rev_title" size="60" maxlength="30" placeholder="30글자까지 입력가능"><span> 0</span>/30</td>
						</tr>
						<tr>
							<td style="width:100px;padding-left:40px;">내용</td>
							<td><textarea id="rev_text" rows="8" cols="120" style="resize:none;" name="rev_text"></textarea></td>
							<td><input type="button" value="작성" id="write_b" ></td>
						</tr>
					</table>
				</form>
			
		</div>
	</div>
	<footer>
		<jsp:include page="footer2.jsp"/>
	</footer>
	
</body>
</html>