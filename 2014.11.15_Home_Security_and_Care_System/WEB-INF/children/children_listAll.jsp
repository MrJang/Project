<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<table class="bordered" width="800">
		<thead>
    	<tr>
       	 <th>아이디</th>        
      	  
      	  <th>작성일</th>
      	  
     	  <th>보기</th>
     	  
   		 </tr>
   			 </thead>
		<c:forEach var="ch" items="${list}">
		
			
		<tr align="center">
			
				
				<td>${ch.id}</td>
				
				<td><fmt:formatDate value="${ch.reg_date}" type="both" pattern="yyyy년 MM월 dd일 [E]"/></td>
				<c:if test="${ch.category==2}">
				<td><a href="../safe/Enterprise?num=${ch.num}&id=${ch.id}">상세보기</a></td>
				</c:if>
				
				<c:if test="${ch.category==1}">
				<td><a href="../safe/schedulerList?s_id=${ch.id}">상세보기</a></td>
				</c:if>
				
			</tr>

		</c:forEach>
	</table>
</body>
</html>