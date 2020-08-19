<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
td {
	text-align: center;
}
</style>
</head>
<body>
<center>
<div style = "float : center; background:; height : 660px;">
<table height = "100%" >
	<tr>
		<td>
			<h1>의뢰요청이 완료되었습니다.</h1>
		</td>
	</tr>
	<tr>
		<td style = "vertical-align: top;">
			<h3>
				이제 디자이너가 의뢰을 확인한 후<br/><br/> 
				수락하면 상담을 시작할 수 있습니다.<br/><br/>
				디자이너의 응답이 느릴 경우 의뢰를 취소할 수 있습니다.
			
			</h3>
		</td>
	</tr>
	<tr>
		<td>
		</td>
	</tr>
</table>
	
</div>
<center>
	<div style="float: left; width: 100%; height: 55px; background: ;">
		<input type = "button" class = "request" style = "width : 100%; height : 95%; font-size: 22px; font-weight: bold;" onclick = "window.location = 'req_Dlist?pageNum=1'"  value = "나의 의뢰 목록" />
	</div>
</center>


<!-- <input type = "button" class = "requestt" value = "나의 의뢰 목록으로" onclick = "window.location = 'req_list?pageNum=1'"> -->

</center>
</body>
</html>