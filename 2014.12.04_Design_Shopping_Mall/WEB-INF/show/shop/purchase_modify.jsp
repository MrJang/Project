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
		function sum_price(){
		var amount = $('#total_price option:selected').val();
		var price=$(".purchase_price").text();
		var sum=amount*price;
		$("#sum_price2").attr('value',sum);
		$("#view_total_price").text(sum);
	}
	
    function openDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
      
                document.getElementById('post1').value = data.postcode1;
                document.getElementById('post2').value = data.postcode2;
                document.getElementById('addr').value = data.address;

            }
        }).open();
    }
  
    function cancel_button(category_num,pageNum){
    	if(category_num==1)
    		window.location="top_product?category_num="+category_num+"&pageNum="+pageNum;
    	else if(category_num==2)
    		window.location="bottoms_product?category_num="+category_num+"&pageNum="+pageNum;
    	else if(category_num==3)
    		window.location="accessory_product?category_num="+category_num+"&pageNum="+pageNum;
    	else if(category_num==4)
    		window.location="others?category_num="+category_num+"&pageNum="+pageNum;
    }
  
</script>
	
</head>
<body>
	<div class="product_purchase_title"><img src="resources/shop_image/purchase_title.png"></div>
	<div class="product_purchase_content">
	<form name="purchase_form" action="product_purchase_modify?pageNum=${pageNum}&category_num=${category_num}" method="post">
	  <c:forEach  var = "Purchase" items = "${purchase_modify}">	
		<div class="purchase_img">
			<c:choose>
					<c:when test="${Purchase.pro_img_type == 1}">
						<img src = '../upload/${Purchase.pro_img}' id= 'img'  width = '300px' height = '250px'>
					</c:when>
					<c:when test="${Purchase.pro_img_type == 2}">
						<img src = '${Purchase.pro_img}' id= 'img'  width = '300px' height = '250px'>
					</c:when>
				</c:choose>
		</div>		
		<div class="purchase_wrap1">
			<input type="hidden" name="p_num" value="${Purchase.p_num}"/>
			<div class="purchase_item1">상품명</div><div class="purchase_name">${Purchase.pro_name}</div>		
			<div class="purchase_item1">사이즈</div><div class="purchase_size">${Purchase.pro_size}</div>
			<div class="purchase_item1">수량</div><div class="purchase_amount">
				${Purchase.p_amount}
			</div>
			<div class="purchase_item1">가격</div><div class="purchase_price">${Purchase.pro_price}</div>
			<div class="purchase_item1">총 구입 가격</div><div class="purchase_total_price">
					  <div id="view_total_price">${Purchase.pro_price}</div>
			</div>
		</div>
		<div class="purchase_wrap2">
			<div class="purchase_item2">구매자</div><div class="receiver">
				${mem_name}
			</div>
			<div class="purchase_item2">수령자</div><div class="receiver">
				<input type="text" name="receiver" value="${Purchase.p_receiver}"/>
			</div>
			<div class="purchase_item2">우편번호</div><div class="post_number">
				<input type="text"  name="post_num1" id="post1" class="post_num" value="${post_num1}"> - <input type="text"  name="post_num2" id="post2" class="post_num"  value="${post_num2}"> <input type="button" onclick="openDaumPostcode()" value="주소 검색">
			</div>
			<div class="purchase_item2">주소</div><div class="address">
				<input type="text" name="addr" id="addr" class="addr" value="${Purchase.p_address}"/>
			</div>
			<div class="purchase_item2">전화 번호</div><div class="phone_number">
				 <select  name="phone_num1" class="phone_num"/>
				 <c:choose>
				 <c:when test="${Phone1 == '010'}">
				 	<option value="010" selected>010</option>
				 	<option value="016">016</option>
				 	<option value="019">019</option>
				 	<option value="011">011</option>
				 	<option value="017">017</option>
				 </c:when>
				 <c:when test="${Phone1 == '016'}">
				 	<option value="010">010</option>
				 	<option value="016" selected>016</option>
				 	<option value="019">019</option>
				 	<option value="011">011</option>
				 	<option value="017">017</option>
				 </c:when>
				 <c:when test="${Phone1 == '019'}">
				 	<option value="010">010</option>
				 	<option value="016">016</option>
				 	<option value="019" selected>019</option>
				 	<option value="011">011</option>
				 	<option value="017">017</option>
				 </c:when>
				 <c:when test="${Phone1 == '011'}">
				 	<option value="010">010</option>
				 	<option value="016">016</option>
				 	<option value="019">019</option>
				 	<option value="011" selected>011</option>
				 	<option value="017">017</option>
				 </c:when>
				 <c:when test="${Phone1 == '017'}">
				 	<option value="010">010</option>
				 	<option value="016">016</option>
				 	<option value="019">019</option>
				 	<option value="011">011</option>
				 	<option value="017" selected>017</option>
				 </c:when>
				</c:choose>
				 </select>-<input name="phone_num2" class="phone_num" value="${Phone2}">-<input name="phone_num3" class="phone_num" value="${Phone3}">
			</div>
			<div class="button_wrap2">
				<input type="submit" class="product_enroll_button" value="구매 수정"/>
					
				<a class="product_list_button" onClick="cancel_button(${category_num},${pageNum})">취소</a>
			</div>
		</div>
		</c:forEach>
	</form>
	</div>
</body>
</html>