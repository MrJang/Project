<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="../css/side.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="/SafeProject/js/jquery-1.3.2.min.js"></script>
	<script type="text/javascript" src="/SafeProject/js/jQuery.fademenu.js"></script>
	<script type="text/javascript" src="/SafeProject/js/menu.js"></script>
	
   
   <div id="menu">
    <dl>
        <dt><a href="../safe/female_addWrite">���������Ͱ� �Ұ�</a> </dt>
        <dd id="open">
        </dd>
        
        <c:if test="${s.id != null}">
        <dt><a href="#">������Ī</a></dt>
        <dd>
        <ul>
            <li><a href="../safe/p_server">������Ī ��û</a></li>
             <li><a href="../safe/female_police_list?id=${s.id}">������Ī ����</a></li>
           
            
        </ul>
        </dd>
        
        
        <dt><a href="#">Taxi</a></dt>
        <dd>
        <ul>
            <li> <a href="../safe/t_findTaxi">�ýó�������</a></li>
           
            
        </ul>
        </dd>
        </c:if>
         
        
    </dl>
</div>
