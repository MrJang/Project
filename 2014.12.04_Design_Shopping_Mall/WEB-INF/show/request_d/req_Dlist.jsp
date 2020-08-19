<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>   
<%@taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href = "../style.css" type="text/css" rel = "stylesheet">
<script src = "http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js">
</script>
<script type="text/javascript">
	
	
   function changeFunc(i,j,k,f,fd) {
	   
	var img = document.getElementById("img");
	var req_numm = document.getElementById("req_numm");
	
// 	alert(k);
	
	

	if(i.length>500){
		img.innerHTML = "<img src = '"+i+"' id= 'img' width = '100%' height = '344px'>";
	}else {
		img.innerHTML = "<img src = '../upload/"+i+"' id= 'img' width = '100%' height = '344px'>";
	}
	
	req_numm.innerHTML = k;
	
	
	$("#req_num").val(k);
	client_content_feedback(j,f,fd);
	
   }
   
   function client_content_feedback(j,f,fd){
	   var req_content = document.getElementById("req_content");
	   req_content.innerHTML = j;
	   var feedback = document.getElementById("feedback");
	   feedback.innerHTML = f;	
	   var feedback_date = document.getElementById("feedback_date");
	   feedback_date.innerHTML = fd;
   }
   
   function req_del(){
		var req_num = $("#req_num").val();   
// 	   alert(req_num);
	   
   		window.location='req_del?req_num='+req_num;
   }

  </script>

</head>
<body>
<form:form commandName = "request">
<table border = "0" width = "100%">
	<tr><td><center><b>의뢰중인 디자인</b></center></td></tr>
