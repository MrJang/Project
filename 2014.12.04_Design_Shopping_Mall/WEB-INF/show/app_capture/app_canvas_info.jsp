<%@page import="yjc.spring.bean.Canvas"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>   
<%@taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>-</title>
<link href = "../style.css" type="text/css" rel = "stylesheet">
<style type="text/css">
	#content{
		border-width: 3px;
		border-style: dashed;
		border-color: gray;
	}
</style>
</head>
<body>

<form:form commandName = "canvas">
<table id="content" >
	<tr><td>제목 : ${canvas.can_title}</td></tr>
	<tr><td>날짜 : ${canvas.can_date}</td></tr>
	<tr><td>작성자 : ${canvas.mem_id}</td></tr>
	<c:choose>
		<c:when test="${canvas.can_img == 'null.jpg'}">
		</c:when>
	</c:choose>
	
	<tr>
	<td colspan = "5">
	<c:choose>
		<c:when test="${canvas.can_category=='1'}"><img src = "../upload/${canvas.can_img}" alt = "이미지 로딩 실패" width="1100px"></c:when>
		<c:when test="${canvas.can_category=='2'}"><img src = "${canvas.can_img}" alt = "이미지 로딩 실패" width="1100px"></c:when>
	</c:choose>
	</td>
	</tr>
</table>
<div align="right" style="margin-top: 10px;"><input type = "button" class = "buttonpx"  class = "myButton3" value = "목록" onClick = "window.location = 'app_my_capture?pageNum=${param.pageNum}'"></div>
</form:form>	
</body>
</html>