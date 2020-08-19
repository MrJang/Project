<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>   
<%@taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link href = "../style.css" type="text/css" rel = "stylesheet">
<script src = "http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js">
</script>
<script type = "text/javascript">
function body_onload(){
	jsSetSub(bod_title, 'off');
	jsSetCntt(bod_content, 'off');
	
}
function reset(){
	
// 	$('#bod_title').val("　　　　　　　　　　　　　　　　　　　　　　제목");
// 	$('#bod_content').val("\n\n\n\n\n\n\n\n\n\n\n\n　　　　　　　　　　　　　　　　　　　　　　내용");
	$('#bod_title').val("");
	$('#bod_content').val("");
// 	jsSetSub(bod_title, 'on');
// 	jsSetCntt(bod_content, 'on');
	
	
	
}
function jsSetSub (obj, type){
	if(type == 'on'&&obj.value=="　　　　　　　　　　　　　　　　　　　　　　제목"){
		obj.value = "";
	}else if(type == 'off'&&obj.value==""){
	    obj.value = "　　　　　　　　　　　　　　　　　　　　　　제목";
	}
	
}
function jsSetCntt (obj, type){
	if(type == 'on'&&obj.value=="\n\n\n\n\n\n\n\n\n\n\n\n　　　　　　　　　　　　　　　　　　　　　　내용"){
		obj.value = "";
	}else if(type == 'off'&&obj.value==""){
	    obj.value = "\n\n\n\n\n\n\n\n\n\n\n\n　　　　　　　　　　　　　　　　　　　　　　내용";
	}
}

</script>
</head>


<body onload ="body_onload();">
<div style="width: 797px; vertical-align: top; height: 80px; float: left;">
		<table align="center" style="vertical-align: top; width: 697px; height: 100%; margin-right: 150px;" border="0">
			<tr style="vertical-align: top;">
				<td align = "center" colspan="6" class="b0px" height="10px">
					<h2>공지사항</h2>
<%-- 					전체 : (${listsize}) --%>
				</td>
			</tr>
		</table>
		</div>
<center>
<div style="width: 797px; vertical-align: top; height: 500px; float: left;">
	<table align = "center" style="vertical-align: top; width: 697px; height: 100%; margin-right: 150px;" border="0">
		<tr>
			<td>
				<form:form commandName = "board" enctype = "multipart/form-data">
					<center>
					<form:input path = "mem_id" value = "${member.mem_id}" type = "hidden"/>
	  				<form:textarea path = "bod_title" id = "bod_title" cols="83" rows="1" onFocus="jsSetSub(this, 'on')" onBlur="jsSetSub(this, 'off')" value = "제목"/><br/>	
					<form:textarea path = "bod_content" id = "bod_content" wrap="hard" cols="83" rows="25" onFocus="jsSetCntt(this, 'on')" onBlur ="jsSetCntt(this, 'off')" value="내용"/><br/>
 					</center>
 					
 					<div style = "background: #EEEEEE; width : 100%;">
 					
 					<div style = "width :30%; float : left;">
 						<span style = "float : left; text-align:left;">
 							<input type = "button" value = "리셋" onClick = "reset();"/>	
 						</span>
 					</div>
 					
 					<div style = "width :30%; float : left;">
 						<span style = "float : center; text-align:center;">
 							<form:input path = "uploadfile" type = "file" cols = "30" />
 						</span>
 					</div>
 					
 					<div style = "width :30%; float : right;">
 						<span style = "float : right; text-align:right;">
							<input type = "submit" value = "등록"/>
						</span>
 					</div>
 					
					</div>
					
				</form:form>
			</td>
		</tr>				
	</table>
</div>	
</center>
</body>
</html>