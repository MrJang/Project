<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<form:form commandName="female">
		<table align="center" border="1">
			<tr>
			<td>Id</td>
				<td><form:input path="id" readonly="true" value="${s.id}"/></td>
			</tr>
			<tr>
				<td>번호1</td><td><form:input path="t_phone1" /></td>
			</tr>
			<tr>
				<td>번호2</td><td><form:input path="t_phone2" /></td>
			</tr>	
			<tr>
				<td>번호3</td><td><form:input path="t_phone3"/></td>
			</tr>
								<tr>
				<td>알림내용</td><td><form:textarea rows="10" cols="40" path="content" /></td>
				</tr>
			<tr align="center">
			<td colspan="2">
			<input type = "submit" value="등록"/> &nbsp;&nbsp;&nbsp;
		<input type= "reset" value="리셋"/>
			</td>
			</tr>
		</table>
		
	</form:form>
