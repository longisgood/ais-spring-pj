<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="common/header.jsp"%>
<style>
	h1 {
		font-size: 48px;
	}

	.headTitle {
		font-size: 32px;
	}

	.portfolioBtn {
		width: 70%;
		height: 64px;
		background-color: rgba(144,238,144,1);
		border: none;
		cursor: pointer;
	}

	.portfolioBtn:hover {
		background-color: rgba(144,238,144,0.7);
	}
</style>

<section class="container">

<h1>Main</h1>
<hr>
<div>
<h2 class="headTitle">Lastest</h2>
	<c:forEach items = "${PortFolio}" var ="item">
	<form id="move" action="portfolio/detail" method="get">
			<button class="portfolioBtn" id="lastest" >${item.PTitle}</button>
		<input type="hidden" id="pNum" name="pNum" value="${item.PNum}">
	</form>
	</c:forEach>
</div>

<hr>

<div>
<h2 class="headTitle">myPortfolio</h2>
<c:choose>
	<c:when test="${userInfo ne null}">
		<c:forEach items = "${portFolio}" var = "item">
		<form id="mymove" action="portfolio/detail" method="get">
			<button class="portfolioBtn" id="mywrite" >${item.PTitle}</button>
			<input type="hidden" id="pNum" name="pNum" value="${item.PNum}">
			</form>
		</c:forEach>
	</c:when>
	<c:otherwise>
	<h1 id="nai"> ない</h1>
	</c:otherwise>

</c:choose>
</div>
</section>

<script>
	$("#mypage").click(function(){
		location.href = "member/mypage";
	}); 
	$("#login").click(function(){
		location.href = "member/login";
	});
	$("#lastest").click(function(){
		$('#move').submit;
	}); 
	$("#mywrite").click(function(){
		$('#mymove').submit;
	}); 

	var msg = "${msg}";
	if(msg != ""){
		swal('感謝',msg,'success')
	}
	
</script>

<%@ include file="common/footer.jsp"%>


