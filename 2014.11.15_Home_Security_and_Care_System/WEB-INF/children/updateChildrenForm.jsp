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
				<td>����� :</td>
				<td><form:input path="departure" /></td>
			</tr>
			<tr>
				<td>������ :</td>
				<td><form:input path="destination" /></td>
			</tr>
			<tr>
				<td>��߽ð� :</td>
				<td>
				
					<form:select path="start_time">
						<form:options items="${t_list}" />
						
					</form:select>
				
				</td>
				</tr>
				
				<tr>
				<td>�����ð� :</td>
				<td>
					<select name="stop_time">
						<c:forEach items="${t_list}" var="stime">
							<option value="${stime}">${stime}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>��û�з� :</td>
				<td><form:checkbox path="request" value="personal" label="���ν�û" />
					<form:checkbox path="request" value="group" label="�׷��û" /></td>
			</tr>
			<tr>
				<td>Ư�̻��� �Է� :</td>
				<td><form:textarea path="report"/></td>
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
			<input type="submit" value="���"> &nbsp;&nbsp;
			<input type="reset" value="����">
		</td>
	</tr>
</table>
	</form:form>


