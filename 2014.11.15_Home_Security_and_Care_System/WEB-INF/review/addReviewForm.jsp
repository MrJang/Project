<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<form:form commandName="c">
	<center>
		<table class="bordered" width = "500">
			<thead>
				<th colspan="2">후기 작성</th>
			
			</thead>
			<tr>
            
            <td>ID : </td>
            <td> <p align="left"><form:input path="id" value="${s.id}" readonly="true"/></p></td>   
            
            
            
                     
         </tr>
         <tr>
            <td>추천ID : </td>
            <td> <p align="left"><form:input path="e_id" value="${cafe.id}" readonly="true"/></p></td>            
         </tr>
			
			
			
			<tr>
				<td>제목 :</td>
				<td><p align="left"><form:input path="subject"/></p></td>
			</tr>
			<tr>
				<td>내용 :</td>
				<td><p align="left"><form:textarea path="content" rows="15" cols="45"/></p></td>
			</tr>
			<tr>
				<td>추천 :</td>
				
				<td>
					<form:radiobutton value="1" path="s_star" label="1점"/>
					<form:radiobutton value="2" path="s_star" label="2점"/>
					<form:radiobutton value="3" path="s_star" label="3점"/>
					<form:radiobutton value="4" path="s_star" label="4점"/>
					<form:radiobutton value="5" path="s_star" label="5점"/>
				</td>
			</tr>
	

	<tr>
		<td colspan="2">
			<input type="submit" value="등록"> &nbsp;&nbsp;
			<input type="reset" value="리셋">
		</td>
	</tr>

		</table>
		</center>
	</form:form>


	
