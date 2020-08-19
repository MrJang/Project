<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<c:if test='${s.category==2}'>
<table border="1">
		
		
		
		<c:forEach var="r" items="${request_list}">
		<c:set var = "crime" value="${fn:split(r.crime_time,'/')}"/>

			<tr align="center">
				
				<td>��û ���̵�</td>
				<td>�����</td>
				<td>������</td>
				<td>��߽ð�</td>
				<td>�����ð�</td>
				
			</tr>

			<tr align="center">
			<form:form>
				<td>${r.id}</td>
				<td>${r.departure}</td>
				<td>${r.destination}</td>
				
				<td>${crime[0]}</td>
				<td>${crime[1]}</td>
				<td colspan="2">
				<a href="../safe/m_requestView?num=${r.num}">�󼼺���</a>
				
				</td>
			</form:form>
			</tr>

		</c:forEach>
		</table>
		
	</c:if>	
		
		<c:if test='${s.category==1}'>
		
		<table border="1">
		
		<c:set var = "crime" value="${fn:split(children.crime_time,'/')}"/>
		<tr align="center">
				
				<td>��û ���̵�</td>
				<td>�����</td>
				<td>������</td>
				<td>��߽ð�</td>
				<td>�����ð�</td>
				
			</tr>

			<tr align="center">
			<form:form>
				<td>${children.id}</td>
				<td>${children.departure}</td>
				<td>${children.destination}</td>
				<td>${crime[0]}</td>
				<td>${crime[1]}</td>
				<td colspan="2">
				<a href="../safe/m_requestView?num=${children.num}">�󼼺���</a>
				
				</td>
			</form:form>
			</tr>
		</table>
	</c:if>

		<a href="../safe/m_safe_Main">��������</a>
		

