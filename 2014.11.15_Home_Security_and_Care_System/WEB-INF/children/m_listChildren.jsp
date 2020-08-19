<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="http://code.jquery.com/jquery-1.6.3.min.js"></script>
<center>
<br>

	<c:if test="${pageInfo.numOfChildrens==0}">
		<table class="bordered" width="800">
			<tr>
				<td align="center">
					게시판에 저장된 글이 없습니다.
				</td>	
			</tr>
		</table>
	
	
	</c:if>
	
	<c:if test="${pageInfo.numOfChildrens>0}">
	
	<table class="bordered" width="400" border="1" style=" border-color: white; font-size: 8">
		<thead>
    	<tr>
       	 <th>아이디</th>        
      	 <th>작성일</th>
      	 <th>인원</th>
     	 <th>보기</th>
     	  
   		 </tr>
   			 </thead>
		<c:forEach var="ch" items="${pageInfo.childrens}">
		
			
		<tr align="center">
			
				
				<td>${ch.id}</td>
				
				<td><fmt:formatDate value="${ch.reg_date}" type="both" pattern="yy-MM-dd"/></td>
				<td>${ch.member_count}</td>
				<td><a href="../safe/m_Enterprise?num=${ch.num}&id=${ch.id}">상세보기</a></td>
				
				
			</tr>

		</c:forEach>
	</table>
	</c:if>
	${pageInfo.bottomPartOfHtml}
</center>

