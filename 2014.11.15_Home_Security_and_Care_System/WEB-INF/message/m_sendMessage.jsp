<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<table border="1" align="center">
		<tr align="center">
				<td>���̵�</td>
				<td>�󼼺���</td>
			</tr>
		<c:forEach var="message" items="${Message}">
			
			<tr>
			<td>
			${message.write_id}
			</td>
			
			<c:choose>
			
			<c:when test="${message.category == '0'}">
			<td>
			�Ϲ�
			</td>
			</c:when>
			<c:when test="${message.category == '1'}">
			<td>
			��û
			</td>
			</c:when>
			
			</c:choose>
			<td>
			<a href="../safe/m_ViewMessage?write_num=${message.write_num}">�󼼺���</a>
			</td>
			</tr>
		</c:forEach>
		
			<tr>
				<td colspan="2"><a href="../safe/m_MessageList">�������</a></td>
			</tr>
</table>