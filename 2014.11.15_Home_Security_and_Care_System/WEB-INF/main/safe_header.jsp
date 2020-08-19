<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<div class="demo-container">

<div class="blue">  
<ul id="mega-menu-4" class="mega-menu">
	<li><a href="../safe/safe_Main">Home</a></li>
	<li><a href="../safe/children_info">Safe Children</a>
		<ul>
			
			<c:if test="${s.id != null}">
			<li><a href="#">�ڳ�����Ͱ� ��û</a>
			    <ul>
					<li><a href="../safe/childrenForm?category=${s.category}" style="text-decoration: none">�ڳ�����Ͱ���û</a></li>
					
					
				</ul>
			</li>
				<li><a href="#">��û ��Ȳ</a>
			    <ul>
			    	<c:if test="${s.category==1}">
					<li><a href="../safe/schedulerList?s_id=${s.id}">����ȸ�� ��û ��Ȳ</a></li>
					</c:if>
					
					<c:if test="${s.category==2}">
					<li><a href="../safe/listchildren?id=${s.id}">��üȸ�� ��û ��Ȳ</a></li>
					</c:if>
				</ul>
			</li>
			
			</c:if>
		</ul>
	</li>
	<li><a href="../safe/female_addWrite">Safe Female</a>
		<ul>
			
	<c:if test="${s.id != null}">
	
	<li><a href="#">Taxi</a>
	<ul>
		<li><a href="../safe/t_findTaxi">�ýó�������</a></li>
		<li><a href="../safe/female_gps">���� ��ġ ����</a></li>
	</ul>
</li>
	<li class="menu-item-129"><a href="#">������Ī</a>
	<ul>
		<li><a href="../safe/p_server">������Ī ��û</a></li>
		<li><a href="../safe/female_police_list?id=${s.id}">������Ī ��Ȳ</a></li>
		<li><a href="../safe/female_sysList?id=${s.id}">������Ī ����</a></li>
	</ul>
	
	
	
</li>
</c:if>
</ul>
</li>
<li><a href="homeIntroduce">Safe Home</a>


<ul>
	<li><a href="homeIntroduce">��Ȱ��� �Ұ�</a></li>
<c:if test="${s.id != null}">
	<li><a href="../safe/homeSecurityList">Ȩ ��ť��Ƽ �� ��볻��</a></li>
	
</c:if>
</ul>
</li>

</ul>
</div>
</div>

