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
		alert("검색어를 입력하시기 바랍니다.");
	}else{	
		
		if(safe_cate.options[safe_cate.selectedIndex].value == "X")
		alert("분류를 골라주세요!");
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
			<option value="X">검색분류</option>
			<option value="P">개인고객</option>
			<option value="E">업체고객</option>
		</select>
		</td>
		<td>출발지 : <input type="text" id="start"/>
		</td>
		<td>목적지 : <input type="text" id="end"/>
		</td>
			<td colspan="3">
		<input type="button" value="검색" onclick="e_search()"/>
		</td>	
	</tr>

	

</table>




</form>

	<br>

	<b>신청 게시판 (전체글 : ${pageInfo.numOfChildrens})</b>
	
	
	
	<c:if test="${pageInfo.numOfChildrens==0}">
		<table class="bordered" width="800">
			<tr>
				<td align="center">
					게시판에 저장된 글이 없습니다.
				</td>	
			</tr>
		</table>
	
	
	</c:if>
	
	<c:if test="${pageInfo.numOfChildrens>0}">
	
	<table class="bordered"  width="800">
		<thead>
    	<tr>
       	 <th>아이디</th>        
      	  <th>분류</th>
     	  <th>보기</th>
   		 </tr>
   			 </thead>
		<c:forEach var="ch" items="${pageInfo.childrens}">
		
			
		<tr align="center">
			<form:form>
				
				<td>${ch.id}</td>
				<td>
				<c:choose>
				<c:when test='${ch.category=="1"}'>
					개인신청<br>
				</c:when>
				
				<c:when test='${ch.category=="2"}'>
					업체신청<br>
				</c:when>
				</c:choose>
				</td>
				<td><a href="../safe/listchildrenView?num=${ch.num}&id=${ch.id}">상세보기</a></td>
			</form:form>
			</tr>

		</c:forEach>
	</table>
	</c:if>
	
	${pageInfo.bottomPartOfHtml}
</center>
