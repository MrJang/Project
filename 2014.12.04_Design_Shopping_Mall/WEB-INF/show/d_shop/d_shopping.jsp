<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>   
<%@taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link href = "../d_shop.css" type="text/css" rel = "stylesheet">
</head>
<body>
<div class="shopping"style= "width:1024px;height:800px;">
<table >
	<tr>
		<c:forEach var = "bbs" items = "${product}" varStatus="i">
     
    
		<th>
			<div>
				<%-- <c:choose>
				<c:when test="${bbs.pro_img_type==2}">
 				<a href="product_view?pro_num=${bbs.pro_num}&categodry_num=${bbs.pro_category}&pageNum=1"><img width = "200px" height="200px"src="${bbs.pro_img}"/></a><br/>
				</c:when>
				<c:otherwise>
				<a href="product_view?pro_num=${bbs.pro_num}&category_num=${bbs.pro_category}&pageNum=1"><img width = "200px" height="200px"src="../shop_item/${bbs.pro_img}"/></a><br/>
				</c:otherwise>
				</c:choose> --%>
				<a href="product_view?pro_num=${bbs.pro_num}&category_num=${bbs.pro_category}&pageNum=1"><img width = "200px" height="200px"src="../shop_item/${bbs.pro_img}"/></a><br/>
			</div>
			<div class="subButton2">
			 ${bbs.pro_name}
			 </div>
			<div class="subButton2">가격 : ${bbs.pro_price}
		   </div>
				<div class="product_list_button_wrap">
					<div class="purchase" onClick="window.location='product_purchase?pro_num=${bbs.pro_num}&pageNum=1&category_num=${bbs.pro_category}'">구매하기</div>
					<div class="basket" onClick="window.location='cart_regist?pro_num=${bbs.pro_num}&category_num=${bbs.pro_category}'">장바구니</div>
				</div>
		</th>
	<c:choose>
	<c:when test="${i.count%4 == 0}">
	<tr></tr>
	</c:when>
	</c:choose>
	
	</c:forEach>
	</tr>
</table>
</div>

</body>

</html>