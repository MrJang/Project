<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link href="../css/side.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="/SafeProject/js/jquery-1.3.2.min.js"></script>
	<script type="text/javascript" src="/SafeProject/js/jQuery.fademenu.js"></script>
	<script type="text/javascript" src="/SafeProject/js/menu.js"></script>
 <c:if test="${s.id == null}">
 
 <div id="menu">
    <dl>
        <dt><a href="#">자녀안전귀가 소개</a> </dt>
        <dd id="open">
        </dd>
        </dl>
        </div>
 </c:if>	
	

   <c:if test="${s.id != null}">
   <div id="menu">
    <dl>
        <dt><a href="#">자녀안전귀가 소개</a> </dt>
        <dd id="open">
        </dd>
     
        <dt><a href="#">자녀안전귀가 신청</a></dt>
        <dd>
            <ul>
                <li><a href="../safe/childrenForm?category=${s.category}" style="text-decoration: none" >자녀안전귀가신청</a></li>
                
            </ul>
        </dd>
        <dt><a href="#">신청현황</a></dt>
        <dd>
        <ul>
           <c:if test="${s.category ==1}">       
            <li><a href="../safe/schedulerList?s_id=${s.id}">개인신청 현황</a></li>
           </c:if>
			<c:if test="${s.category ==2}">           
            <li><a href="../safe/listchildren">업체신청 현황</a></li>
            </c:if>
        </ul>
        </dd>
      
  </dl>

</div>
 </c:if>   

