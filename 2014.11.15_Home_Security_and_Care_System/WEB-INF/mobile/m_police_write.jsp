<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<form:form commandName="female">
	
		
			<h1>������Ī��û</h1>
		


			�ð�:
			<form:select path="crime_time">
				<form:options items="${t_list}" />
			</form:select>


			����:
			${female.content }

		
		
					<input type="submit" value="�����ϱ�" />
				
				
					<input type="reset" value="����ϱ�" />
			
</form:form>
