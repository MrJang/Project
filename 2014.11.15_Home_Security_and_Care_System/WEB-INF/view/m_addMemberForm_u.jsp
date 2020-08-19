<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js">
</script>
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.css"/>
    <script src = "http://code.jquery.com/jquery-1.7.2.min.js"></script>
    <script src = "http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.js"></script>
    
	<script type="text/javascript" charset="EUC-KR" src="cordova-2.5.0.js"></script>

<script type="text/javascript">
	function zipcodebtn() {
		var url = "../safe/zipcode";
		open(url,"zipcode", "toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=600,height=600");
	}
	
 
 	
	$(document).ready(function(){
		$('#joinidcheck').click(function(){
			$.getJSON('m_checkjoinid/'+$('#id').val(), function(ajaxDao){
				
			if(ajaxDao.duplicated == true) { //중복값이 true값을 가지면
				alert('이미 등록된 로그인 ID 입니다.');
			}else {
				alert('사용할 수 있는 로그인 ID 입니다.');
				}
			}
			);
		}
		);
	}
	);
 		

</script>
</head>
<body>

	<form:form commandName="s" enctype="multipart/form-data">

		<table border="1">

			<tr>
				<td>id : <form:input path="id" /><br>
				</td>
				
				<td><input id="joinidcheck" type="button" value="중복검사"/></td>
			</tr>
			<tr>
				<td>password : <form:password path="password" /><br>
				</td>
			</tr>
			<tr>
				<td>name : <form:input path="name" /><br>
				</td>
			</tr>

			<c:choose>
				<c:when test='${s.category=="2"}'>
					<tr>
						<td>업체명 : <form:input path="e_name" /><br>
						</td>
					</tr>
				</c:when>
			</c:choose>

			<tr>
				<td>phone : <form:input path="phone" /><br>
				</td>
			</tr>
			<tr>
				<td>email : <form:input path="email" /><br>
				</td>
			</tr>
			<tr>
				<td>address : <form:input path="address" />
				</td>
				<td><input type="button" value="주소찾기" onclick="zipcodebtn();"><br>
				</td>
			</tr>
			<tr>
				<td>profile :<input type="file" name="file"><br>
				</td>
			</tr>

			<tr>
				<td colspan="2"><input type="submit" value="등록">
					&nbsp;&nbsp; <input type="reset" value="리셋"></td>
			</tr>
		</table>

	</form:form>

</body>
</html>