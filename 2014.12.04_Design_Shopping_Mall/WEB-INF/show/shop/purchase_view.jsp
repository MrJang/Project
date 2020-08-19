<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>   
<%@taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://dmaps.daum.net/map_js_init/postcode.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	
	<script type="text/javascript" language="javascript">
	
    function cancel_button(category_num,pageNum){
    	window.location="customer_purchase_list?category_num="+category_num+"&pageNum="+pageNum;
    }
    function cancel_button2(category_num,pageNum,search_category,search_content,mode){
    	window.location="select_purchase?category_num="+category_num+"&pageNum="+pageNum+"&search_category="+search_category+"&search_content="+search_content+"&mode="+mode;
    }
  
</script>
	
</head>
<body>
	<div class="product_purchase_title"><img src="resources/shop_image/purchase_view_title.png"></div>
	<div class="product_purchase_content">
	  <c:forEach  var = "Purchase" items = "${purchase_view}">	
		<div class="purchase_img">
			<img src = '../shop_item/${Purchase.pro_img}' id= 'img'  width = '300px' height = '250px'>	
		</div>		
		<div class="purchase_wrap1">
			<div class="purchase_item1">상품명</div><div class="purchase_name">${Purchase.pro_name}</div>		
			<div class="purchase_item1">사이즈</div><div class="purchase_size">${Purchase.pro_size}</div>
			<div class="purchase_item1">수량</div><div class="purchase_amount">
					  ${Purchase.p_amount}
			<input type=hidden name='p_num' value="${Purchase.p_num}"/>
			</div>
			<div class="purchase_item1">가격</div><div class="purchase_price">${Purchase.pro_price} 원</div>
			<div class="purchase_item1">총 구입 가격</div><div class="purchase_total_price">
					  <div id="view_total_price">${Purchase.p_price} 원</div>
		
			</div>
		</div>
		<div class="purchase_wrap2">
			<div class="purchase_item2">구매자</div><div class="receiver">
				${mem_name}
			</div>
			<div class="purchase_item2">수령자</div><div class="receiver">
				${Purchase.p_receiver}
			</div>
			<div class="purchase_item2">우편번호</div>
			<div class="post_number">
				${post_num1}-${post_num2}			
			</div>
			<div class="purchase_item2">주소</div><div class="address">
			${Purchase.p_address}
			</div>
			<div class="purchase_item2">전화 번호</div><div class="phone_number">
				${Phone1}-${Phone2}-${Phone3} 
			</div>
		 	<div class="purchase_item2">디자이너 계좌 번호</div><div class="des_account">${Purchase.des_account}</div>
			
			<div class="button_wrap2">
			<c:choose>
				<c:when test="${mode=='select'}">
					<input type="button" class="product_enroll_button" value="구매 수정" onClick="window.location='product_purchase_modify?pageNum=${pageNum}&category_num=${category_num}&p_num=${Purchase.p_num}'"/>	
					<a class="product_list_button" onClick="cancel_button2(${category_num},${pageNum},'${search_category}','${search_content}','${mode}')">취소</a>
				</c:when>
				<c:otherwise>
					<input type="button" class="product_enroll_button" value="구매 수정" onClick="window.location='product_purchase_modify?pageNum=${pageNum}&category_num=${category_num}&p_num=${Purchase.p_num}'"/>	
					<a class="product_list_button" onClick="cancel_button(${category_num},${pageNum})">취소</a>
				</c:otherwise>
			</c:choose>			
			</div>
		</div>
		</c:forEach>
	</div>
</body>
</html>