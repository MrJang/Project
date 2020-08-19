<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="/SafeProject/css/default.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<title>Insert title here</title>
	<script type="text/javascript">
	function group_add(id,category){
		
		
		var url = "../safe/messageSelect?id="+id+"&category="+category;
		open(url, "message", "toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=500,height=500");
	
	}
	</script>

</head>


<body>

<form:form commandName="Message" class="blocks">


			<p>
				<label>ID :</label>
				<form:input path="write_id" value="${s.id}" class="text"/>
			</p>
			<p>
				<label>�޴»�� :</label>
				<form:input path="send_id" class="text"/>
				<input type="button" onclick="group_add('${s.id}',${s.category })" value="�׷���">
			</p>
			
			<c:choose>

			<c:when test='${s.category=="1"}'>
				
				<p>
				<label>���з� :</label>
				���ΰ�
				</p>
			</c:when>
			
			<c:when test='${s.category=="2"}'>
				<p>
					<label>���з� :</label>
						    ��ü��
				</p>
			</c:when>
			</c:choose>
			<br>
			<p>
				<label>����:</label>
				<form:textarea path="m_content" class="textarea"/>
				</p>
			
			<p>
				<label>&nbsp;</label>
				<input type="submit" class="btn" value="���"/>
				<input type="reset" class="btn" value="����">
			</p>

</form:form>

</body>
</html>