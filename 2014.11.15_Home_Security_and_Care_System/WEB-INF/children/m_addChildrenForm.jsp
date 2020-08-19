<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script src="http://dmaps.daum.net/map_js_init/postcode.js"></script>
<script type="text/javascript">
function zipcodebtn1() {
    new daum.Postcode({
        oncomplete: function(data) {
           
            document.getElementById('departure').value = data.address;
        }
    }).open();
}

function zipcodebtn2() {
    new daum.Postcode({
        oncomplete: function(data) {
           
            document.getElementById('destination').value = data.address;
        }
    }).open();
}

</script>
<form:form commandName="c">

	<table border="1" align = "center">
		<tr>
			<td>ID :</td>
			<td colspan="2"><form:input path="id" /></td>
		</tr>
		<tr>
			<td>����� :</td>
			<td><form:input path="departure" /></td>
			<td><input type="button" value ="�ּ�ã��" onclick="zipcodebtn();"><br></td>
		</tr>

		<tr>
			<td>������ :</td>
			<td><form:input path="destination" /></td>
			<td><input type="button" value ="�ּ�ã��" onclick="zipcodebtn2();"><br></td>
		</tr>
		<tr>
			<td>��߽ð� :</td>
			<td colspan="2"><form:select path="start_time">
					<form:options items="${t_list}" />
					</form:select></td>
		</tr>

		<tr>
			<td>�����ð� :</td>
			<td colspan="2"><select name="stop_time">
					<c:forEach items="${t_list}" var="stime">
						<option value="${stime}">${stime}</option>
					</c:forEach>
			</select></td>
		</tr>


		<c:choose>

			<c:when test='${s.category=="1"}'>
				<tr>
					<td>���з� :</td>
					<td colspan="2">���ΰ�</td>
				</tr>
				<tr>
			<td>��û�з� :</td>
			<td colspan="2"><form:checkbox path="request" value="personal" label="���ν�û" />
				<form:checkbox path="request" value="group" label="�׷��û" /></td>
		</tr>
		<tr>
			<td>Ư�̻��� :</td>
			<td colspan="2"><form:textarea path="report" /></td>
		</tr>
			</c:when>
			<c:when test='${s.category=="2"}'>
				<tr>
				<td>���з� :</td>

				<td>��ü��</td>
				</tr>
				<tr>
					<td>��ü�� :</td>
					<td><form:input path="request" value="${s.e_name}"/></td>
				</tr>
				<tr>
					<td>��ü�Ұ� :</td>
					<td><form:textarea path="report" /></td>
				</tr>
			</c:when>
		</c:choose>





		<tr>
			<td colspan="3"><input type="submit" value="���">
				&nbsp;&nbsp; <input type="reset" value="����"></td>
		</tr>


	</table>
</form:form>
