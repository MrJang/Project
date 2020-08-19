<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>   
<%@taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> 회원 가입 환영 </title>
<!-- 	<meta http-equiv="Refresh" Content="0; URL=reject"> -->
</head>
<body>
	<form:form commandName = "member">
	<h1> 회원 가입 환영 </h1>
	아이디     :   ${member.mem_id}	<br/>
	이름       :   ${member.mem_name}<br/>
	우편번호   :   ${member.mem_post}<br/>
	주소       :   ${member.mem_addr}<br/>
	전화번호   :   ${member.mem_phone}<br/>
	이메일     :   ${member.mem_email}<br/>
	성별       :   ${member.mem_gender}<br/>
			
</form:form>	
<input type = "button" class = "buttonpx" value = "메인으로" onClick = "window.location = 'main'">
</body>
</html>