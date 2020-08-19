<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

	<table>
		<tr>
			<td>Id :</td>
			<td>${s.id}</td>
		</tr>

		<tr>
			<td>이름 :</td>
			<td>${s.name}</td>
		</tr>

		<tr>
			<td>email :</td>
			<td>${s.email}</td>
		</tr>

		<tr>
			<td>주소 :</td>
			<td>${s.address}</td>
		</tr>

		<tr>
			<td>profile :</td>
			<td>${s.profile}</td>
		</tr>

		<tr>
			<td>고객분류 :</td>
			<td>${s.category}</td>
		</tr>
		<tr>
		<td colspan="2">
		<a href="../safe/m_listMember">목록으로</a>
		<c:if test="${s.id == c.id}">
		<a href="../safe/m_updateMember?id=${s.id}">수정하기</a>
		<a href="../safe/m_deleteMember?id=${s.id}">삭제하기</a>
		</c:if>
		
		</td>
		</tr>
		
	</table>

