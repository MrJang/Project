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
			<h4>�ֹ�����</h4>
		</td>
	</tr>
	<tr>
		<td class="board_color" width="5%">
			��ȣ
		</td>
		<td class="board_color" width="20%">
			�ֹ���¥
		</td>
<!-- 		<td class="board_color"> -->
<!-- 			�ֹ���ȣ -->
<!-- 		</td> -->
		<td class="board_color">
			�ݾ�
		</td>
		<td class="board_color">
			����
		</td>
		<td class="board_color">
			�ֹ���
		</td>
        <td class="board_color">
			�Ա�Ȯ��
		</td>
		<td class="board_color">
			�Աݰ���
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
				
				<c:when test= "${bbs.p_status.equals('�Աݴ��')}">
				<form:form commandName="d_shop">
				<form:hidden path="p_num" value = "${bbs.p_num}"/>
				<input class="orderbutton" type = "submit" value = "�Ա�Ȯ��" >
				</form:form>
				</c:when>
		
				<c:when test= "${bbs.p_status.equals('�ԱݿϷ�')}">
			<div style=float:left;">

				<form:form commandName="d_shop">
				<form:hidden path="p_num" value = "${bbs.p_num}"/>
				<input type="hidden" name="num" value="2"/>
				<input class="orderbutton" type = "submit" value = "�Ա����">
				
				</form:form>
			</div>
			<div style=float:left;>	
				<form:form commandName="d_shop">
				<form:hidden path="p_num" value = "${bbs.p_num}"/>
				<input type="hidden" name="num" value="1"/>
				<input class="orderbutton" type = "submit" value = "���" >
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