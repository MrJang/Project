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
<form:form commandName="female">
�޴�����ȣ : <form:input path="phone"/><br>
������ȣ : <form:input path="car_num"/><br>
�����ð� : <form:input path="crime_time"/><br>
�����ð� : <form:input path="crime_time"/><br>
�ð� : <form:input path="drive"/><br>
�Ÿ� : <form:input path="drive"/><br>
��� : <form:input path="drive"/><br>
sms�߼ۿ��� : <form:input path="notice"/><br>
<input type="submit" value="���">
</form:form>
</body>
</html>