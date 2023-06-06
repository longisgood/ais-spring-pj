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
		제목 <input type="text" value="${port.PTitle}" readonly>
	</p>
	<p>
		아이디 <input type="text" value="${port.MId}" readonly>
	</p>
	<p>
		직업 <input type="text" value="${port.PJob}" readonly>
	</p>
	<p>
		회사 <input type="text" value="${port.PComp}" readonly>
	</p>
	<p>
		학력 <input type="text" value="${port.PEdu}" readonly>
	</p>
	<p>
		경력 <input type="text" value="${port.PCareer}" readonly>
	</p>
	<p>
		자격증 <input type="text" value="${port.PLisence}" readonly>
	</p>
	</c:if>
	<div class="details">
		<p>
			기술<input type="text" value="${port.PSkill}" readonly>
		</p>
		<p>
			상세내용<input type="text" value="${port.PText}" readonly>
		</p>
		<p>
			파일 <input type="text" value="${port.PFile}" readonly>
		</p>
		<button id="modifyBtn" type="submit">수정하기</button>
		<form id= "delete" action="delete" method="get">
				<input type="hidden" id="pNum" name="pNum" value="${port.PNum}">
				<button id="deleteBtn" type="submit">Delete</button>
		</form>
	</div>
</div>

<script>

	var  msg = "${msg}"
	
	if(msg != ''){
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

