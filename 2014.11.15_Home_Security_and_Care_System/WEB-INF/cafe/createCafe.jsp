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
	
	
	카페명 : <form:input path="c_name"/><br><br>
	아이디 :  <form:input path="id" value="${s.id}" readonly="true"/><br><br>
	카페이미지 <input type="file" name="c_image"><br><br>
	카페정보: <form:input path="c_info"/><br><br>
	<input type="submit" value="등록"> &nbsp;&nbsp;
 	<input type="reset" value="리셋">


</form:form>

