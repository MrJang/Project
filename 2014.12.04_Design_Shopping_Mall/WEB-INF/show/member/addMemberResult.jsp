<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>   
<%@taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> ȸ�� ���� ȯ�� </title>
<!-- 	<meta http-equiv="Refresh" Content="0; URL=reject"> -->
</head>
<body>
	<form:form commandName = "member">
	<h1> ȸ�� ���� ȯ�� </h1>
	���̵�     :   ${member.mem_id}	<br/>
	�̸�       :   ${member.mem_name}<br/>
	�����ȣ   :   ${member.mem_post}<br/>
	�ּ�       :   ${member.mem_addr}<br/>
	��ȭ��ȣ   :   ${member.mem_phone}<br/>
	�̸���     :   ${member.mem_email}<br/>
	����       :   ${member.mem_gender}<br/>
			
</form:form>	
<input type = "button" class = "buttonpx" value = "��������" onClick = "window.location = 'main'">
</body>
</html>