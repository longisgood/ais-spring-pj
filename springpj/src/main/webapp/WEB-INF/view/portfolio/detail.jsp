<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<link href="${contextPath}/css/detail.css" rel="stylesheet"
	type="text/css">
<div class="portfolio-item">
	<form id="modify" action="modify" method="post">
		<input type="hidden" id="pNum" name="pNum" value="${port.PNum}">
	</form>
	<c:if test="${port.viewCheck eq 'Y'}">
		<p>
			タイトル <input type="text" value="${port.PTitle}" readonly>
		</p>
		<p>
			職業 <input type="text" value="${port.PJob}" readonly>
		</p>
		<p>
			会社 <input type="text" value="${port.PComp}" readonly>
		</p>
		<p>
			学歴 <input type="text" value="${port.PEdu}" readonly>
		</p>
		<p>
			経歴 <input type="text" value="${port.PCareer}" readonly>
		</p>
		<p>
			資格証 <input type="text" value="${port.PLisence}" readonly>
		</p>
	</c:if>
	<div class="details">
		<p>
			技術<input type="text" value="${port.PSkill}" readonly>
		</p>
		<p>
			詳細内容<input type="text" value="${port.PText}" readonly>
		</p>
		<button id="modifyBtn" type="submit">修正</button>
		<button id="deleteBtn" type="submit">削除</button>
		<form id="delete" action="delete" method="get">
			<input type="hidden" id="pNum" name="pNum" value="${port.PNum}">
		</form>
	</div>
</div>

<script>
	var msg = "${msg}"

	if (msg != '') {
		swal('処理完了', msg, 'success')
	}

	$("#deleteBtn").click(function() {
		$('#delete').submit();
	})

	$("#modifyBtn").click(function() {
		$('#modify').submit();
	})
</script>
<%@ include file="../common/footer.jsp"%>

