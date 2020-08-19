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
        // b7e1e6 하늘색
        // cdd4da 연한하늘색
        // d9a07f 연한갈색
    } else {
    	tableRow.style.backgroundColor = 'white';
    }
}



</script>
</head>
<body>
<input type = "button" class = "myButton2" value = "이미지 올리기" onClick = "window.location = 'my_design_write'" >
<table width = "80%" border = "0">
<tr>
		<c:forEach var = "canvas" items = "${list}" begin = "0" end = "4">
		<td align = "center" onmouseover='mouseOver(this, true);' onmouseout='mouseOver(this, false);'
			onClick = "window.location = 'getCanvas?can_num=${canvas.can_num}'" class = "b0px">
		${canvas.can_title}
		</td>
		</c:forEach>
	</tr>
	
	
	
	<tr>
		<c:forEach var = "canvas" items = "${list}" begin = "0" end = "4">
			<td align = "center" onmouseover='mouseOver(this, true);' onmouseout='mouseOver(this, false);'
			onClick = "window.location = 'getCanvas?can_num=${canvas.can_num}'" class = "b0px"> 
			<img src = "../upload/sm_${canvas.can_img}" alt = "X">
			</td>
		</c:forEach>
	</tr>
	<tr>
		<c:forEach var = "canvas" items = "${list}" begin = "0" end = "4">    
			<td align = "center" onmouseover='mouseOver(this, true);' onmouseout='mouseOver(this, false);'
			onClick = "window.location = 'getCanvas?can_num=${canvas.can_num}'" class = "b0px">
			 	작성자 : ${canvas.mem_id}<br/>
			 	${canvas.can_date}
			</td>
		</c:forEach>
	</tr>
	
	
	</table>
</body>
</html>