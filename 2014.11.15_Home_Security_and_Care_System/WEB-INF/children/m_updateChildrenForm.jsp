<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


	<form:form commandName="c">

		<table border="1">
			<tr>
				<td>ID :</td>
				<td>${s.id}</td>
			</tr>
			<tr>
				<td>출발지 :</td>
				<td><form:input path="departure" /></td>
			</tr>
			<tr>
				<td>목적지 :</td>
				<td><form:input path="destination" /></td>
			</tr>
			<tr>
				<td>출발시간 :</td>
				<td>
				
					<form:select path="start_time">
						<form:options items="${t_list}" />
						
					</form:select>
				
				</td>
				</tr>
				
				<tr>
				<td>도착시간 :</td>
				<td>
					<select name="stop_time">
						<c:forEach items="${t_list}" var="stime">
							<option value="${stime}">${stime}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>신청분류 :</td>
				<td><form:checkbox path="request" value="personal" label="개인신청" />
					<form:checkbox path="request" value="group" label="그룹신청" /></td>
			</tr>
			<tr>
				<td>특이사항 입력 :</td>
				<td><form:textarea path="report"/></td>
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
			<input type="submit" value="등록"> &nbsp;&nbsp;
			<input type="reset" value="리셋">
		</td>
	</tr>
</table>
	</form:form>


