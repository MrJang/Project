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

	<div class="product_list">
		<div class="product_list_title"><img src="resources/shop_image/top_list_title.png"></div>	
		<div class="product_list_search_bar">
		<form name="search_form" method="post" action="select_product?pageNum=1&category_num=1">
			<div class="search_bar_title">검색</div>
			<div class="search_category">
			<select name="search_category">
				<option value="pro_name">상품 이름</option>
				<option value="pro_price" >상품 가격</option>
			</select>
			</div>
			<div class="search_content">
				<input type="text" name='search_content'/>
			</div>
			<input type=submit class="search_button" value="검색"/>
		</form>
		</div>
		<div class="product_list_content">
		<c:choose>
		<c:when test="${list_exist=='yes'}">
		<c:forEach var="product" items="${top_list}" begin="${start_row_num}" end="${start_row_num+7}">
			<div class='list_item_frame'>
				<c:choose>
				<c:when test="${mode=='select'}">
				<div class='product_list_image' onClick = "window.location = 'select_product_view?pageNum=${pageNum}&pro_num=${product.pro_num}&category_num=${category_num}&search_category=${search_category}&search_content=${search_content}&mode=${mode}'" >	
				
					<img src = "../shop_item/${product.pro_img}" width = "180px" height="160px" alt = "X">						
			
				</div>
				<div class='product_list_wrap'>
					<div class="product_list_name" onClick = "window.location = 'select_product_view?pageNum=${pageNum}&pro_num=${product.pro_num}&category_num=${category_num}&search_category=${search_category}&search_content=${search_content}&mode=${mode}'">상품 이름: ${product.pro_name}</div>
					<div class="product_list_price" onClick = "window.location = 'select_product_view?pageNum=${pageNum}&pro_num=${product.pro_num}&category_num=${category_num}&search_category=${search_category}&search_content=${search_content}&mode=${mode}">상품 가격: ${product.pro_price} 원</div>
				</div>
				<div class="product_list_button_wrap">
					<div class="product_purchase_button" onClick="window.location='product_purchase?pro_num=${product.pro_num}&pageNum=${pageNum}&category_num=${category_num}'">구매하기</div>
					<div class="delete_button" onClick="window.location='cart_regist?pro_num=${product.pro_num}&category_num=5'">장바구니</div>
				</div>
				
				</c:when>
				<c:otherwise>
				<div class='product_list_image' onClick = "window.location = 'product_view?pageNum=${pageNum}&pro_num=${product.pro_num}&category_num=${category_num}'" >	
				<img src = "../shop_item/${product.pro_img}" width = "180px" height="160px" alt = "X">
				
				</div>
				<div class='product_list_wrap'>
					<div class="product_list_name" onClick = "window.location = 'product_view?pageNum=${pageNum}&pro_num=${product.pro_num}&category_num=${category_num}'">상품 이름: ${product.pro_name}</div>
					<div class="product_list_price" onClick = "window.location = 'product_view?pageNum=${pageNum}&pro_num=${product.pro_num}&category_num=${category_num}">상품 가격: ${product.pro_price} 원</div>
				</div>
				<div class="product_list_button_wrap">
					<div class="product_purchase_button" onClick="window.location='product_purchase?pro_num=${product.pro_num}&pageNum=${pageNum}&category_num=${category_num}'">구매하기</div>
					<div class="delete_button" onClick="window.location='cart_regist?pro_num=${product.pro_num}&category_num=5'">장바구니</div>
				</div>
				</c:otherwise>
				</c:choose>	
			</div>
		</c:forEach>
		</c:when>
		<c:otherwise>
			<center>등록된 제품이없습니다.</center>
		</c:otherwise>
		</c:choose>
		</div>
		<div class="page_num">
		<c:choose>
		<c:when test="${list_exist=='yes'}">
		 <c:choose>
		  <c:when test="${mode=='select'}">
		  	<a href='#' onClick="window.location='select_product?pageNum=${start_pageNum}&category_num=${category_num}&search_category=${search_category}&search_content=${search_content}&mode=${mode}'"><img src="resources/shop_image/start_page_img.png" style="float:left;"></a>
			<c:forEach var="page_list" items="${page_list}">
				<a class="page_num_wrap"  onClick="window.location='select_product?pageNum=${page_list}&category_num=${category_num}&search_category=${search_category}&search_content=${search_content}&mode=${mode}'">	
					${page_list}
				</a>	
			</c:forEach>	
			<a href='#' onClick="window.location='select_product?pageNum=${end_pageNum}&category_num=${category_num}&search_category=${search_category}&search_content=${search_content}&mode=${mode}'"><img src="resources/shop_image/end_page_img.png" style="float:left;"></a>
		  
		  </c:when>
		  <c:when  test="${mode=='nomal'}">	
			<a href='#' onClick="window.location='top_product?pageNum=${start_pageNum}&category_num=${category_num}'"><img src="resources/shop_image/start_page_img.png" style="float:left;"></a>
			<c:forEach var="page_list" items="${page_list}">
				<a class="page_num_wrap"  onClick="window.location='top_product?pageNum=${page_list}&category_num=${category_num}'">	
					${page_list}
				</a>	
			</c:forEach>	
			<a href='#' onClick="window.location='top_product?pageNum=${end_pageNum}&category_num=${category_num}'"><img src="resources/shop_image/end_page_img.png" style="float:left;"></a>
		  </c:when>
		  </c:choose>
		</c:when>
		</c:choose>
		</div>
		<div class="button_wrap">
				<a class="product_enroll_button"  onClick="window.location = 'product_regist?pageNum=1&category_num=${category_num}'">상품 등록</a>
				<a class="product_list_button" onClick = "window.location = 'top_product?pageNum=1&category_num=1'">목록</a>
		</div>
		
	</div>
</body>
</html>