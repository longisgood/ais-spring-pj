<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<script>
	function logout() {
		$.ajax({
			url : "${contextPath}/logout", // ログアウトの処理をするURL
			method : "POST", // ログアウトの申請方法 (GET 又は POST)
			success : function(response) {
				// ログアウトに成功した時遂行する作業
				window.location.href = "/login"; // 로그아웃 성공 후 이동할 페이지
			},
			error : function(error) {
				// ログアウトに失敗した時に遂行する作業
				console.log("로그아웃 실패: " + error);
			}
		});
	}
</script>

<head>
<meta charset="UTF-8">
<link href="${contextPath}/css/style.css" rel="stylesheet"
	type="text/css">
<link rel="icon" href="data:,">
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>

<body>


	<div class="navbar">
		<div class="logo">
			<a href="/"> <img src="${contextPath}/img/logo.png" alt="로고 이미지">
			</a>
		</div>

		<!-- ログインに失敗した時のアラーム処理 -->
		<c:choose>
			<c:when test="${userInfo eq null}">
				<button class="login-btn" id="login-btn">Login</button>
			</c:when>
			<c:otherwise>
				<button id="mypage">My Page</button>
				<button class="login-btn" id="logout-btn">Logout</button>
			</c:otherwise>
		</c:choose>

	</div>
	<script>
		/* 로그인버튼을 누르면 어디서든 로그인 페이지로 올 수 있음 */
		/* ログインボタンを押せばどこにでもログインページに移動ができる */
		$("#login-btn").click(function() {
			location.href = "${contextPath}/member/login-btn";
		});
		//로그아웃 버튼을 누르면 어디서든 메인페이지로 돌아감 
		/* ログアウトボタンを押せばどこにでもメインページに移動ができる  */
		   $("#logout-btn").click(function() {
			   location.href = "${contextPath}/member/logout-btn"
		    });

			$("#mypage").click(function(){
				location.href = "${contextPath}/member/mypage";
			}); 
	</script>

