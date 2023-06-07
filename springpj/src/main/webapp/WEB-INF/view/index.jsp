<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="common/header.jsp"%>
<section class="container">

<h1>Main</h1>
<hr>
<div>
<h2>Lastest</h2>
	<c:forEach items = "${PortFolio}" var = "item">
		<input id="main" type = "button"  value = "${item.PTitle}">
	</c:forEach>
</div>

<hr>

<div>
<h2>myPortfolio</h2>
<c:choose>
	<c:when test="${userInfo ne null}">
		<c:forEach items = "${portFolio}" var = "item">
			<input id="maintitle"  type ="button" value = "${item.PTitle}">
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
	$("#find").click(function(){
		location.href = "member/find";
	});
	$("#write").click(function(){
		location.href = "portfolio/write";
	});
	$("#main").click(function(){
		location.href = "main";
	});
	
</script>

<%@ include file="common/footer.jsp"%>


