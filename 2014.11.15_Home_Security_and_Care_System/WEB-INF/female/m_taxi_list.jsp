<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<div class="ui-grid-b">
   <div class="ui-block-a">
      <a href = "../safe/t_oneweek" data-role="button">������</a>
   </div>
   <div class="ui-block-b">
      <a href = "../safe/t_onemonth" data-role="button" >1����</a>
   </div>

   <div class="ui-block-a">
      <a href = "../safe/t_threemonth" data-role="button" >3����</a>
   </div>
   <div class="ui-block-b">
      <a href = "../safe/t_findTaxi" data-role="button" >��ü����</a>
   </div>
   </div>
   
<br><br>

<table width="800" border="1" cellspacing="0" cellpadding="5" align="center">
      <tr>
         <td align="center" rowspan="2">�޴�����ȣ</td>
         <td align="center" rowspan="2">������ȣ</td>
         <td align="center" rowspan="2">�����ð�</td>
         <td align="center" rowspan="2">�����ð�</td>
         <td align="center" colspan="3">��������</td>
         <td align="center" rowspan="2">SMS�߼ۿ���</td>
         
      </tr>
         <tr>
         <td align="center">�Ÿ�</td>
         <td align="center">�ð�</td>
         <td align="center">���</td>
         </tr>
      
      
      <c:forEach var="female" items="${list}">
         <c:set var="crime" value="${fn:split(female.crime_time, ',')}" />
         <c:set var="drive" value="${fn:split(female.drive, ',')}" />
            <tr align="center">
               <form:form>
         <td align="center" >${female.phone}</td>
         <td align="center">${female.car_num}</td>
         <td align="center">${crime[0]}</td>
         <td align="center">${crime[1]}</td>
         <td align="center">${drive[0]}</td>
         <td align="center">${drive[1]}</td>
         <td align="center">${drive[2]}</td>
         <td align="center">${female.notice}</td>

          
         </form:form>
         </tr>
            
               
               
      </c:forEach>
   </table>
