<%@page import="yjc.spring.bean.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>   
<%@taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>articleInfo.jsp</title>
<link href = "../style.css" type="text/css" rel = "stylesheet">
<style type="text/css">
	#content{
		border-width: 3px;
		border-style: dashed;
		border-color: gray;
	}
</style>
</head>
<body>
<form:form commandName = "board">
<table id="content" width = "100%">
	<tr><td>제목 : ${board.bod_title}</td></tr>
	<tr><td>날짜 : ${board.bod_date}</td></tr>
	<tr><td>조회수 : ${board.bod_readcount}</td></tr>
	<tr><td>작성자 : ${board.mem_id}</td></tr>
<!-- 		<td> -->
<%-- 		ip : ${board.ip}	 --%>
<!-- 		</td> -->
	</tr>	
		<c:choose>
			<c:when test="${board.bod_img == 'null.jpg'}">
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan = "5" align = "center">
						<img src = "../upload/${board.bod_img}" alt = "이미지 로딩중" width="515px" style = "height:200px;">
					</td>
				</tr>	
			</c:otherwise>
		</c:choose>
	<tr>
		<td colspan = "5" class = content>
		<pre>${board.bod_content}</pre>
		</td>
	</tr>
</table>
<!-- <div id="commentList"></div> -->

<!-- <div id="commentAdd"> -->
<%-- 	<form action="" name="addForm" title = "a"> --%>
<!-- 	이름: <input type="text" name="name" size="10"><br/> -->
<!-- 	내용: <textarea name="content" cols="20" rows="2"></textarea><br/> -->
<!-- 	<input type="button" id = "commentbutton" value="등록" onclick="addComment()"/> -->
<%-- 	</form> --%>
<!-- </div> -->

<!-- <div id="commentUpdate" style="display: none"> -->
<%-- 	<form action="" name="updateForm"> --%>
<!-- 	<input type="hidden" name="id" value=""/> -->
<!-- 	이름: <input type="text" name="name" size="10"><br/> -->
<!-- 	내용: <textarea name="content" cols="20" rows="2"></textarea><br/> -->
<!-- 	<input type="button" id = "commentbutton" value="등록" onclick="updateComment()"/> -->
<!-- 	<input type="button" class = "commentcancel" value="취소" onclick="cancelUpdate()"/> -->
<%-- 	</form> --%>
<!-- </div> -->

<c:choose>
	
	<c:when test="${member.mem_auth=='0' || member.mem_id==board.mem_id}">
		<input type = "button" class = "myButton3" value = "수정" onClick = "window.location ='app_free_updateArticle2?num=${board.bod_num}&pageNum=${param.pageNum}'">
		<input type = "button" class = "myButton3" value = "삭제" onClick = "window.location = 'app_free_deleteArticle2?num=${board.bod_num}&pageNum=${param.pageNum}'">
	</c:when>
		
</c:choose>
	<div style = "float : right; text-align:right;">
		<input type = "button" class = "myButton3" value = "목록" onClick = "window.location = 'app_free_board2?pageNum=${param.pageNum}'">
	</div>
</form:form>
	
</body>
</html>