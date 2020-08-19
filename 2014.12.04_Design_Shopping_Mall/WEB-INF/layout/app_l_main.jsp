<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>layout2</title>
<link href = "../style.css" type="text/css" rel = "stylesheet">
<link href = "../button.css" type="text/css" rel = "stylesheet">
<link rel="stylesheet" href="../example.css">
<link rel="stylesheet" href="../font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="../jquery.slides.min.js"></script>
</head>
<body>	
<center>
	<div style = "width : 240px;  height : 400px; border:0px solid #000000; margin-top : 15px; align :center;">
		<div>
			<tiles:insertAttribute name="slide"/>
		</div>	
		<div style="position: absolute; top:270px;width:230">	
			<table width="240">
				<tr>
					<td>
						<tiles:insertAttribute name="userForm"/>
					</td>
				</tr>
			</table>
		</div>
	</div>
</center>
</body>
</html>