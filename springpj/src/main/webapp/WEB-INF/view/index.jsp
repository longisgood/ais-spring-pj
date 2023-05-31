<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="common/header.jsp"%>


<button id="find">Find</button>
<button id="info" onclick = "javascript:location.href='member/info'">Info</button>
<button id="join" onclick = "javascript:location.href='member/join'">Join</button>
<button id="login">Login</button>
<button id="mypage">My Page</button>
<button id="detail" onclick = "javascript:location.href='portfolio/detail'">Detail</button>
<button id="modify">Modify</button>
<button id="write">Write</button>


<script>
	$("#mypage").click(function(){
		location.href = "member/mypage";
	});
	$("#write").click(function(){
		location.href = "portfolio/write";
	});
	$("#login").click(function(){
		location.href = "member/login";
	});
	
</script>

<%@ include file="common/footer.jsp"%>


