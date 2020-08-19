<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


	<form:form commandName="c">

		<table border="1">
			<tr>
				<td>id :</td>
				<td>${s.id}</td>
			</tr>

			<tr>
				<td>제목 :</td>
				<td><form:input path="subject" /></td>
			</tr>

			<tr>
				<td>내용 :</td>
				<td><form:input path="content" /></td>
			</tr>

			<tr>
				<td>추천 :</td>
				<td>
				<form:radiobutton value="1" path="s_star" label="1점" /> 
				<form:radiobutton value="2" path="s_star" label="2점" /> 
				<form:radiobutton value="3" path="s_star" label="3점" /> 
				<form:radiobutton value="4" path="s_star" label="4점" /> 
				<form:radiobutton value="5" path="s_star" label="5점" /></td>
			</tr>


			<tr>
				<td colspan="2"><input type="submit" value="수정">
					&nbsp;&nbsp; <input type="reset" value="리셋"></td>
			</tr>
		</table>
	</form:form>
