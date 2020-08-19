<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<link rel="stylesheet" href="../css/reveal.css">	
<link rel="stylesheet" href="../css/button.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.6.min.js"></script>
	<script type="text/javascript" src="../js/jquery.reveal.js"></script>
	<script src="http://code.jquery.com/jquery-1.6.3.min.js"></script>
	<style type="text/css">
			body { font-family: "HelveticaNeue","Helvetica-Neue", "Helvetica", "Arial", sans-serif; }
			.big-link { display:block; text-align: center; font-size: 14; color: #06f; }

		</style>
<script>



function female_sysListSuccess(name) {

	
	location.href="m_female_sysListSuccess?name="+name;
}
</script>
	<center>
	<h2>후기내역</h2>
	</center>

<form:form commandName="female">
<table   id="tab" border="1" cellspacing="0" cellpadding="5" align="center" >
<tr>
<td align="center" width="50">경찰서</td>
<td align="center" width="60">경찰관</td>
<td align="center">시간</td>
<td align="center">후기작성</td>
</tr>

 <c:forEach var="p" items="${list}">
 <tr>
 <td align="center">${p.content }</td>
 <td align="center" id="name">${p.e_id }경찰관</td>
 <td align="center">${p.reg_date}</td>
 <td align="center"><input type="button" value="후기작성하기" onclick="female_sysListSuccess('${p.e_id}');" ></td>
  </tr>
 </c:forEach>

 </table>
</form:form>
<center>
<div>
최근 30일만 보여줍니다.
</div>
</center>