</table>
<div style = "float : center; width : 100%; height : 625px; background: ;">
<table  width = "100%"  align = "right" >
	<tr align = "center" >
		<td width = "20%" height = "10px" style = "background :#89E7D0; border-bottom : 2px solid #AAAAAA; border-right : 2px solid #AAAAAA;">
			<b>의뢰명</b>
		</td>
		<td width = "20%" height = "10px" style = "background :#89E7D0; border-bottom : 2px solid #AAAAAA; border-right : 2px solid #AAAAAA;">
			<b>디자이너</b>
		</td>
		<td width = "25%" height = "10px" style = "background :#89E7D0; border-bottom : 2px solid #AAAAAA; border-right : 2px solid #AAAAAA;">
			<b>의뢰일</b>
		</td>
		<td width = "20%" height = "10px" style = "background :#89E7D0; border-bottom : 2px solid #AAAAAA; border-right : 2px solid #AAAAAA;">
			<b>이미지</b>
		</td>
		<td width = "15%" height = "10px" style = "background :#89E7D0; border-bottom : 2px solid #AAAAAA; border-right : 2px solid #AAAAAA;">
			<b>진행상황</b>
		</td>
		
	</tr>
	<c:forEach var="request" items="${list}" begin = "${((param.pageNum-1))*5}" end = "${((param.pageNum-1)*5)+4}">
		
		<tr align = "center">
			<c:choose>
				<c:when test="${request.receiver_mod==1}">
					<td  class = "blinkk2" style = "  border-bottom : 2px solid #AAAAAA; border-right : 2px solid #AAAAAA;" onclick="window.location = 'my_req_Dinfo?receiver=${request.req_receiver}&req_num=${request.req_num}'">
						<b>${request.req_name}</b>
					</td>
					<td  class = "blinkk2" style = "  border-bottom : 2px solid #AAAAAA; border-right : 2px solid #AAAAAA;" onclick="window.location = 'my_req_Dinfo?receiver=${request.req_receiver}&req_num=${request.req_num}'">
						<b>${request.req_receiver}</b>
					</td>
					<td  class = "blinkk2" style = "  border-bottom : 2px solid #AAAAAA; border-right : 2px solid #AAAAAA;" onclick="window.location = 'my_req_Dinfo?receiver=${request.req_receiver}&req_num=${request.req_num}'">
						<b>${request.req_date}</b>
					</td>
					<td  class = "blinkk2" style = "  border-bottom : 2px solid #AAAAAA; border-right : 2px solid #AAAAAA;" onclick="window.location = 'my_req_Dinfo?receiver=${request.req_receiver}&req_num=${request.req_num}'">
						<c:choose>
							<c:when test="${request.req_category==1}">
								<img src = '../upload/sm_${request.req_img}' id= 'img' width = '100px' height = '100px'>
							</c:when>
							<c:when test="${request.req_category==2}">
								<img src = '${request.req_img}' id= 'img' width = '100px' height = '100px'>	
							</c:when>
						</c:choose>
					</td>	
					<td  class = "blinkk2" style = "  border-bottom : 2px solid #AAAAAA; border-right : 2px solid #AAAAAA;" onclick="window.location = 'my_req_Dinfo?receiver=${request.req_receiver}&req_num=${request.req_num}'">
						<c:choose>
							<c:when test="${request.req_process==0}">
								<b>의뢰 신청중</b>
							</c:when>
							<c:when test="${request.req_process==1}">
								<b>의뢰확인</b>
							</c:when>
							<c:when test="${request.req_process==2}">
								<b>의뢰거절</b>
							</c:when>
							<c:when test="${request.req_process==3}">
								<b>의뢰수락</b>
							</c:when>
							<c:when test="${request.req_process==4}">
								<b>입금 대기중</b>
							</c:when>
							<c:when test="${request.req_process==5}">
								<b>입금 완료</b>
							</c:when>
							<c:when test="${request.req_process==6}">
								<b>제작중</b>
							</c:when>
							<c:when test="${request.req_process==7}">
								<b>제작중</b>				
		<!-- 						<b>제작완료</b> -->
							</c:when>
							<c:when test="${request.req_process==8}">
								<b>상품발송</b>
							</c:when>
							<c:when test="${request.req_process==10}">
								<b>거래완료</b>
							</c:when>
						</c:choose>
					</td>
				</c:when>
				<c:when test="${request.receiver_mod==0}">
					<td style = "border-bottom : 2px solid #AAAAAA; border-right : 2px solid #AAAAAA;" onclick="window.location = 'my_req_Dinfo?receiver=${request.req_receiver}&req_num=${request.req_num}'">
						<b>${request.req_name}</b>
					</td>
					<td style = "border-bottom : 2px solid #AAAAAA; border-right : 2px solid #AAAAAA;" onclick="window.location = 'my_req_Dinfo?receiver=${request.req_receiver}&req_num=${request.req_num}'">
						<b>${request.req_receiver}</b>
					</td>
					<td style = "border-bottom : 2px solid #AAAAAA; border-right : 2px solid #AAAAAA;" onclick="window.location = 'my_req_Dinfo?receiver=${request.req_receiver}&req_num=${request.req_num}'">
						<b>${request.req_date}</b>
					</td>
					<td style = "border-bottom : 2px solid #AAAAAA; border-right : 2px solid #AAAAAA;" onclick="window.location = 'my_req_Dinfo?receiver=${request.req_receiver}&req_num=${request.req_num}'">
						<c:choose>
							<c:when test="${request.req_category==1}">
								<img src = '../upload/sm_${request.req_img}' id= 'img' width = '100px' height = '100px'>
							</c:when>
							<c:when test="${request.req_category==2}">
								<img src = '${request.req_img}' id= 'img' width = '100px' height = '100px'>	
							</c:when>
						</c:choose>
					</td>	
					<td style = "border-bottom : 2px solid #AAAAAA; border-right : 2px solid #AAAAAA;" onclick="window.location = 'my_req_Dinfo?receiver=${request.req_receiver}&req_num=${request.req_num}'">
						<c:choose>
							<c:when test="${request.req_process==0}">
								<b>의뢰 신청중</b>
							</c:when>
							<c:when test="${request.req_process==1}">
								<b>의뢰확인</b>
							</c:when>
							<c:when test="${request.req_process==2}">
								<b>의뢰거절</b>
							</c:when>
							<c:when test="${request.req_process==3}">
								<b>의뢰수락</b>
							</c:when>
							<c:when test="${request.req_process==4}">
								<b>입금 대기중</b>
							</c:when>
							<c:when test="${request.req_process==5}">
								<b>입금 완료</b>
							</c:when>
							<c:when test="${request.req_process==6}">
								<b>제작중</b><!--c:when 절은 주석씌우면 간혈적 오류발생  -->
							</c:when>
							<c:when test="${request.req_process==7}">
								<b>제작중</b>				
		<!-- 						<b>제작완료</b> -->
							</c:when>
							<c:when test="${request.req_process==8}">
								<b>상품발송</b>
							</c:when>
							<c:when test="${request.req_process==10}">
								<b>거래완료</b>
							</c:when>
						</c:choose>
					</td>
				</c:when>
			</c:choose>

		</tr>
	</c:forEach>
	

