<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
      
<script src="http://code.jquery.com/jquery-1.6.3.min.js"></script>
<script type="text/javascript">
function e_search(){
	var safe_start = document.getElementById("start").value;
	var safe_end = document.getElementById("end").value;
	var safe_cate = document.getElementById("cate");
	alert(safe_start);
	
	safe_cate.options[safe_cate.selectedIndex].value;
	
	
	if(safe_start == "" && safe_end == ""){
		alert("�˻�� �Է��Ͻñ� �ٶ��ϴ�.");
	}else{	
		
		if(safe_cate.options[safe_cate.selectedIndex].value == "X")
		alert("�з��� ����ּ���!");
		if(safe_cate.options[safe_cate.selectedIndex].value == "P")
		location.href="../safe/C_search?start="+safe_start+"&end="+safe_end;
		if(safe_cate.options[safe_cate.selectedIndex].value == "E")
		location.href="../safe/E_search?start="+safe_start+"&end="+safe_end;	
	}
 	
}
</script>

<center>
<form>
<table class="bordered">
	<tr>
		<td>
		<select id="cate">
			<option value="X">�˻��з�</option>
			<option value="P">���ΰ�</option>
			<option value="E">��ü��</option>
		</select>
		</td>
		<td>����� : <input type="text" id="start"/>
		</td>
		<td>������ : <input type="text" id="end"/>
		</td>
			<td colspan="3">
		<input type="button" value="�˻�" onclick="e_search()"/>
		</td>	
	</tr>

	

</table>




</form>

	<br>

	<b>��û �Խ��� (��ü�� : ${pageInfo.numOfChildrens})</b>
	
	
	
	<c:if test="${pageInfo.numOfChildrens==0}">
		<table class="bordered" width="800">
			<tr>
				<td align="center">
					�Խ��ǿ� ����� ���� �����ϴ�.
				</td>	
			</tr>
		</table>
	
	
	</c:if>
	
	<c:if test="${pageInfo.numOfChildrens>0}">
	
	<table class="bordered"  width="800">
		<thead>
    	<tr>
       	 <th>���̵�</th>        
      	  <th>�з�</th>
     	  <th>����</th>
   		 </tr>
   			 </thead>
		<c:forEach var="ch" items="${pageInfo.childrens}">
		
			
		<tr align="center">
			<form:form>
				
				<td>${ch.id}</td>
				<td>
				<c:choose>
				<c:when test='${ch.category=="1"}'>
					���ν�û<br>
				</c:when>
				
				<c:when test='${ch.category=="2"}'>
					��ü��û<br>
				</c:when>
				</c:choose>
				</td>
				<td><a href="../safe/listchildrenView?num=${ch.num}&id=${ch.id}">�󼼺���</a></td>
			</form:form>
			</tr>

		</c:forEach>
	</table>
	</c:if>
	
	${pageInfo.bottomPartOfHtml}
</center>
