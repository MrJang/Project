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
<%-- 		<form:input path = "num" type = "hidden" cssClass = "normal" cssErrorClass = "errors"/> --%>
		<form:input path = "mem_id" value = "${canvas.mem_id}" type = "hidden"/>
  		<form:textarea path = "can_title" cols="50" rows="1" cssClass = "normal" cssErrorClass = "errors"
   		onFocus="jsSetSub(this, 'on')" onBlur="jsSetSub(this, 'off')"/>
		<form:errors path = "can_title" cssClass = "errors"/><br/>	
<%-- 		<form:textarea path = "bod_content" id = "content" wrap="hard" cols="50" rows="30" cssClass = "normal" cssErrorClass = "errors" --%>
<%-- 		onFocus="jsSetCntt(this, 'on')" onBlur ="jsSetCntt(this, 'off')" value=""/><br/> --%>
<%-- 		<form:errors path = "bod_content" cssClass = "errors"/> --%>
 		<form:input path = "uploadfile" type = "file" value = "1" cols = "30" cssClass = "normal" cssErrorClass = "errors"/><br/>
		<input type = "submit" value = "등록"/><input type = "reset" value = "리셋"/>
	</form:form>	
</body>
</html>