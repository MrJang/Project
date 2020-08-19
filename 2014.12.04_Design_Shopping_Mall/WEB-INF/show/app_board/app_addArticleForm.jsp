<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>   
<%@taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>addArticleForm.jsp</title>
<link href = "../style.css" type="text/css" rel = "stylesheet">
<style type="text/css">
	#content{
		border-width: 3px;
		border-style: dashed;
		border-color: gray;
	}
</style>
<script src = "http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type = "text/javascript">
window.onload=function(){
	jsSetSub(subject, 'off');
	jsSetCntt(content, 'off');
}

function jsSetSub (obj, type){
	if(type == "on"){
		if(obj.value == "			제목"){
	   	obj.value = "";
		}
	} 
	if(type == "off"){
	    if(obj.value == ""){
	    obj.value = "			제목";
	    }
	}
}
function jsSetCntt (obj, type){
	if(type == "on"){
		if(obj.value == "\n\n\n\n\n\n\n\n\n\n\n\n			내용"){
	   	obj.value = "";
		}
	} 
	if(type == "off"){
	    if(obj.value == ""){
	    obj.value = "\n\n\n\n\n\n\n\n\n\n\n\n			내용";
	    }
	}
}

</script>
</head>

<body>
	<form:form commandName = "board" enctype = "multipart/form-data">
<%-- 		<form:input path = "num" type = "hidden" cssClass = "normal" cssErrorClass = "errors"/> --%>
		<form:input path = "mem_id" value = "${member.mem_id}" type = "hidden"/>
  		제목 <form:input path = "bod_title" cssClass = "normal" cssErrorClass = "errors" size="30px" /><br/><br/>
		<form:textarea path = "bod_content" id = "content" wrap="hard" cols="36" rows="15" cssClass = "normal" cssErrorClass = "errors" value="" class="textArea"/><br/><br/>
 		<form:input path = "uploadfile" type = "file" cols = "20" cssClass = "normal" cssErrorClass = "errors"/><br/><br/>
		<input  class = "myButton3" type = "submit" value = "등록"/>&nbsp;<input  class = "myButton3" type = "reset" value = "리셋"/>　　　　　&nbsp;&nbsp;<input class = "myButton3" type="button" value="목록으로" onclick="window.location = 'app_board?pageNum=1'">
	</form:form>
</body>
</html>