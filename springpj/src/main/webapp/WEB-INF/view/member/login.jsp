<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp" %>

<section class="container">
<div class="container">
    <h1>Login</h1>
    <form action="loginCheck" method="POST">
      <div class="form-group">
        <label for="username">ID:</label>
        <input type="text" id="mId" name="mId" placeholder="아이디를 입력하세요" required>
      </div>
      <div class="form-group">
        <label for="password">パスポート:</label>
        <input type="password" id="mPw" name="mPw" placeholder="비밀번호를 입력하세요" required>
      </div>
      <div class="form-group">
        <input id="submitBtn" type="submit" value="로그인">
      </div>
    </form>
    <div class="buttons">
      <button id = "join" name = "join">会員登録</button>
      <button id = "idFind" name = "idFind">IDを忘れた場合</button>
      <button id = "pwFind" name = "pwFind">パスワードを忘れた場合</button>
      
    </div>
   
 
  </div>

</section>
<script>

//Loginを失敗時
var msg = '${message}';
if(msg != ''){
   alert(msg);
   
}
//会員登録ボタン押せば
$("#join").click(function(){

    location.href = "join";  // join ページで移動
});

//ID探すボタン押せば
$("#idFind").click(function(){

    location.href = "find1";  // find ページで移動
});

// パスポート探すボタン押せば
$("#pwFind").click(function(){

    location.href = "find2";  // find ページで移動
});


</script>
<%@ include file="../common/footer.jsp" %>