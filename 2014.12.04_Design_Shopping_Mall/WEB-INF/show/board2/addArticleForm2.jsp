<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>addArticleForm.jsp</title>
<link href="../style.css" type="text/css" rel="stylesheet">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js">
	
</script>
<script type="text/javascript">
	window.onload = function() {
		jsSetSub(bod_title, 'off');
		jsSetCntt(bod_content, 'off');
	}

	function jsSetSub(obj, type) {
		if (type == "on") {
			if (obj.value == "     제목") {
				obj.value = "";
			}
		}
		if (type == "off") {
			if (obj.value == "") {
				obj.value = "     제목";
			}
		}
	}
	function jsSetCntt(obj, type) {
		if (type == "on") {
			if (obj.value == "\n\n\n\n\n\n\n\n\n					     내용") {
				obj.value = "";
			}
		}
		if (type == "off") {
			if (obj.value == "") {
				obj.value = "\n\n\n\n\n\n\n\n\n					     내용";
			}
		}
	}
</script>
</head>

<body>
	<center>
		<div style="width: 100%; vertical-align: top; height: 50px; float: left;">
			<table align="center" style="vertical-align: top; width: 697px; height: 100%; margin-right: 150px;">
				<tr style="vertical-align: top;">
					<td align="center" colspan="6" class="b0px" height="10px">
						<h2>자유 게시판</h2> 
						<%-- 					전체 : (${listsize}) --%>
					</td>
				</tr>
			</table>
		</div>
		<form:form commandName="board" enctype="multipart/form-data">
			<table border="0">
				<tr>
					<td align="center">
						<%-- 		<form:input path = "num" type = "hidden" cssClass = "normal" cssErrorClass = "errors"/> --%>
						<form:input path="mem_id" value="${member.mem_id}" type="hidden" />
						<%--   		<form:textarea path = "bod_title" cols="84" rows="1" onFocus="jsSetSub(this, 'on')" onBlur="jsSetSub(this, 'off')"/> --%>
						<form:input path="bod_title" size="82" onFocus="jsSetSub(this, 'on')" onBlur="jsSetSub(this, 'off')" style = "text-align : center;"/>
					</td>
				</tr>
				<tr>
					<td>
						<form:textarea path="bod_content" wrap="hard" cols="84" rows="20" onFocus="jsSetCntt(this, 'on')" onBlur="jsSetCntt(this, 'off')" />
					</td>
				</tr>
				<tr>
					<td>
						
					</td>
				</tr>
				<tr>
					<td>
						<div style = "float : left;">
							<input type="button" value="목록으로" class="board_submit_button0" onClick="window.location = 'board2?pageNum=${pageNum}'" />
						</div>
						<div style = "float : left; text-align: center;">
							<form:input path="uploadfile" type="file" cols="30" class = "uploadfile"/>
						</div>	
						<div style = "float : left;">
							<input type="submit" value="등록" class="board_submit_button" />
<!-- 							<input type="reset" value="리셋" class="board_submit_button0" /> -->
						</div>
					</td>
				</tr>
		</table>
		</form:form>
	</center>
</body>
</html>