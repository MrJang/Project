<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
		
	
		<div data-role="navbar" data-iconpos="top">
        <ul>
        <li>
        <a id="bars-button1" data-icon="custom" style="margin-top:10px; " href="#children">Safe Children</a>
        </li> 
        <li>
        <a id="bars-button2"  data-icon="custom" style="margin-top:10px;" href="#female">Safe Female</a>
        </li>
        <li>
        <a id="bars-button3" data-icon="custom" style="margin-top:10px;" href="#home">Safe Home</a>
 		</li>
 		</ul>  
 		</div>
 		
 		
 		<div data-role="panel" id="children" data-theme="c" data-display="overlay" data-position="left">
        
        
        <div data-role="controlgroup" data-corners="false">
            <a href="#" data-role="button">�ڳ�����Ͱ� �Ұ�</a>
            <c:if test="${s.id != null}">
            
           		  <c:if test="${s.category==1}">
					<a href="../safe/m_schedulerList?s_id=${s.id}" data-role="button">����ȸ�� ��û ��Ȳ</a>
					</c:if>
					
					<c:if test="${s.category==2}">
					<a href="../safe/m_listchildren?id=${s.id}" data-role="button">��üȸ�� ��û ��Ȳ</a>
					</c:if>         
      		</c:if>
      	</div>
    </div>
   
   <div data-role="panel" id="female" data-theme="a" data-display="overlay" data-position="left">
       
        <div data-role="controlgroup" data-corners="false">
            <a href="m_t_findTaxi" data-role="button">�ýó�������</a>
         <a href="m_police" data-role="button">������Ī</a>
         <c:if test="${s.category==4}">
          <a href="m_policeSelect" data-role="button">������Ȯ��</a>
          
         </c:if>
        <a href="m_female_sysList?id=${s.id}" data-role="button">������Ī ����</a>
        </div>
    </div>
    
    <div data-role="panel" id="home" data-theme="c" data-display="overlay" data-position="left">
       
        <div data-role="controlgroup" data-corners="false">
            <a href="../safe/m_homeSecurity" data-role="button">Ȩ ��ť��Ƽ</a>
          
        </div>
    </div>
    
    
    
