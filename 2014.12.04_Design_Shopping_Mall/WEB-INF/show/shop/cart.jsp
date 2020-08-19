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
		<div id="cart_list_title"><img src="resources/shop_image/cart_title_img.png"></div>
		<div id="cart_list_content">
		<c:choose>
		<c:when test="${list_exist=='yes'}">
		<c:forEach var="cart" items="${cart_list}" begin="${start_row_num}" end="${start_row_num+4}">	
		<div class="cart_list_wrap">
		<div class="cart_list_img">
			<img src = '../shop_item/${cart.pro_img}' id= 'img'  width = '100px' height = '100px'>
		
		</div>
		 <div class="cart_list_item_wrap">
			<div class="product_list_name">상품 이름: ${cart.pro_name}</div>
			<div class="product_list_price">상품 가격: ${cart.pro_price} 원</div>
		</div>	
			<div class="cart_button_wrap">
				<div class="product_purchase_button" onClick="window.location='product_purchase?pro_num=${cart.pro_num}&pageNum=${pageNum}&category_num=${category_num}'">구매하기</div>
				<div class="delete_button" onClick="window.location='cart_delete?cart_num=${cart.cart_num}&category_num=${category_num}'">삭제</div>
			</div>				
		 </div>
		 </c:forEach>
		 </c:when>
		 <c:otherwise>
		  	<center>장바구니에 등록된 상품이 없습니다.</center>
		 </c:otherwise>
		 </c:choose>
		</div>
		<div class="page_num">
		<c:choose>
		<c:when test="${list_exist=='yes'}">			
		<a href='#' onClick="window.location='cart_list?pageNum=${start_pageNum}&category_num=${category_num}'"><img src="resources/shop_image/start_page_img.png" style="float:left;"></a>
		<c:forEach var="page_list" items="${page_list}">
		<a class="page_num_wrap"  onClick="window.location='cart_list?pageNum=${page_list}&category_num=${category_num}'">	
			${page_list}
		</a>	
		</c:forEach>
		<a href='#' onClick="window.location='cart_list?pageNum=${end_pageNum}&category_num=${category_num}'"><img src="resources/shop_image/end_page_img.png" style="float:left;"></a>
		</c:when>
		</c:choose>		
		</div>
		
</body>
</html>