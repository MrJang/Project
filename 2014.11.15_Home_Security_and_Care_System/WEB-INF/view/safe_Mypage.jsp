<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
			<c:when test='${s.id=="admin"}'>
					<a href = "../safe/listMember">ȸ�����</a>
					<a href = "../safe/updateMember?id=${s.id}">������������</a>
					<a href = "../safe/deleteMember?id=${s.id}">ȸ��Ż��</a>
			</c:when>
				
			 <c:otherwise>
					<a href = "../safe/updateMember?id=${s.id}">������������</a>
					<a href = "../safe/deleteMember?id=${s.id}">ȸ��Ż��</a>
			</c:otherwise>
		</c:choose>





</body>
</html>