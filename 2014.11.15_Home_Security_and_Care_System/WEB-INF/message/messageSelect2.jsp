<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
function gogo(){ 
   
    var chk = document.getElementsByName("chk1[]"); 
    var len = chk.length; 
    var res = ""; 
    for(var i=0; i<len; i++){ 
        if(chk[i].checked == true){ 
        	 res += chk[i].value + ","; 
        } 
    } 
    opener.document.getElementById("Message").send_id.value=res;
	self.close();
}
	

</script>
<table class="bordered" width="100%">
	<thead>
    	<tr>
       	 <th>Check</th>        
      	  <th>ID</th>
   		 </tr>
   			 </thead>
	<c:forEach var="cafe_member_list" items="${cafe_member_list}">
		<tr>
			<td><input type="checkbox" name="chk1[]" id = "check_id" value="${cafe_member_list.id}"></td>
			<td>${cafe_member_list.id}</td>
		</tr>
	</c:forEach>
</table>
<input type="button" value="주소록 입력" id="checkConsole" onclick="gogo()">