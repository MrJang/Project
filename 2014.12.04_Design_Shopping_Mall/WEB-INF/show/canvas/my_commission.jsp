<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href = "../style.css" type="text/css" rel = "stylesheet">
<script type="text/javascript">
function mouseOver(tableRow, mouse){
    if (mouse) {
        tableRow.style.cursor = 'pointer';
        tableRow.style.backgroundColor = '#b7e1e6';
        // b7e1e6 �ϴû�
        // cdd4da �����ϴû�
        // d9a07f ���Ѱ���
    } else {
    	tableRow.style.backgroundColor = 'white';
    }
}



</script>
</head>
<body>
<table width = "80%" border = "1">
<tr>
		<c:forEach var = "request" items = "${list}" begin = "0" end = "4">
		<td align = "center" onmouseover='mouseOver(this, true);' onmouseout='mouseOver(this, false);'
			onClick = "window.location = 'getCanvas?can_num=${request.req_num}'" class = "b0px">
		${request.req_name}
		</td>
		</c:forEach>
	</tr>
	
	
	
	<tr>
		<c:forEach var = "request" items = "${list}" begin = "0" end = "4">
			<td align = "center" onmouseover='mouseOver(this, true);' onmouseout='mouseOver(this, false);'
			onClick = "window.location = 'getCanvas?can_num=${request.req_num}'" class = "b0px"> 
			<img src = "../upload/sm_${request.req_img}" alt = "X">
			</td>
		</c:forEach>
	</tr>
	<tr>
		<c:forEach var = "request" items = "${list}" begin = "0" end = "4">    
			<td align = "center" onmouseover='mouseOver(this, true);' onmouseout='mouseOver(this, false);'
			onClick = "window.location = 'getCanvas?can_num=${request.req_num}'" class = "b0px">
			 	�ۼ��� : ${request.req_sender}<br/>
			 	${request.req_date}
			</td>
		</c:forEach>
	</tr>
	
	
	</table>
</body>
</html>