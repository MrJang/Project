<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<style>
#safe_body, #left{
	display : none;
}
</style>
<form:form commandName="cafe" enctype="multipart/form-data">
	
	
	ī��� : <form:input path="c_name"/><br><br>
	���̵� :  <form:input path="id" value="${s.id}" readonly="true"/><br><br>
	ī���̹��� <input type="file" name="c_image"><br><br>
	ī������: <form:input path="c_info"/><br><br>
	<input type="submit" value="���"> &nbsp;&nbsp;
 	<input type="reset" value="����">


</form:form>

