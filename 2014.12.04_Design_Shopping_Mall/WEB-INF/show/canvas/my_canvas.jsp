<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href = "../style.css" type="text/css" rel = "stylesheet">
<link href = "../button.css" type="text/css" rel = "stylesheet">
</head>
<body>
<table border = "0" width = "80%">
<tr>
		<c:forEach var = "canvas" items = "${list}" begin = "0" end = "4">
		<td align = "center" onmouseover='mouseOver(this, true);' onmouseout='mouseOver(this, false);'
			onClick = "window.location = 'getCanvas?can_num=${canvas.can_num}'" class = "b0px">
		${canvas.can_title}
		</td>
		</c:forEach>
	</tr>
	<tr>
		<c:forEach var = "canvas" items = "${list}" begin = "0" end = "4">
			<td align = "center"  onmouseover='mouseOver(this, true);' onmouseout='mouseOver(this, false);'
			onClick = "window.location = 'getCanvas?can_num=${canvas.can_num}'" class = "b0px"> 
			<c:choose>
			
				<c:when test = "${canvas.can_category=='1'}"><img src = "../upload/sm_${canvas.can_img}" alt = "X"></c:when>
				<c:when test = "${canvas.can_category=='2'}"><img src = "${canvas.can_img}" width = "100px" alt = "X"></c:when>
				
			</c:choose>
			
			</td>
		</c:forEach>
	</tr>
	<tr>
		<c:forEach var = "canvas" items = "${list}" begin = "0" end = "4">    
			<td align = "center"  onmouseover='mouseOver(this, true);' onmouseout='mouseOver(this, false);'
			onClick = "window.location = 'getCanvas?can_num=${canvas.can_num}'" class = "b0px">
			 	작성자 : ${canvas.mem_id}<br/>
			 	${canvas.can_date}
			</td>
		</c:forEach>
	</tr>
	
	
	</table>
</body>
</html>