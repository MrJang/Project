<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<center>
<br>

	<c:if test="${pageInfo.numOfChildrens==0}">
		<table class="bordered" width="800">
			<tr>
				<td align="center">
					�Խ��ǿ� ����� ���� �����ϴ�.
				</td>	
			</tr>
		</table>
	
	
	</c:if>
	
	<c:if test="${pageInfo.numOfChildrens>0}">
	
	<table class="bordered" width="800">
		<thead>
    	<tr>
       	 <th>���̵�</th>        
      	  
      	  <th>�ۼ���</th>
      	  <th>�ο�</th>
     	  <th>����</th>
     	  
   		 </tr>
   			 </thead>
		<c:forEach var="ch" items="${pageInfo.childrens}">
		
			
		<tr align="center">
			
				
				<td>${ch.id}</td>
				
				<td><fmt:formatDate value="${ch.reg_date}" type="both" pattern="yyyy�� MM�� dd�� [E]"/></td>
				<td>${ch.member_count}</td>
				<td><a href="../safe/Enterprise?num=${ch.num}&id=${ch.id}">�󼼺���</a></td>
				
				
			</tr>

		</c:forEach>
	</table>
	</c:if>
	${pageInfo.bottomPartOfHtml}
</center>