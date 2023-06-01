<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="common/header.jsp"%>


<button id="find">Find</button>
<button id="info">Info</button>
<button id="join">Join</button>
<button id="login">Login</button>
<button id="mypage">My Page</button>
<button id="detail">Detail</button>
<button id="modify">Modify</button>
<button id="write">Write</button>

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
</script>

<%@ include file="common/footer.jsp"%>


