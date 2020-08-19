<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<script type="text/javascript">
	
	function light(status){
		
			
		if(status=="on"){
			$.ajax({
				url :"http://192.168.0.10?led=ON"	
				});
		}
		else{
			$.ajax({
				
				url :"http://192.168.0.10?led=OFF"	
				});
		}
	
	} 
	
	function door(status){
		if(status=="open"){
			$.ajax({
				url :"http://192.168.0.10?door=Open"	
				});
		}else{
			$.ajax({
				url :"http://192.168.0.10?door=Close"	
				});
		}
		
	}
	
	function security(status){
		if(status=="on"){
			$.ajax({
				url :"http://192.168.0.10?security=ON"	
				});
		}else{
			$.ajax({
				url :"http://192.168.0.10?security=OFF"	
				});
		}
	}
	
</script>	

<style>
.bordered {
	border: solid #ccc 1px;
	-moz-border-radius: 6px;
	-webkit-border-radius: 6px;
	border-radius: 6px;
	-webkit-box-shadow: 0 1px 1px #ccc;
	-moz-box-shadow: 0 1px 1px #ccc;
	box-shadow: 0 1px 1px #ccc;
}

.bordered tr:hover {
	background: #fbf8e9;
	-o-transition: all 0.1s ease-in-out;
	-webkit-transition: all 0.1s ease-in-out;
	-moz-transition: all 0.1s ease-in-out;
	-ms-transition: all 0.1s ease-in-out;
	transition: all 0.1s ease-in-out;
}

.bordered td,.bordered th {
	border-left: 1px solid #ccc;
	border-top: 1px solid #ccc;
	padding: 10px;
	text-align: center;
}

.bordered th {
	background-color: #dce9f9;
	background-image: -webkit-gradient(linear, left top, left bottom, from(#ebf3fc),
		to(#dce9f9));
	background-image: -webkit-linear-gradient(top, #ebf3fc, #dce9f9);
	background-image: -moz-linear-gradient(top, #ebf3fc, #dce9f9);
	background-image: -ms-linear-gradient(top, #ebf3fc, #dce9f9);
	background-image: -o-linear-gradient(top, #ebf3fc, #dce9f9);
	background-image: linear-gradient(top, #ebf3fc, #dce9f9);
	-webkit-box-shadow: 0 1px 0 rgba(255, 255, 255, .8) inset;
	-moz-box-shadow: 0 1px 0 rgba(255, 255, 255, .8) inset;
	box-shadow: 0 1px 0 rgba(255, 255, 255, .8) inset;
	border-top: none;
	text-shadow: 0 1px 0 rgba(255, 255, 255, .5);
}

.bordered td:first-child,.bordered th:first-child {
	border-left: none;
}

.bordered th:first-child {
	-moz-border-radius: 6px 0 0 0;
	-webkit-border-radius: 6px 0 0 0;
	border-radius: 6px 0 0 0;
}

.bordered th:last-child {
	-moz-border-radius: 0 6px 0 0;
	-webkit-border-radius: 0 6px 0 0;
	border-radius: 0 6px 0 0;
}

.bordered th:only-child {
	-moz-border-radius: 6px 6px 0 0;
	-webkit-border-radius: 6px 6px 0 0;
	border-radius: 6px 6px 0 0;
}

.bordered tr:last-child td:first-child {
	-moz-border-radius: 0 0 0 6px;
	-webkit-border-radius: 0 0 0 6px;
	border-radius: 0 0 0 6px;
}

.bordered tr:last-child td:last-child {
	-moz-border-radius: 0 0 6px 0;
	-webkit-border-radius: 0 0 6px 0;
	border-radius: 0 0 6px 0;
}
</style>	
	<center>
	<table class="bordered" >
			<thead>
				<tr>
				<th colspan="3">Home Controller</th>
				</tr>
			</thead>
			<tr>
				<td rowspan="2">
					<img src="../images/led.JPG" width="70" height="70">
				</td>
				<td>
					<input type="button" value="Light On" onClick="light('on');"/>	
				</td>
			</tr>
			<tr>
				<td>
					<input type="button" value="Light Off" onclick="light('off');"/>
				</td>
			</tr>
			
			
			<tr>
				<td rowspan="2">
					<img src="../images/door2.JPG" width="70" height="70">
				</td>
				<td>
					<input type="button" value="Door Open" onClick="door('open');"/>
				</td>
			</tr>
			<tr>
				<td>
					<input type="button" value="Door Close" onClick="door('close');"/>
				</td>	
			</tr>
			
			
			<tr>
				<td rowspan="2">
					<img src="../images/secu.JPG" width="70" height="70">
				</td>
				<td>
					<input type="button" value="Security On" onClick="security('on');"/>
				</td>
			</tr>
			<tr>
				<td>
					<input type="button" value="Security Off" onClick="security('off');"/>
				</td>	
			</tr>
			
			

			
		</table>

</center>


