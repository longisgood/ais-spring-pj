<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../common/header.jsp"%>
<link href="${contextPath}/css/mypage.css" rel="stylesheet"
	type="text/css">
<section class="container">
	<div class="pfInfo">
		<c:forEach items="${portfolio}" var="item">
			<form class="group" id="group_${item.PNum}" action="${contextPath}/portfolio/detail" method="get">
				<input type="hidden" id="pNum" name="pNum" value="${item.PNum}">
				<button class="detailBtn" id="detailBtn_${item.PNum}" >${item.PTitle}</button>
				<span class="deleteBtn" id="${item.PNum}" >X</span>
			</form>
			<form class="deleteP${item.PNum}" id="deleteP_${item.PNum}" action="deleteP" method="get">
				<input type="hidden" id="pNum" name="pNum" value="${item.PNum}">
			</form>
		</c:forEach>
	</div>
	<div class="infoButton">
		<h1 id="memberName">${userInfo.MName}様<br>おはようございます！</h1>
		<button id="infopage">情報修正</button>
	</div>
	<button id="deletepage">編集</button>
	<button id="completeBtn">完了</button>
	<button id="writepage">作成</button>
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

	$('.detailBtn').click(function() {
		$('#group').submit();
	});
	
	$('.deleteBtn').click(function() {
		var parameter = $(this).attr('id');
		$('.deleteP'+parameter+'').submit(); 
	});
	
	$("#infopage").click(function(){
		location.href = "info";
	});
	
	$("#writepage").click(function(){
		location.href = "../portfolio/write";
	});
	$("#deletepage").click(function(){
		$(".deleteBtn").fadeIn();
		$("#deletepage").fadeOut()
		$("#completeBtn").fadeIn();
	});
	$("#completeBtn").click(function(){
		$("#completeBtn").fadeOut();
		$("#deletepage").fadeIn();
		$(".deleteBtn").fadeOut();
	});
</script>
<%@ include file="../common/footer.jsp"%>