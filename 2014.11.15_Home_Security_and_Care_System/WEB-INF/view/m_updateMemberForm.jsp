<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


	<form:form commandName="s">
	id : ${s.id}
		<br>
	password : <form:password path="password" />
		<br>
	name : <form:input path="name" />
		<br>
	<c:choose>
	<c:when test='${s.category=="2"}'>
	��ü�� : <form:input path="e_name"/><br>
	</c:when>
	</c:choose>
	
	address:<form:input path="address" />
		<br>
	email : <form:input path="email" />
		<br>
	phone : <form:input path="phone" />
		<br>

		<input type="submit" value="����"> &nbsp;&nbsp;
 		<input type="reset" value="����">


	</form:form>
