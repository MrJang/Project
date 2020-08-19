<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href = "../shop.css" type="text/css" rel = "stylesheet">

<title>Insert title here</title>
<script src="../jquery-1.11.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var currentPosition = parseInt($("#slidemenu").css("top"));
		$(window).scroll(function() {
			var position = $(window).scrollTop();
			$("#slidemenu").stop().animate({"top":position+currentPosition+"px"},1000);
			
		});
	});
	$(document).ready(function(){
		var currentPosition = parseInt($("#slidemenu").css("top"));
		$(window).scroll(function() {
			var position = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다.
			$("#slidemenu").stop().animate({"top":position+currentPosition+"px"},500);
		});
	});


</script>

</head>
<body>
<div id="slidemenu">
			<div id="top1" title="장바구니"  onclick="window.location='cart_list?pageNum=1&category_num=5'"><img src="resources/shop_image/cart_list_button.jpg" class="cart_sub_image"></div>
			<div id="top1" title="구매목록"  onclick="window.location='customer_purchase_list?pageNum=1&category_num=6'"><img src="resources/shop_image/purchase_story.jpg" class="purchase_list_sub_image"></div>	
</div>
<center>
<table width = "1200px">
	<tr>
		<td width = "100%" height = "20px" style = "background:"></td>
	</tr>
</table>
	<table width = "1200px"  border = "0" align = "center" style = "border : 0px; ">
		<tr>
			<td width = "100%" align = "center">
				<tiles:insertAttribute name="logo"/>
			</td>
		</tr>
	</table>
	<table width = "1200px">
	<tr>
		<td width = "100%" height = "20px" style = "background:"></td>
	</tr>
	</table>
	<div style = "width : 100%; background: black;">
		<tiles:insertAttribute name="menuForm"/>
	</div>
	</center>
	<div class="content">
		<div id="sub_menu">
				<tiles:insertAttribute name="sub_menu"/>
		</div>
		<div class="content_body">
				<tiles:insertAttribute name="body"/>
		</div>
	</div>

</body>
</html>