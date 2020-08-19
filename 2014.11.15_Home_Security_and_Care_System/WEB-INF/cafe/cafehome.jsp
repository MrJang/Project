<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script type="text/javascript">
	function createCafe(board_num) {
		location.href = "../safe/createCafe?board_num="+board_num;
	}
</script>

<style type="text/css">
#safe_body, #left{
	display : none;
}
</style>



<a href="#" onclick="createCafe(${cafe.board_num})">그룹만들기</a>



