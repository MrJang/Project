<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<link rel="stylesheet" href="../css/reveal.css">	
<link rel="stylesheet" href="../css/button.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.6.min.js"></script>
	<script type="text/javascript" src="../js/jquery.reveal.js"></script>
	<script src="http://code.jquery.com/jquery-1.6.3.min.js"></script>
<style type="text/css">
			body { font-family: "HelveticaNeue","Helvetica-Neue", "Helvetica", "Arial", sans-serif; }
			.big-link { display:block; text-align: center; font-size: 14; color: #06f; }
	
		</style>
<center>

	<form:form commandName="female">

		<table border="1" >
			
			<tr>
				
				<td width="60">�ۼ���</td>
				<td><form:input path="id" readonly="true"/></td>	
				
				
				
							
			</tr>
			<tr>
				<td width="60">������</td>
				<td><form:input path="request" readonly="true"/></td>
			</tr>
			<tr>
				<td width="60">������ </td>
				<td><form:input path="e_id" readonly="true" /></td>				
			</tr>
			
			
			
			<tr>
				<td width="60">���� </td>
				<td><form:input path="subject" size="70" /></td>
			</tr>
			<tr>
				<td width="60">���� </td>
				<td><form:textarea path="content" rows="20" cols="60"/></td>
			</tr>
			<tr>
				<td width="60">��õ </td>
				
				<td>
					<form:radiobutton value="1" path="s_star" label="1��"/>
					<form:radiobutton value="2" path="s_star" label="2��"/>
					<form:radiobutton value="3" path="s_star" label="3��"/>
					<form:radiobutton value="4" path="s_star" label="4��"/>
					<form:radiobutton value="5" path="s_star" label="5��"/>
				</td>
			</tr>
	

	<tr>
		<td colspan="2" align="center" >
		<center>
			<input type="submit" value="���"  > &nbsp;&nbsp;
			<input type="reset" value="����">
		</center>
		</td>
	</tr>

		</table>
	</form:form>

</center>
