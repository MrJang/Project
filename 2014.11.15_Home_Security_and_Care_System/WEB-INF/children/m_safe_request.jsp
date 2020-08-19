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
				
				<td>신청 아이디</td>
				<td>출발지</td>
				<td>목적지</td>
				<td>출발시간</td>
				<td>도착시간</td>
				
			</tr>

			<tr align="center">
			<form:form>
				<td>${r.id}</td>
				<td>${r.departure}</td>
				<td>${r.destination}</td>
				
				<td>${crime[0]}</td>
				<td>${crime[1]}</td>
				<td colspan="2">
				<a href="../safe/m_requestView?num=${r.num}">상세보기</a>
				
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
				
				<td>신청 아이디</td>
				<td>출발지</td>
				<td>목적지</td>
				<td>출발시간</td>
				<td>도착시간</td>
				
			</tr>

			<tr align="center">
			<form:form>
				<td>${children.id}</td>
				<td>${children.departure}</td>
				<td>${children.destination}</td>
				<td>${crime[0]}</td>
				<td>${crime[1]}</td>
				<td colspan="2">
				<a href="../safe/m_requestView?num=${children.num}">상세보기</a>
				
				</td>
			</form:form>
			</tr>
		</table>
	</c:if>

		<a href="../safe/m_safe_Main">메인으로</a>
		

