<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

</head>
<body>
	<center>
	<table border="1" align="center">
		<c:forEach var="member" items="${list}">


			<tr align="center">
				
				<td>아이디</td>
				<td>phone</td>
			</tr>

			<tr align="center">
			<form:form>
				
				<td>${member.id}</td>
				<td>${member.phone}</td>
				<td><a href="../safe/listMemberView?id=${member.id}">상세보기</a></td>
			</form:form>
			</tr>

		</c:forEach>
	</table>
	
		<a href="../safe/safe_Mypage">목록으로</a>
</center>
</body>
</html>