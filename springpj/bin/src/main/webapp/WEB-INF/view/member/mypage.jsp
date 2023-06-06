<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp" %>
<section class="container">
		<div>
			<c:forEach items="${portfolio}"  var="item">
			<form id="group" action="${contextPath}/portfolio/detail" method="get">
					<input type="hidden"  id="pNum" name="pNum" value="${item.PNum}">
					<button id="detailBtn">${item.PTitle}</button>
					<span id="deleteBtn">X</span>
			</form>		
			</c:forEach>
		</div>
</section>
<script>
	$('#detailBtn').click(function(){
		$('#group').submit();
	});
</script>
<%@ include file="../common/footer.jsp" %>