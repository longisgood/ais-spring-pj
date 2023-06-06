<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="common/header.jsp"%>


<button id="find">Find</button>
<button id="info" onclick = "javascript:location.href='member/info'">Info</button>
<button id="join" onclick = "javascript:location.href='member/join'">Join</button>
<button id="mypage">My Page</button>
<button id="detail" onclick = "javascript:location.href='portfolio/detail'">Detail</button>
<button id="modify">Modify</button>
<button id="write">Write</button>
<button id="main">Main</button>



	<c:forEach items = "${PortFolio}" var = "item">
		<input type = "text" value = "${item.PTitle}">
	</c:forEach>




<c:choose>
	<c:when test="${userInfo ne null}">
		<c:forEach items = "${portFolio}" var = "item">
			<input type = "text" value = "${item.PTitle}">
		</c:forEach>
	</c:when>
	<c:otherwise>
	<h1> 없어 새끼야</h1>
	</c:otherwise>

</c:choose>


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


