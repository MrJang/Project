<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>   
<%@taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link href = "../d_shop.css" type="text/css" rel = "stylesheet">
</head>
<body>

<div class="shopping" style= "width:1024px;height:800px;">
<table class="board_table" width="1024px" >
	<tr>
		<td align="center" colspan="7">
			<h4>주문관리</h4>
		</td>
	</tr>
	<tr>
		<td class="board_color" width="5%">
			번호
		</td>
		<td class="board_color" width="20%">
			주문날짜
		</td>
<!-- 		<td class="board_color"> -->
<!-- 			주문번호 -->
<!-- 		</td> -->
		<td class="board_color">
			금액
		</td>
		<td class="board_color">
			수량
		</td>
		<td class="board_color">
			주문자
		</td>
        <td class="board_color">
			입금확인
		</td>
		<td class="board_color">
			입금관리
	   </td>
	   </tr>

			<c:forEach var="bbs"  items="${d_manager_order}" varStatus="i">
		<tr>
		<td class="board_list">

		    ${m_size-(i.count-1) }

		</td>	
		<td class="board_list">
			${bbs.p_date}
		</td>
<!-- 		<td> -->
<%-- 			<a href="/INNO/spring/d_manager_order?money_p_num=${bbs.p_num }">${bbs.p_num }</a> --%>
<!-- 		</td> -->
		<td class="board_list">
			${bbs.p_price}
		</td>
				<td class="board_list">
			${bbs.p_amount}
		</td>
		<td class="board_list">
			${bbs.p_receiver}
		</td>
        <td class="board_list">
			${bbs.p_status}
		</td>
		<td class="board_list" width="90px">
			<c:choose>
				
				<c:when test= "${bbs.p_status.equals('입금대기')}">
				<form:form commandName="d_shop">
				<form:hidden path="p_num" value = "${bbs.p_num}"/>
				<input class="orderbutton" type = "submit" value = "입금확인" >
				</form:form>
				</c:when>
		
				<c:when test= "${bbs.p_status.equals('입금완료')}">
			<div style=float:left;">

				<form:form commandName="d_shop">
				<form:hidden path="p_num" value = "${bbs.p_num}"/>
				<input type="hidden" name="num" value="2"/>
				<input class="orderbutton" type = "submit" value = "입금취소">
				
				</form:form>
			</div>
			<div style=float:left;>	
				<form:form commandName="d_shop">
				<form:hidden path="p_num" value = "${bbs.p_num}"/>
				<input type="hidden" name="num" value="1"/>
				<input class="orderbutton" type = "submit" value = "배송" >
				</form:form>
			</div>
				</c:when>
								
			</c:choose>
			
		</td>
		</tr>
		</c:forEach>	

</table>
</div>


</body>

</html>