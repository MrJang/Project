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
       		 <th>신청 아이디</th>        
      		  <th>출발지</th>
     		  <th>목적지</th>
     			 <th>출발시간</th>
     	 		 <th>도착시간</th>
     	 	  <th>보기</th>
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
				<a href="../safe/requestView?num=${r.num}">상세보기</a>
				
				</td>
			
			</tr>

		</c:forEach>
		</table>
		
	</c:if>	
		
		<c:if test='${s.category==1 && children.id != null}'>
		
		<table border="1" class="bordered" width="800">
		 <thead>
    	<tr>
       	 <th>신청 아이디</th>        
      	  <th>출발지</th>
     	  <th>목적지</th>
     	  <th>출발시간</th>
     	  <th>도착시간</th>
     	    <th>보기</th>
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
				
				<a href="../safe/requestView?num=${children.num}">상세보기</a>
				
				</td>
			
			</tr>
			
		</table>
	</c:if>
	
	<c:if test='${s.category==1 && children.id == null}'>
	<table class="bordered" width="800">
			<tr>
				<td align="center">
					신청 내역이 없습니다.
				</td>	
			</tr>
		</table>
	</c:if>
	
	
	
	

		<a href="../safe/safe_Main">메인으로</a>
		

