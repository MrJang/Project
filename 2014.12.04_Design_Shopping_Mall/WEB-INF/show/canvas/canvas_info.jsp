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
</head>
<body>

<form:form commandName = "canvas">
<table align = "center" width = "85%" height = "620px" >
	<tr>
		<td align = "center" width = "50%" height = "40px" style = "border : 2px solid black;">
		제목 : ${canvas.can_title}
		</td>
		<td align = "center" width = "50%" style = "border : 2px solid black;">
		날짜 : ${canvas.can_date}	
		</td>
	</tr>
	
	<c:choose>
	
		<c:when test="${canvas.can_img == 'null.jpg'}">
		</c:when>
		
		<c:otherwise>
		
		</c:otherwise>
		
	</c:choose>
	
	<tr>
		<td colspan = "2" align = "center" style = "border : 2px solid black;">
			<c:choose>
				<c:when test="${canvas.can_category=='1'}"><img src = "../upload/${canvas.can_img}" alt = "이미지 로딩중" width="515px" style = "height:550px;"></c:when>
				<c:when test="${canvas.can_category=='2'}"><img src = "${canvas.can_img}" alt = "이미지 로딩중" width="515px" style = "height:550px;"></c:when>
			</c:choose>
		</td>
	</tr>
	<tr>
		<td colspan = "2" align = "center" style = "border : 2px solid black;">
		<div style = "float : left; text-align:left;">
			<input type = "button" value = "수정" class = "board_modify" onClick = "window.location ='my_design_update?can_num=${canvas.can_num}'">
			<c:choose>
				<c:when test="${canvas.can_category=='1'}">					
					<input type = "button" value = "삭제" class = "board_delete" onClick = "window.location = 'deleteCapture?can_num=${canvas.can_num}'">	
				</c:when>
				<c:when test="${canvas.can_category=='2'}">
					<input type = "button" value = "삭제" class = "board_delete" onClick = "window.location = 'deleteCanvas?can_num=${canvas.can_num}'">
				</c:when>
			</c:choose>
		</div>	
			<c:choose>
				<c:when test="${canvas.can_category=='1'}">
					<div style = "float : right; text-align:right;">
						<input type = "button" class = "board_list" value = "목록" onClick = "window.location = 'my_capture'">
					</div>
				</c:when>
				<c:when test="${canvas.can_category=='2'}">
					<div style = "float : right; text-align:right;">
						<input type = "button" class = "board_list" value = "목록" onClick = "window.location = 'my_canvas'">
					</div>
				</c:when>
			</c:choose>
		</td>
	</tr>
</table>

</form:form>	
</body>
</html>