<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<form:form commandName="Message">

	<table border="1">
		<tr>
				<td>������ ���:</td>
				<td>${Message.write_id}</td>
			<tr>
			<tr>
				<td>�޴»�� :</td>
				<td>${Message.send_id}</td>
			</tr>
	
			<tr>
				<td>���� :</td>
				
				<td><form:textarea path="m_content" /></td>
				
			</tr>
			
	<tr>
		<td>
			���з� :
		</td>
	
		<td>
		<c:choose>
				<c:when test='${s.category=="1"}'>
				���ΰ�
			</c:when>
				<c:when test='${s.category=="2"}'>
				��ü��
			</c:when>
		</c:choose>
		
		</td>
	</tr>


	<tr>
		<td colspan="2">
			<input type="submit" value="������"> &nbsp;&nbsp;
			<input type="reset" value="���">
		</td>
	</tr>

		</table>

</form:form>


