<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script src="http://code.jquery.com/jquery-1.6.3.min.js"></script>
<center>
<b>신청 게시판 (전체글 : ${pageInfo.numOfChildrens})</b> <br>
<a href="../safe/childrenreview?cafe_num=${cafe.c_num}&board_cate=1">후기작성</a>



	<table class="bordered" width = "800">
	<thead>
    	<tr>
       	 <th>아이디</th>        
      	  <th>제목</th>
     	  <th>보기</th>
   		 </tr>
   			 </thead>
		<c:forEach var="review" items="${pageInfo.reviews}">


			
			<tr align="center">
			<form:form>
				
				<td>${review.id}</td>
				<td>
					${review.subject}
				</td>
				<td><a href="../safe/reViewView?num=${review.num}">상세보기</a></td>
			</form:form>
			</tr>

		</c:forEach>
	</table>
	${pageInfo.bottomPartOfHtml} <br>
	
	</center>
