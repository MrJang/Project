<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="../css/side.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="/SafeProject/js/jquery-1.3.2.min.js"></script>
	<script type="text/javascript" src="/SafeProject/js/jQuery.fademenu.js"></script>
	<script type="text/javascript" src="/SafeProject/js/menu.js"></script>
	
   
   <div id="menu">
    <dl>
        <dt><a href="../safe/female_addWrite">여성안전귀가 소개</a> </dt>
        <dd id="open">
        </dd>
        
        <c:if test="${s.id != null}">
        <dt><a href="#">경찰매칭</a></dt>
        <dd>
        <ul>
            <li><a href="../safe/p_server">경찰매칭 신청</a></li>
             <li><a href="../safe/female_police_list?id=${s.id}">경찰매칭 내역</a></li>
           
            
        </ul>
        </dd>
        
        
        <dt><a href="#">Taxi</a></dt>
        <dd>
        <ul>
            <li> <a href="../safe/t_findTaxi">택시내역보기</a></li>
           
            
        </ul>
        </dd>
        </c:if>
         
        
    </dl>
</div>