<!-- 		<!-- 		<iframe src="http://chat.socket.io/" width="100%" height="480" scrolling="no" class="iframe-class" frameborder="0"></iframe> -->
<!-- <!-- 		<iframe src="http://222.104.154.141:3000" width="100%" height="100%" scrolling="no" class="iframe-class" frameborder="0"></iframe> -->

</table>
	
		
		
</div>

<%
	// 		TODO ls
			String listsize = String.valueOf(session.getAttribute("listsize"));
			
			int ls = (Integer.parseInt(listsize));
			String pageNum = request.getParameter("pageNum");
			int pg = (Integer.parseInt(pageNum));
			int i = 1;
			int j = 0;
			int e = 0;

			if (pg % 5 == 1) {
				e = 5;
			} else if (pg % 5 == 2) {
				e = 4;
			} else if (pg % 5 == 3) {
				e = 3;
			} else if (pg % 5 == 4) {
				e = 2;
			} else if (pg % 5 == 0) {
				e = 1;
			}

			int currentPage = Integer.parseInt(pageNum);
			int pageSize = 5;
			int count = ls;
			double dblArticleCount = count * 1.0;
			int pageCount = (int) Math.ceil((dblArticleCount * 1.0 / pageSize));
			int startPage = (int) (currentPage / 10) * 10 + 1;
			int pageBlock = 5;
			int endPage = startPage + pageBlock - 1;
			if (endPage > pageCount) {
				endPage = pageCount;
			}

			if ((e + pg) > pageCount && ls % 10 != 0) {
				j = pageCount + 1;
			} else if ((e + pg) > pageCount && ls % 10 == 0) {
				j = pageCount + 1;
			} else if (ls > (pageSize*4)) {
				j = (e + pg);
			}
		%>
		
		<table width = "100%" border = "0">
			<tr>
				<td align = "center">
				
			<c:choose>
				<c:when test="${param.pageNum>5}">
					<span style="text-align: center; font-size: 50px; cursor:pointer;"
						onClick="location.href = 'req_Dlist?pageNum=${((param.pageNum)-5)}'">◀</span>
				</c:when>
			</c:choose>
			<%
				for (i = (e + pg) - 5; i < j; i++) {
					if (i == pg) {
			%>

			<span style="text-align: center; font-size: 50px; cursor : pointer;"
				onClick="location.href = 'req_Dlist?pageNum=<%=i%>'"><%=i%></span>
			<%
				} else {
			%>
			<span style="text-align: center; font-size: 30px; cursor : pointer;"
				onClick="location.href = 'req_Dlist?pageNum=<%=i%>'"><%=i%></span>
			<%
				}
				}
				if (e + pg <= pageCount) {
			%>
			<span style="text-align: center; font-size: 50px; cursor:pointer;"
				onClick="location.href = 'req_Dlist?pageNum=<%=e + pg%>'">▶</span>
			<%
				}
			%>
		
			</td>
			</tr>
		</table>
</form:form>
</body>
</html>