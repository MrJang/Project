<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

	<center>
	<table border="1" align="center">
		<c:forEach var="member" items="${list}">


			<tr align="center">
				
				<td>���̵�</td>
				<td>phone</td>
			</tr>

			<tr align="center">
			<form:form>
				
				<td>${member.id}</td>
				<td>${member.phone}</td>
				<td><a href="../safe/listMemberView?id=${member.id}">�󼼺���</a></td>
			</form:form>
			</tr>

		</c:forEach>
	</table>
	
		<a href="../safe/safe_Mypage">�������</a>
</center>
