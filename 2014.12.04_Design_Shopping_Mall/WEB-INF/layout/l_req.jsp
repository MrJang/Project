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
				<div onmouseover='mouseOver(this, true);' onmouseout='mouseOver(this, false);' style = "cursor : pointer; background : #000000; font-weight:bold; font-size:20px;color:#ffffff; margin-top : 0px;margin-left : 0px;margin-right : 0px;margin-bottom : 0px;padding-top : 0px;padding-left : 0px;padding-right : 0px;padding-bottom : 0px;" onclick = "window.location = 'req_main?selected_designer=none'">
				디자인 의뢰
				</div>
				</center>
<!-- 				<div class="req_button">디자인 의뢰</div> -->
				</td>		
			</c:when>
			<c:when test="${member.mem_auth=='0' || member.mem_auth=='1'}">
				<td align = "center">
				<center>
					<div style = "float : left; width :50%"><input type = "button" value = "Send"    class="Send" onclick = "window.location = 'req_main?selected_designer=none'"/></div>
					<div style = "float : left; width :50%"><input type = "button" value = "Receive" class="Receive" onclick = "window.location = 'req_receive?pageNum=1'"/></div>
				</center>
				</td>
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


