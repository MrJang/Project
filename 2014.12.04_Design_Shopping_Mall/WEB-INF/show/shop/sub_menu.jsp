<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function menu_over(event){
		
		if( $(event).attr('class')=='sub_menu1')
		  event.setAttribute('src', 'resources/shop_image/shop_home_menu_black.png');
		if($(event).attr('class')=='sub_menu2_1')
			event.setAttribute('src', 'resources/shop_image/sub_menu2_1_black.png');
		if($(event).attr('class')=='sub_menu2_2')
			event.setAttribute('src', 'resources/shop_image/sub_menu2_2_black.png');
		if($(event).attr('class')=='sub_menu2_3')
			event.setAttribute('src', 'resources/shop_image/sub_menu2_3_black.png');
		if($(event).attr('class')=='sub_menu2_4')
			event.setAttribute('src', 'resources/shop_image/sub_menu2_4_black.png');
			
	}
	function menu_out(event){
		if( $(event).attr('class')=='sub_menu1')
		  event.setAttribute('src', 'resources/shop_image/shop_home_menu.png');
		if( $(event).attr('class')=='sub_menu2_1')
			  event.setAttribute('src', 'resources/shop_image/sub_menu2_1.png');
		if( $(event).attr('class')=='sub_menu2_2')
			  event.setAttribute('src', 'resources/shop_image/sub_menu2_2.png');
		if( $(event).attr('class')=='sub_menu2_3')
			  event.setAttribute('src', 'resources/shop_image/sub_menu2_3.png');
		if( $(event).attr('class')=='sub_menu2_4')
			  event.setAttribute('src', 'resources/shop_image/sub_menu2_4.png');
	}

	
</script>
</head>
<body>
	
			<div>
				<img  src="resources/shop_image/sub_title_image.png" style="margin-left:40px;" >
			</div>
			<div>
				<img class='sub_menu1' src="resources/shop_image/shop_home_menu.png" style="margin-left:50px;" onmouseover="menu_over(this)" onmouseout="menu_out(this)"
				onClick = "window.location = 'shop_main'">
			</div>
			<div>
				<img src="resources/shop_image/sub_menu2.png" style="margin-left:50px;" >
			</div>
		
			<div>
				<img class='sub_menu2_1' src="resources/shop_image/sub_menu2_1.png" style="margin-left:55px;" onmouseover="menu_over(this)" onmouseout="menu_out(this)"
				onClick = "window.location = 'top_product?pageNum=1&category_num=1'">
			</div>
			<div>
				<img class='sub_menu2_2' src="resources/shop_image/sub_menu2_2.png" style="margin-left:55px;" onmouseover="menu_over(this)" onmouseout="menu_out(this)"
				onClick = "window.location = 'bottoms_product?pageNum=1&category_num=2'">
			</div>
		
			<div>
				<img class='sub_menu2_3' src="resources/shop_image/sub_menu2_3.png" style="margin-left:55px;" onmouseover="menu_over(this)" onmouseout="menu_out(this)"
				onClick = "window.location = 'accessory_product?pageNum=1&category_num=3'">
			</div>
		
			<div>
				<img class='sub_menu2_4' src="resources/shop_image/sub_menu2_4.png" style="margin-left:46px;" onmouseover="menu_over(this)" onmouseout="menu_out(this)"
				onClick = "window.location = 'others?pageNum=1&category_num=4'">
			</div>
		
		
	
</body>
</html>