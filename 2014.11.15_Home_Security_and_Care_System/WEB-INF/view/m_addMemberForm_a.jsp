<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form:form commandName="s">
	
	
	id : <form:input path="id"/><br>
	password : <form:password path="password"/><br>
	name : <form:input path="name"/><br>
	phone : <form:input path="phone"/><br>
	email : <form:input path="email"/><br>
	address : <form:input path="address"/><br>
	profile : <form:input path="profile"/><br>
	
	<input type="submit" value="���"> &nbsp;&nbsp;
 	<input type="reset" value="����">


</form:form>

</body>
</html>