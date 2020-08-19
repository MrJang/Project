<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>memberList.jsp</title>
<link href = "../style.css" type="text/css" rel = "stylesheet">
</head>
<body>
	<center>
		<h2>회원 목록</h2>
	<table>
		<tr>
			<th id = "th1">이름</th>	
		</tr>
		<c:forEach var = "member" items = "${list}">
		<tr>
			<td id = "td1">
			<input type = "button" id = "memberList" value = "이름 : ${member.mem_name} 아이디 : ${member.mem_id}" onClick = "window.location='getMember?id=${member.mem_id}'">
<%-- 			<a href = "getMember?id=${member.id}">${member.name}</a> --%>
			</td>
		</tr>
		</c:forEach>
	</table>
	</center>
</body>
</html>