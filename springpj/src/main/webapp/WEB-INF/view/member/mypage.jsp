<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../common/header.jsp"%>
<link href="${contextPath}/css/mypage.css" rel="stylesheet"
	type="text/css">
<section class="container">
	<div>
		<c:forEach items="${portfolio}" var="item">
			<form id="group" action="${contextPath}/portfolio/detail"
				method="get">
				<input type="hidden" id="pNum" name="pNum" value="${item.PNum}">
				<button id="detailBtn">${item.PTitle}</button>
			</form>
			<form id="deleteP" action="deleteP" method="get">
			<input type="hidden" id="pNum" name="pNum" value="${item.PNum}">
				<span id="deleteBtn">X</span>
			</form>
		</c:forEach>
	</div>
	<h1>${userInfo.MName}様、おはようございます！</h1>
	<button id="infopage">情報修正</button>
</section>
<script>
	var msg = "${msg}"
	var emsg = "${emsg}"

	if (msg != '') {
		swal('処理完了', msg, 'info')
	}
	
	if (emsg != '') {
		swal('処理完了', emsg, 'warning')
	}

	$('#detailBtn').click(function() {
		$('#group').submit();
	});
	
	$('#deleteBtn').click(function() {
		$('#deleteP').submit();
	})
	
	$("#infopage").click(function(){
		location.href = "info";
	})
</script>
<%@ include file="../common/footer.jsp"%>