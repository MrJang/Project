<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="http://code.jquery.com/jquery-1.6.3.min.js"></script>

 <form:form commandName="female">
         
 

<table class="bordered" width="550">
<tr>
<td>작성자</td>
<td>제목</td>
<td>상세내용</td>
<td>평점</td>

</tr>


<tr>

<td>${female.id }</td>
<td>${female.subject}</td>
<td>${female.content }</td>
<td>${female.s_star }</td>
</tr>

</table>

</form:form>
</div>
