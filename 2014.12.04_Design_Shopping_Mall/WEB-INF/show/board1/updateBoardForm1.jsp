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
</head>
<body onload = "$('#bod_des_category').val('${board.bod_des_category}');">

	<form:form commandName = "board" enctype = "multipart/form-data">
		<form:input path = "bod_num" type = "hidden"/>
제목 :   <form:input path = "bod_title"/>
			<select name = "bod_des_category" id = "bod_des_category">
	  			<option disabled="disabled" value = "0" >
	  				의상종류 선택
	  			</option>
	  			<option value="1" selected="selected">
	  				상의
	  			</option>
	  			<option value="2">
	  				하의
	  			</option>
	  			<option value="3">
	  				악세사리
	  			</option>
	  			<option value="4">
	  				기타
	  			</option>
	  		</select>
	  	예상 가격 : <form:input path = "bod_price" size = "10" />
			
		<br/>	
		<form:textarea path = "bod_content" id = "content" wrap="hard" cols="80" rows="30" cssClass = "normal" cssErrorClass = "errors"/><br/>
		<form:errors path = "bod_content" cssClass = "errors"/><br/>
파일명 : <form:input path = "uploadfile" type = "file" cssClass = "normal" cssErrorClass = "errors"/><br/>
		<input type = "submit" value = "등록"/><input type = "reset" value = "리셋"/>		
		
	</form:form>
	
</body>
</html>
