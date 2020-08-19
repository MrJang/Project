<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>articleList.jsp</title>
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
function mouseOver1(tableRow, mouse){
    if (mouse) {
        tableRow.style.cursor = 'pointer';
//         alert(tableRow.childnode);
        
        // b7e1e6 하늘색
        // cdd4da 연한하늘색
        // d9a07f 연한갈색
    } else {
//     	tableRow.style.backgroundColor = 'white';
    }
}
</script>
</head>
<body>
<!-- 	<table align = "center"> -->
<!-- 		<tr> -->
<%-- 		<c:forEach var = "member" items = "${sablist}"  begin = "0" end = "2" > --%>
<%-- 			<td class = "td1" width = "20%" onmouseover='mouseOver(this, true);' onmouseout='mouseOver(this, false);'onClick = "window.location = 'getArticle1?num=${member.bod_num}&pageNum=1'"> --%>
<%-- 			<img src = "../upload/sm_${member.bod_img}" alt = "X"> --%>
<!-- 			</td> -->
<%-- 		</c:forEach> --%>
<!-- 		</tr> -->
<!-- 	</table> -->
<br/><br/>
	<table align = "center" width = "100%" style = "border:1px solid #000000;">
		<c:forEach var = "member" items = "${sablist}"  begin = "0" end = "2" >
			<tr>
				<td width = "100%" onmouseover='mouseOver1(this, true);' onmouseout='mouseOver1(this, false);'onClick = "window.location = 'getArticle1?num=${member.bod_num}&pageNum=1'">
					${member.bod_title}
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>