<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js">
</script>
<script type="text/javascript" charset="EUC-KR">
 </script>

</head>


<body id="stage" class="theme">
<form:form commandName="female">

				<h1>������Ī��û</h1>
	
				<table border="1"  align="center">
				<tr>
				<td>
				�ð�:
				</td>
				<td>
				<form:select path="crime_time">
					<form:options items="${t_list}" />
				</form:select>
				</td>
				<tr>
				<td>
				
				����:
				</td>
				<td>
				${female.content }
				</td>
				</tr>
				<tr>
				<td colspan="2">
				
						<input type="submit" value="�����ϱ�" />
				
						<input type="reset" value="����ϱ�" />
			
				</td>
				</tr>
				</table>
			
					
					
		
	</form:form>
</body>
</html>