<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>   
<%@taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>logo</title>
<c:choose>
<c:when test="${ member.mem_auth==2}">
<img src="resources/MainImage/customer.jpg">
</c:when>
<c:when test="${ member.mem_auth==1}">
<img src="resources/MainImage/designer.jpg">
</c:when>
</c:choose>
</head>
<body>
<center>
<!-- <input type = "button" class = "button4" value = "logo" onclick="window.location='main'"> -->
<input type = "image" width = "240px" src="resources/MainImage/로고.png" onclick="window.location='main'">
</center>


</body>
</html>