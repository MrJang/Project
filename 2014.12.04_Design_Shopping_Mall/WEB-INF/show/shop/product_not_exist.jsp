<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
		<br>
		<br>
		<br>
		<center>찾으시는 상품이 없습니다</center>
		<center>
		<c:choose>
			<c:when test='${category_num == 1}'>	
				<a onClick="window.location='top_product?pageNum=1&category_num=1'">메인으로</a>
			</c:when>
			<c:when test='${category_num == 2}'>	
				<a onClick="window.location='bottoms_product?pageNum=1&category_num=2'">메인으로</a>
			</c:when>
			<c:when test='${category_num == 3}'>	
				<a onClick="window.location='accessory_product?pageNum=1&category_num=3'">메인으로</a>
			</c:when>
			<c:when test='${category_num == 4}'>	
				<a onClick="window.location='others?pageNum=1&category_num=4'">메인으로</a>
			</c:when>
			<c:when test='${category_num == 6}'>	
				<a onClick="window.location='customer_purchase_list?pageNum=1&category_num=6'">메인으로</a>
			</c:when>
			
			
			
		</c:choose>
		
		</center>
</body>
</html>