<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript">
window.onload = function() {
    var r = confirm("�̹� ��ϵǾ��ֽ��ϴ�. �����Ͻðڽ��ϱ�?");
    if (r == true) {                
        return;
    } else {
      location.href="safe_Main";            
    }
 };
</script>
<form:form commandName="m">
		<table align="center" border="1">
			<tr>
			<td>Id</td>
				<td><form:input path="id" readonly="true" /></td>
			</tr>
			<tr>
				<td>��ȣ1</td><td><form:input path="t_phone1" /></td>
			</tr>
			<tr>
				<td>��ȣ2</td><td><form:input path="t_phone2" /></td>
			</tr>	
			<tr>
				<td>��ȣ3</td><td><form:input path="t_phone3"/></td>
			</tr>
								<tr>
				<td>�˸�����</td><td><form:textarea rows="10" cols="40" path="content" /></td>
				</tr>
			<tr align="center">
			<td colspan="2">
			<input type = "submit" value="����"/> &nbsp;&nbsp;&nbsp;
		<input type= "reset" value="����"/>
			</td>
			</tr>
		</table>
		
	</form:form>
