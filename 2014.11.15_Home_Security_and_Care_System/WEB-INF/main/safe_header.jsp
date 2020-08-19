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
			<li><a href="#">자녀안전귀가 신청</a>
			    <ul>
					<li><a href="../safe/childrenForm?category=${s.category}" style="text-decoration: none">자녀안전귀가신청</a></li>
					
					
				</ul>
			</li>
				<li><a href="#">신청 현황</a>
			    <ul>
			    	<c:if test="${s.category==1}">
					<li><a href="../safe/schedulerList?s_id=${s.id}">개인회원 신청 현황</a></li>
					</c:if>
					
					<c:if test="${s.category==2}">
					<li><a href="../safe/listchildren?id=${s.id}">업체회원 신청 현황</a></li>
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
		<li><a href="../safe/t_findTaxi">택시내역보기</a></li>
		<li><a href="../safe/female_gps">현재 위치 보기</a></li>
	</ul>
</li>
	<li class="menu-item-129"><a href="#">경찰매칭</a>
	<ul>
		<li><a href="../safe/p_server">경찰매칭 신청</a></li>
		<li><a href="../safe/female_police_list?id=${s.id}">경찰매칭 현황</a></li>
		<li><a href="../safe/female_sysList?id=${s.id}">경찰매칭 내역</a></li>
	</ul>
	
	
	
</li>
</c:if>
</ul>
</li>
<li><a href="homeIntroduce">Safe Home</a>


<ul>
	<li><a href="homeIntroduce">생활방범 소개</a></li>
<c:if test="${s.id != null}">
	<li><a href="../safe/homeSecurityList">홈 시큐리티 및 사용내역</a></li>
	
</c:if>
</ul>
</li>

</ul>
</div>
</div>

