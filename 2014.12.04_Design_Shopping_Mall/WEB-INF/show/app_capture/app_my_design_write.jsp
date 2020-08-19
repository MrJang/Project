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
<script src = "http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js">
</script>
</head>
<body>
	<form:form commandName = "canvas" enctype = "multipart/form-data">
<%-- 		<form:input path = "can_num" type = "hidden" cssClass = "normal" cssErrorClass = "errors"/> --%>
		<form:input path = "mem_num" value = "${member.mem_num}" type = "hidden"/>
  		<form:textarea path = "can_title" cols="50" rows="1" />	
 		<form:input path = "uploadfile" type = "file" cols = "30" />
		<input class = "myButton3" type = "submit" value = "등록"/><input  class = "myButton3" type = "reset" value = "리셋"/>
	</form:form>	
</body>
</html>