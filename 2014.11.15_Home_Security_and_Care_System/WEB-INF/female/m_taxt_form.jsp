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
휴대폰번호 : <form:input path="phone"/><br>
차량번호 : <form:input path="car_num"/><br>
승차시간 : <form:input path="crime_time"/><br>
하차시간 : <form:input path="crime_time"/><br>
시간 : <form:input path="drive"/><br>
거리 : <form:input path="drive"/><br>
요금 : <form:input path="drive"/><br>
sms발송여부 : <form:input path="notice"/><br>
<input type="submit" value="등록">
</form:form>
</body>
</html>