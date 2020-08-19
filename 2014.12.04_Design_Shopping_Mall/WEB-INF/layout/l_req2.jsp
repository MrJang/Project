<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>   
<%@taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>design_req</title>
<style>
	input:focus {
    	background-color: aliceblue;
	} 
	textarea:focus{
    	background-color: aliceblue;
	}
	
</style>
<script type="text/javascript">
function mouseOver(tableRow, mouse){
    if (mouse) {
//         tableRow.style.cursor = 'pointer';
        tableRow.style.backgroundColor = 'white';
        tableRow.childNodes.style.Color = 'black';
        // b7e1e6 하늘색
        // cdd4da 연한하늘색
        // d9a07f 연한갈색
    } else {
    	tableRow.style.backgroundColor = 'black';
    }
}
</script>
</head>
<link href="../style.css" type="text/css" rel="stylesheet">
<link href="../button.css" type="text/css" rel="stylesheet">
<body>
<table width = "785px" style = "border-color : black; border-style : groove; border-bottom : 0px;">
	<tr>
		<c:choose>
			<c:when test="${member.mem_auth=='2'}">
				<td align = "center">
					<center>
						<div class = "nopdnomg2" style = "background : black; font-weight:bold; font-size:20px; color:#ffffff; cursor:pointer;" onClick = "window.location = 'req_Dlist?pageNum=1'">
							디자인 의뢰
						</div>
					</center>
				</td>		
			</c:when>
			<c:when test="${member.mem_auth=='0' || member.mem_auth=='1'}">
				
				<c:choose>
					<c:when test="${req_menu == '1' }">
					<td align = "center" width = "50%" style = "background: red;"class = "blinkk">
					<center>
						<div class = "nopdnomg2" style = "background : #89E7D0; font-weight:bold; font-size:20px; color:#000000; cursor:pointer;" onClick = "window.location = 'req_Dlist?pageNum=1'">
							디자인 의뢰
						</div>
					</center>
				</td>
				<td align = "center" width = "50%">
					<center>
						<div class = "nopdnomg2" style = "background : black; font-weight:bold; font-size:20px; color:#ffffff; cursor:pointer;" onClick = "window.location = 'req_Dreceive?pageNum=1'">
							받은 의뢰
						</div>
					</center>
				</td>
					</c:when>
					<c:when test="${req_menu == '2' }">
					<td align = "center" width = "50%" style = "background: black;">
					<center>
						<div class = "nopdnomg2" style = "background : black; font-weight:bold; font-size:20px; color:#ffffff; cursor:pointer;" onClick = "window.location = 'req_Dlist?pageNum=1'">
							디자인 의뢰
						</div>
					</center>
				</td>
				<td align = "center" width = "50%" style = "background: red;"class = "blinkk">
					<center>
						<div class = "nopdnomg2" style = "background : #94B8FF; font-weight:bold; font-size:20px; color:#000000; cursor:pointer;" onClick = "window.location = 'req_Dreceive?pageNum=1'">
							받은 의뢰
						</div>
					</center>
				</td>
					</c:when>
				</c:choose>
				
			</c:when>
		</c:choose>
	</tr>
</table>
<table style = "width : 785px;  border-color : black; border-style : outset; ">
	<tr>
		<td style = "height : 718px; vertical-align: top; ">
			<tiles:insertAttribute name="body"/>
		</td>
	</tr>
</table>
</body>
</html>