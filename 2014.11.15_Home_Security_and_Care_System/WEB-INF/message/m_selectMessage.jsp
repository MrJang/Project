<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<form:form commandName="Message">

	<table border="1">
		<tr>
				<td>보내는 사람:</td>
				<td>${Message.write_id}</td>
			<tr>
			<tr>
				<td>받는사람 :</td>
				<td>${Message.send_id}</td>
			</tr>
	
			<tr>
				<td>내용 :</td>
				
				<td><form:textarea path="m_content" /></td>
				
			</tr>
			
	<tr>
		<td>
			고객분류 :
		</td>
	
		<td>
		<c:choose>
				<c:when test='${s.category=="1"}'>
				개인고객
			</c:when>
				<c:when test='${s.category=="2"}'>
				업체고객
			</c:when>
		</c:choose>
		
		</td>
	</tr>


	<tr>
		<td colspan="2">
			<input type="submit" value="보내기"> &nbsp;&nbsp;
			<input type="reset" value="취소">
		</td>
	</tr>

		</table>

</form:form>


