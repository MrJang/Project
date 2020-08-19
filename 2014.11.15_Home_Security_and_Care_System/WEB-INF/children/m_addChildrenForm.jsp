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
			<td>출발지 :</td>
			<td><form:input path="departure" /></td>
			<td><input type="button" value ="주소찾기" onclick="zipcodebtn();"><br></td>
		</tr>

		<tr>
			<td>목적지 :</td>
			<td><form:input path="destination" /></td>
			<td><input type="button" value ="주소찾기" onclick="zipcodebtn2();"><br></td>
		</tr>
		<tr>
			<td>출발시간 :</td>
			<td colspan="2"><form:select path="start_time">
					<form:options items="${t_list}" />
					</form:select></td>
		</tr>

		<tr>
			<td>도착시간 :</td>
			<td colspan="2"><select name="stop_time">
					<c:forEach items="${t_list}" var="stime">
						<option value="${stime}">${stime}</option>
					</c:forEach>
			</select></td>
		</tr>


		<c:choose>

			<c:when test='${s.category=="1"}'>
				<tr>
					<td>고객분류 :</td>
					<td colspan="2">개인고객</td>
				</tr>
				<tr>
			<td>신청분류 :</td>
			<td colspan="2"><form:checkbox path="request" value="personal" label="개인신청" />
				<form:checkbox path="request" value="group" label="그룹신청" /></td>
		</tr>
		<tr>
			<td>특이사항 :</td>
			<td colspan="2"><form:textarea path="report" /></td>
		</tr>
			</c:when>
			<c:when test='${s.category=="2"}'>
				<tr>
				<td>고객분류 :</td>

				<td>업체고객</td>
				</tr>
				<tr>
					<td>업체명 :</td>
					<td><form:input path="request" value="${s.e_name}"/></td>
				</tr>
				<tr>
					<td>업체소개 :</td>
					<td><form:textarea path="report" /></td>
				</tr>
			</c:when>
		</c:choose>





		<tr>
			<td colspan="3"><input type="submit" value="등록">
				&nbsp;&nbsp; <input type="reset" value="리셋"></td>
		</tr>


	</table>
</form:form>
