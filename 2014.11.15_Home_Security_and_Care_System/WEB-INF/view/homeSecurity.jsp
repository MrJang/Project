<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<script type="text/javascript">
	
	function light(status){
		
		 if(status=="on"){
			
			$.ajax({
				url :"http://192.168.0.10?led=ON"	
				});
			alert("Right on");
			location.href="homeRightOn";
		}
		else{
			$.ajax({
				
				url :"http://192.168.0.10?led=OFF"	
				});
			alert("Right off");
			location.href="homeRightOff";
		}
	
	} 
	
	function door(status){
		if(status=="open"){
			$.ajax({
				url :"http://192.168.0.10?door=Open"	
				});
			alert("open the door");
			location.href="homeDoorOpen";
		}else{
			$.ajax({
				url :"http://192.168.0.10?door=Close"	
				});
			alert("close the door");
			location.href="homeDoorClose";
		}
		
	}
	
	function security(status){
		if(status=="on"){
			$.ajax({
				url :"http://192.168.0.10?security=ON"	
				});
			alert("Security On");
			location.href="homeSecurityOn";
		}else{
			$.ajax({
				url :"http://192.168.0.10?security=OFF"	
				});
			alert("Security Off");
			location.href="homeSecurityOff";
		}
	}
	
</script>	
<style text/css>
#td1,#td2,#td3,#td4,#td5,#td6{
cursor:hand; 
}
<!-- cursor:hand 클릭을 하였을때 실행을 시켜주는 방법 -->
</style>
	


<center>
<table border="1" width ="500px" height="500px">
	<tr>
		<td colspan="2" align="center" height="50" style="background:#0174DF;font-family:HY나무L;font-size:25px">HOME SECURITY</td>
	</tr>
	<tr>
		<td rowspan="2" align="center"><img src="/SafeProject/images/light.jpg" width="50%" height="50%"></td>
		<td id="td1">
		<img src="/SafeProject/images/on.jpg"  width="60px" height="60px" onClick="light('on');"/>
		</td>
	</tr>

	<tr>
	
		<td id="tr2"><img src="/SafeProject/images/off.jpg" width="60px" height="60px" onclick="light('off');"/></td>
	</tr>

	<tr>
	<td rowspan="2" align="center"><img src="/SafeProject/images/door.jpg" width="50%" height="50%"></td>
		<td id="tr3"><img src="/SafeProject/images/on.jpg"  width="60px" height="60px" onClick="door('open');"/></td>
	</tr>

	<tr>
		<td id="tr4"><img src="/SafeProject/images/off.jpg"  width="60px" height="60px" onClick="door('close');"/></td>
	</tr>

	<tr>
	<td rowspan="2" align="center"><img src="/SafeProject/images/security.JPG" width="50%" height="50%"></td>
		<td id="tr5"><img src="/SafeProject/images/on.jpg" width="60px" height="60px"onClick="security('on');"/></td>
	</tr>

	<tr>
		<td id="tr6"><img src="/SafeProject/images/off.jpg" width="60px" height="60px"onClick="security('off');"/></td>
	</tr>


</table>

</center>