<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="http://code.jquery.com/jquery-1.6.3.min.js"></script>


<c:if test='${s.category==2 && request_list != null}'>
	<table border="1" class="bordered" width="800">
		<thead>
    		<tr>
       		 <th>��û ���̵�</th>        
      		  <th>�����</th>
     		  <th>������</th>
     			 <th>��߽ð�</th>
     	 		 <th>�����ð�</th>
     	 	  <th>����</th>
   		 </tr>
   			 </thead>
		<c:forEach var="r" items="${request_list}">
		<c:set var = "crime" value="${fn:split(r.crime_time,'/')}"/>

			<tr align="center">
			
				<td>${r.id}</td>
				<td>${r.departure}</td>
				<td>${r.destination}</td>
				
				<td>${crime[0]}</td>
				<td>${crime[1]}</td>
				<td colspan="2">
				<a href="../safe/requestView?num=${r.num}">�󼼺���</a>
				
				</td>
			
			</tr>

		</c:forEach>
		</table>
		
	</c:if>	
		
		<c:if test='${s.category==1 && children.id != null}'>
		
		<table border="1" class="bordered" width="800">
		 <thead>
    	<tr>
       	 <th>��û ���̵�</th>        
      	  <th>�����</th>
     	  <th>������</th>
     	  <th>��߽ð�</th>
     	  <th>�����ð�</th>
     	    <th>����</th>
   		 </tr>
   			 </thead>
   		
		<c:set var = "crime" value="${fn:split(children.crime_time,'/')}"/>
		
			<tr align="center">
			
				<td>${children.id}</td>
				<td>${children.departure}</td>
				<td>${children.destination}</td>
				<td>${crime[0]}</td>
				<td>${crime[1]}</td>
				<td colspan="2">
				
				<a href="../safe/requestView?num=${children.num}">�󼼺���</a>
				
				</td>
			
			</tr>
			
		</table>
	</c:if>
	
	<c:if test='${s.category==1 && children.id == null}'>
	<table class="bordered" width="800">
			<tr>
				<td align="center">
					��û ������ �����ϴ�.
				</td>	
			</tr>
		</table>
	</c:if>
	
	
	
	

		<a href="../safe/safe_Main">��������</a>
		

