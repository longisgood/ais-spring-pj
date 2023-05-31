<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<link href="${contextPath}/css/detail.css" rel="stylesheet"
	type="text/css">
<div class="portfolio-item">
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
	</div>
</div>

<button onclick="printPage()" hidden>인쇄</button>

<script>
	//페이지 출력하기

	function printPage() {
		window.print();
	}
</script>
<%@ include file="../common/footer.jsp"%>