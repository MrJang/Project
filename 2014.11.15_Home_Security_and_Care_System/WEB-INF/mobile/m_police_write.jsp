<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<form:form commandName="female">
	
		
			<h1>경찰매칭신청</h1>
		


			시간:
			<form:select path="crime_time">
				<form:options items="${t_list}" />
			</form:select>


			지역:
			${female.content }

		
		
					<input type="submit" value="예약하기" />
				
				
					<input type="reset" value="취소하기" />
			
</form:form>
