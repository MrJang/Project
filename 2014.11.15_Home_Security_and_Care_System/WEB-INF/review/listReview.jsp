<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script src="http://code.jquery.com/jquery-1.6.3.min.js"></script>
<center>
<b>��û �Խ��� (��ü�� : ${pageInfo.numOfChildrens})</b> <br>
<a href="../safe/childrenreview?cafe_num=${cafe.c_num}&board_cate=1">�ı��ۼ�</a>



	<table class="bordered" width = "800">
	<thead>
    	<tr>
       	 <th>���̵�</th>        
      	  <th>����</th>
     	  <th>����</th>
   		 </tr>
   			 </thead>
		<c:forEach var="review" items="${pageInfo.reviews}">


			
			<tr align="center">
			<form:form>
				
				<td>${review.id}</td>
				<td>
					${review.subject}
				</td>
				<td><a href="../safe/reViewView?num=${review.num}">�󼼺���</a></td>
			</form:form>
			</tr>

		</c:forEach>
	</table>
	${pageInfo.bottomPartOfHtml} <br>
	
	</center>
