<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<form:form commandName="sche">

<center>

	<table border="1">
		
		<tr>
			<td>업체명 :</td>
			<td><form:input path="e_name" value="${sche.e_name}" readonly="true"/></td>
		</tr>
	
		<tr>
			<td colspan="2">
			<input type="button" value="등록" onclick="watchLocation('${sche.e_name}')">
			</td>
		</tr>
	</table>
	</center>
</form:form>
 	
    