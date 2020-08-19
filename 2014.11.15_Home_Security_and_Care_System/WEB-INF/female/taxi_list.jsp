<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<script src="http://code.jquery.com/jquery-1.6.3.min.js"></script>
<center>
<a href = "../safe/t_oneweek" type="button" >일주일</a>&nbsp;&nbsp;
<a href = "../safe/t_onemonth" type="button" >1개월</a>&nbsp;&nbsp;
<a href = "../safe/t_threemonth" type="button" >3개월</a>&nbsp;&nbsp;
<a href = "../safe/t_findTaxi" type="button" >전체보기</a>&nbsp;&nbsp;
<br><br>

<table class="bordered" width="800">
		<thead>
    	<tr>
       	 <th rowspan="2" align="center">휴대폰번호</th>        
      	  <th rowspan="2" align="center">차량번호</th>
     	  <th rowspan="2" align="center">승차시간</th>
     	   <th rowspan="2" align="center">하차시간</th>
     	    <th colspan="3" align="center">주행정보</th>
     	  	<th rowspan="2" align="center">SMS발송여부</th>
     	</tr>
     	
     	<tr>
     	 <th>거리</th>
			<th>시간</th>
			<th>요금</th>
     	</tr>
   			
   	</thead>
		
		
		<c:forEach var="female" items="${list}">
			<c:set var="crime" value="${fn:split(female.crime_time, ',')}" />
			<c:set var="drive" value="${fn:split(female.drive, ',')}" />
				<tr>
					<form:form>
			<td align="center" >${female.phone}</td>
			<td align="center">${female.car_num}</td>
			<td align="center">${crime[0]}</td>
			<td align="center">${crime[1]}</td>
			<td align="center">${drive[0]}</td>
			<td align="center">${drive[1]}</td>
			<td align="center">${drive[2]}</td>
			<td align="center">${female.notice}</td>

 			
			</form:form>
			</tr>
		</c:forEach>
	</table>
	</center>
</body>
</html>