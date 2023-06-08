<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp" %>
<style>
    body {
        background-color: #E9F3E9; /* 연녹색 배경 색상 */
    }

    .container {
        background-color: #FFFFFF; /* 로그인 창 배경 색상 */
        padding: 20px;
        width: 400px;
        margin: 0 auto;
        margin-top: 50px;
        border-radius: 5px;
    }

    h1 {
        color: #006400; /* 제목 색상 */
    }

    .form-group label {
        color: #006400; /* 라벨 색상 */
    }

    .form-group input[type="text"],
    .form-group input[type="password"] {
        width: 100%;
        padding: 10px;
        border: 1px solid #006400; /* 입력 필드 테두리 색상 */
        border-radius: 3px;
        outline: none;
    }

    .form-group input[type="submit"] {
        background-color: #006400; /* 로그인 버튼 배경 색상 */
        color: #FFFFFF; /* 로그인 버튼 텍스트 색상 */
        border: none;
        padding: 10px 20px;
        cursor: pointer;
    }

    .buttons button {
        background-color: #006400; /* 버튼 배경 색상 */
        color: #FFFFFF; /* 버튼 텍스트 색상 */
        border: none;
        padding: 10px 20px;
        margin-right: 10px;
        cursor: pointer;
    }
</style>
<section>
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