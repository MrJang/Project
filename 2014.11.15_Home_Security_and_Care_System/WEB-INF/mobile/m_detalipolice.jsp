<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="http://code.jquery.com/jquery-1.6.3.min.js"></script>

 <style>
 
 </style>  
 <script>
 
 var i=0;
function selectReview(num) {
	
	if(i==0){
		$("#select").show();
		$("#select").load("m_detalireview?num="+num);
		i = 2;
	}else if(i==2) {
		$("#select").hide();
		i = 0;
	}
	
}


 </script>

 
 <form:form commandName="female">
  
 <center>경찰관:    ${female.e_id} 경위</center>           
 <div style="float:right;">종합평점: ${female.s_star}</div>
 <c:if test="${female.s_star=='0' }"><h2>등록된 후기가 없습니다.</h2></c:if>
 
 

<table>
<thead>
<tr>
<th>작성자</th>
<th>제목</th>
<th>조회수</th>

</tr>
</thead>
<c:forEach var="p" items="${list}">
<tr>

<td width="100">${p.id }</td>
<td width="200"><a href="#" onclick="selectReview('${p.num}');" >${p.subject}</a></td>
<td width="50">${p.readcount }</td>
</tr>
</c:forEach>
</table>



</form:form>
<div id="select">
</div>

