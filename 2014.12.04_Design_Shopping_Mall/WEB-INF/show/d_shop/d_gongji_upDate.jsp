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
<center>
<div  style= "width:1024px;height:800px;">
	<form:form commandName = "d_shop">
		<h3>�۾�����Ʈ</h3>
		<table class="board_table">
			<tr>
				
				<td class="board_color" width="100px">ī�װ�</td>
				<td>
					
							<select name = "dsh_category">
							<option value="1">��������</option>
							<option value="2">qna</option>
							</select>
				</td>
			</tr>
			<tr>	
				<td class="board_color">����</td>
				<td class="board_list">
					<input type="text" name="dsh_title" value = "${d_gongji_upDate.dsh_title }"/>
				</td>
				
				
			</tr>
			<tr>
				<td class="board_color">�ۼ���</td>
				<td class="board_list">
				${member.mem_id}
				<input type="hidden" name="dsh_writer"/>
					
				</td>
			</tr>
			
			<tr>
				<td class="board_color">����</td>
				<td class="board_list">
					<textarea cols="50" rows="20"name="dsh_content"  >${d_gongji_upDate.dsh_content }</textarea>
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
					<input class="subButton"type="submit" value="���">
					<input class="subButton"type="reset" value="����">
				</td>
			</tr>
		</table>
	</form:form>
	</div>
</center>
</html>