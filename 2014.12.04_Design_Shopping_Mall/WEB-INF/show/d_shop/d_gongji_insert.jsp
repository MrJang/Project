<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>   
<%@taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link href = "../d_shop.css" type="text/css" rel = "stylesheet">
</head>
<body>

<h3>글쓰기</h3>
<center>
<div  style= "width:1024px;height:800px;">
	<form:form commandName = "d_shop">
	<input type = "hidden" name= "des_num1" value = "${re_des_num }">
		
		<table width="500px"height="600px">
			<tr>
				
				<td class="board_color" width="100px">카테고리</td>
				<td class="board_list">
				<c:choose>
						<c:when test="${member.mem_auth==1 && re_des_num==cu_des_num}">				
							<select name = "dsh_category">
							<option value="1">공지사항</option>
							<option value="2">qna</option>
							</select>
					</c:when>
					<c:otherwise>
							<select name = "dsh_category">
							<option value="2">qna</option>
							</select>
					
					</c:otherwise>
				</c:choose>
				
				</td>
			</tr>
			<tr>	
				<td class="board_color">제목</td>
				<td class="board_list">
					<input type="text" size="20px"name="dsh_title"/>
				</td>
				
				
			</tr>
			<tr>
				<td class="board_color">작성자</td>
				<td class="board_list">${member.mem_id}
					<input type="hidden" name="dsh_writer"value = "${member.mem_id }"/>
					
					
				</td>
			</tr>
			
			<tr>
				<td class="board_color">내용</td>
				<td class="board_list">
					<textarea cols="50" rows="20"name="dsh_content"></textarea>
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<input class="subButton"type="submit" value="RegisT">
					<input  class="subButton"type="reset" value="ReseT">
				</td>
			</tr>
		</table>
	</form:form>
	</div>
</center>
</body>
</html>