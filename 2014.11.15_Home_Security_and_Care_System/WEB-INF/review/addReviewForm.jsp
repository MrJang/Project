<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<form:form commandName="c">
	<center>
		<table class="bordered" width = "500">
			<thead>
				<th colspan="2">�ı� �ۼ�</th>
			
			</thead>
			<tr>
            
            <td>ID : </td>
            <td> <p align="left"><form:input path="id" value="${s.id}" readonly="true"/></p></td>   
            
            
            
                     
         </tr>
         <tr>
            <td>��õID : </td>
            <td> <p align="left"><form:input path="e_id" value="${cafe.id}" readonly="true"/></p></td>            
         </tr>
			
			
			
			<tr>
				<td>���� :</td>
				<td><p align="left"><form:input path="subject"/></p></td>
			</tr>
			<tr>
				<td>���� :</td>
				<td><p align="left"><form:textarea path="content" rows="15" cols="45"/></p></td>
			</tr>
			<tr>
				<td>��õ :</td>
				
				<td>
					<form:radiobutton value="1" path="s_star" label="1��"/>
					<form:radiobutton value="2" path="s_star" label="2��"/>
					<form:radiobutton value="3" path="s_star" label="3��"/>
					<form:radiobutton value="4" path="s_star" label="4��"/>
					<form:radiobutton value="5" path="s_star" label="5��"/>
				</td>
			</tr>
	

	<tr>
		<td colspan="2">
			<input type="submit" value="���"> &nbsp;&nbsp;
			<input type="reset" value="����">
		</td>
	</tr>

		</table>
		</center>
	</form:form>


	
