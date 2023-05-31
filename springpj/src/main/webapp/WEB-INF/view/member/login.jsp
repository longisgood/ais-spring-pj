<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp" %>
<section class="container">
			<form action="loginCheck" method="post">
					<label for= "mId">ID:</label>
					<input type="text"  id="mId" name="mId"  required>	
					<label for= "mPw">PW:</label>
					<input type="password"  id="mPw" name="mPw" required>
					<button>Login</button>			
			</form>
</section>
<%@ include file="../common/footer.jsp" %>