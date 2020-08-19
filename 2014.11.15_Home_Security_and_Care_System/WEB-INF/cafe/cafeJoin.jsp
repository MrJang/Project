<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<table class="bordered">
	<thead>
		<th width="150">check</th>
		<th width="150">ID</th>
	</thead>
	<form:form commandName="c_member">
		<c:forEach var="cafe_member" items="${cafe_member}">
			
			<tbody>
			<c:if test="${cafe_member.cafe_select == 0}">
				<tr bgcolor="#ffffff">
					<td><input type="checkbox" id = "member_select"  name="cafe_member" value="${cafe_member.id}"/></td>
					<td>${cafe_member.id}</td>
				</tr>
			</c:if>	
			</tbody>
		
		</c:forEach>
		<input type="submit" value="가입하기">
	</form:form>
</table>


