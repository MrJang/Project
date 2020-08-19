<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/reveal.css">	
<link rel="stylesheet" href="../css/button.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.6.min.js"></script>
	<script type="text/javascript" src="../js/jquery.reveal.js"></script>
	<script src="http://code.jquery.com/jquery-1.6.3.min.js"></script>
</head>

<style type="text/css">
			body { font-family: "HelveticaNeue","Helvetica-Neue", "Helvetica", "Arial", sans-serif; }
			.big-link { display:block; text-align: center; font-size: 14; color: #06f; }
	
		</style>
<script>

function PloList(list) {
	 var p_name= $("#p_name").val();
	

	var random = Math.floor(Math.random() * list)+1;

		if($("#police"+random).val() ==  null) {
			
			PloList(list);
		}else {
	var p = $("#police"+random).val();
    var name = p.split("/")[0];
    var phone = p.split("/")[1];
    var success= p.split("/")[2];
    var arg = prompt("�̿��Ͻ� �ð��� �Է��ϼ���: ex)14:00");
    if(arg== null) {
    	alert("����Ͽ����ϴ�.");
    }else {
    var r = confirm("�Ͱ� ��û�ϱ�ڽ��ϱ�?"+"\n�������̸�:"+name+"����\n�޴�����ȣ:"+phone+"\n�ð�:"+arg+"��");
    
    if (r == true) {		       	
		 location.href="m_policelike?name="+name+"&phone="+phone+"&success="+success+"&arg="+arg+"&p_name="+p_name;
	} else {
		return;  			   
    		}
     
    }
		} 
}
function detalipolice(name) {
	
	$("#myModal").load("m_detalipolice?name="+ name);
		
		
	
}

</script> 
<body>
<div>
<form:form commandName="police">
<center>

<form:input path="p_name" readonly="true" STYLE="text-align:center;font-size: 25px;font-weight: bold"/>
<br/><br/>
<table id="tab" border="1" cellspacing="0" cellpadding="5" align="center" class="bordered" style="font-size:7pt">
<thead>
 <tr>
 	<th align="center" width="80">����</th>
 	<th align="center" width="80">�ð�</th>
 	<th align="center" width="80">�̸�</th>
 	<th align="center" width="70">�޴�����ȣ</th>
 	<th align="center" width="80">���డ�ɻ���</th>
  </tr>
 	 </thead>
 <c:forEach var="p" items="${list}">
 
 <tr> 
 <td align="center" ><c:if test="${p.m_success !=1 }">x</c:if>
 <c:if test="${p.m_success ==1 }">
 <form:radiobutton path="police" value="${p.m_name}/${p.m_phone}/${p.m_success}"/></c:if>
 </td>
 <td align="center">
 <c:if test="${p.m_success !=1 }">x</c:if>
 <c:if test="${p.m_success ==1 }">
 <form:select path="crime_time">
					<form:options items="${t_list}" />
					</form:select>
					</c:if></td>
 <td align="center">${p.m_name}</td>
 <td align="center">${p.m_phone }</td> 
 <td align="center"><c:if test="${p.m_success==1 }">���డ��</c:if>
 	 <c:if test="${p.m_success ==3 }">����Ұ���</c:if>
 	 <c:if test="${p.m_success ==2 }">������</c:if>
 </td>
	
</tr>
</c:forEach>

</table>
<c:if test="${submit == true }"><script>alert("�Ͱ���û�Ͻðڽ��ϱ�?");</script></c:if>
<input type="submit" value="����" class="asd asd-blue">
<input type="button" value="�ڵ�����" onClick="PloList('${list.size()}')" class="asd asd-blue">
</center>
</form:form>

</div>



<div id="myModal" class="reveal-modal">

	
	<table>
	<tr>
	<td>
	��ϵ� �ıⰡ �����ϴ�.
	</td>
	</tr>
	
	</table>


</div>
���������� �򰡸� ���Ƿ��� �̸��� Ŭ�����ּ���. 
</body>


</html>