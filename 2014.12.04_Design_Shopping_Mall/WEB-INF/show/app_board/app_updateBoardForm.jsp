<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>   
<%@taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>updateBoardForm.jsp</title>
<link href = "../style.css" type="text/css" rel = "stylesheet">
<style type="text/css">
	#content{
		border-width: 3px;
		border-style: dashed;
		border-color: gray;
	}
</style>
</head>
<body>

	<form:form commandName = "board" enctype = "multipart/form-data">
		<form:input path = "bod_num" type = "hidden" cssClass = "normal" cssErrorClass = "errors"/>
		제목 <form:input path = "bod_title" cssClass = "normal" cssErrorClass = "errors" size="30px"/><br/>
		<form:errors path = "bod_title" cssClass = "errors"/><br/>	
		<form:textarea path = "bod_content" id = "content" wrap="hard" cols="36" rows="15" cssClass = "normal" cssErrorClass = "errors"/><br/>
		<form:errors path = "bod_content" cssClass = "errors"/><br/>
		<form:input path = "uploadfile" type = "file" cssClass = "normal" cssErrorClass = "errors" size="20px"/><br/><br/>
		<input type = "submit" class = "myButton3" value = "등록"/>&nbsp;<input class = "myButton3" type = "reset" value = "리셋"/>　　　　　&nbsp;
		<input type = "button" class = "myButton3" value = "목록으로" onClick = "window.location = 'app_board?pageNum=${param.pageNum}'">
	</form:form>
	
</body>
</html>
