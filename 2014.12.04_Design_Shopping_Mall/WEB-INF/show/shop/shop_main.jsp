<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>   
<%@taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	
			<div id='shop_title'>
				<img src='resources/shop_image/shop_main_title.png'>
			</div>
			<div id="best_product">
				<div id="best_product_title"><img src='resources/shop_image/best_list_image.png' width="60px;" height="40px;"><img src='resources/shop_image/best_product_title.png'></div>
				<div id="best_product_list"><!-- 4개씩 최신순으로 -->
					<c:forEach var="product" items="${list_best}" begin="0" end="3">
					<div class="shop_item" onclick="window.location = 'product_view?pro_num=${product.pro_num}&pageNum=1&category_num=${product.pro_category}'">
				
						<img src = '../shop_item/${product.pro_img}' id= 'img'  width = '150px' height = '100px'>
					
				
					<div class="itemName">${product.pro_name}</div>
				</div>
				</c:forEach>	
				
				
					
				</div>
			</div>
			<div id="new_product1">
				<div id="new_product_title1"><img src='resources/shop_image/top_list_image.png' width="60px;" height="40px;"><img src='resources/shop_image/new_product1_title.png'><a class="more_button" onClick = "window.location = 'top_product?&pageNum=1&category_num=1'">More</a></div>
				<div id="new_product1_list">
				<c:forEach var="product" items="${list1}" begin="0" end="3">
					<div class="shop_item" onclick="window.location = 'product_view?pro_num=${product.pro_num}&pageNum=1&category_num=${product.pro_category}'">
					<img src = '../shop_item/${product.pro_img}' id= 'img'  width = '150px' height = '100px'>
					<div class="itemName">${product.pro_name}</div>
				</div>
				</c:forEach>	
				</div>
			</div>
			<div id="new_product2">
				<div id="new_product_title2"><img src='resources/shop_image/bottoms_list_image.png' width="60px;" height="40px;"><img src='resources/shop_image/new_product2_title.png'><a class="more_button" onClick = "window.location = 'bottoms_product?&pageNum=1&category_num=2'">More</a></div>
				<div id="new_product2_list">
					<c:forEach var="product" items="${list2}" begin="0" end="3">
						<div class="shop_item" onclick="window.location = 'product_view?pro_num=${product.pro_num}&pageNum=1&category_num=${product.pro_category}'">
					<img src = '../shop_item/${product.pro_img}' id= 'img'  width = '150px' height = '100px'>
					<div class="itemName">${product.pro_name}</div>
					</div>
					</c:forEach>
				</div>
			</div>
			<div id="new_product3">
				<div id="new_product_title3"><img src='resources/shop_image/accessory_list_image.png' width="60px;" height="40px;"><img src='resources/shop_image/new_product3_title.png' ><a class="more_button" onClick = "window.location = 'accessory_product?&pageNum=1&category_num=3'">More</a></div>
				<div id="new_product3_list">
					<c:forEach var="product" items="${list3}" begin="0" end="3">
						<div class="shop_item" onclick="window.location = 'product_view?pro_num=${product.pro_num}&pageNum=1&category_num=${product.pro_category}'">
					<img src = '../shop_item/${product.pro_img}' id= 'img'  width = '150px' height = '100px'>
					<div class="itemName">${product.pro_name}</div>
					</div>
					</c:forEach>
				</div>
			</div>			
	
</body>
</html>