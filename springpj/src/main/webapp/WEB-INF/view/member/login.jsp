<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp" %>
<style>
  .container {
    background-color: rgba(34,139,34,1);
    padding: 20px;
    width: 50%;
    height: 480px;
    margin-left: auto;
    margin-right: auto;
    margin-top: 64px;
    border-radius: 64px;
  }

  h1 {
    color: black;
  }
  
  #mId {
    width: 140px;
  }
  
  .form-group:nth-child(2n) {
    margin-top: 64px;
  }
  
  #mPw {
    width: 140px;
    padding: 5px;
  }
  
  #mPw:hover {
    color: blue;
  }
  
  #submitBtn {
    margin-top: 64px;
  }
  
  #idFind {
    position: absolute;
    top: 270px;
    left: 702px;
  }
  
  #idFind:hover {
    color: aquamarine;
    cursor: pointer;
  }
  
  #pwFind {
    position: absolute;
    top: 400px;
    left: 670px;
  }
  
  #pwFind:hover {
    color: aquamarine;
    cursor: pointer;
  }
  
  #join {
    margin-top: 32px;
    width: 60%;
    cursor: pointer;
  }
  
  .headTitle {
    font-size: 32px;
    cursor: pointer;
  }
  
  #lastest , #mywrite {
    background-color: rgba(144,238,144,0.6 );
    width: 60%;
    padding: 8px;
    font-size: 120%;
    cursor: pointer;
  }
  
  #lastest:hover , #mywrite:hover {
    background-color: rgba(144,238,144,1 );
  }
  
  
</style>
<section>
<div class="container">
    <h1>Login</h1>
    
    <form action="loginCheck" method="POST">
      <div class="form-group">
        <label for="username">ID</label><br>
        <input type="text" id="mId" name="mId" placeholder="아이디를 입력하세요" required>
      </div>
      <div class="form-group">
        <label class="pwBox" for="password">パスワード</label><br>
        <input type="password" id="mPw" name="mPw" placeholder="비밀번호를 입력하세요" required>
      </div>
      <div class="form-group">
        <input id="submitBtn" type="submit" value="ロ グ イ ン">
      </div>
    </form>
    <div class="buttons">
      <button id = "join" name = "join">新 規 会 員 登 録</button>
      <a id = "idFind" name = "idFind">IDを忘れた場合</a>
      <a id = "pwFind" name = "pwFind">パスワードを忘れた場合</a>
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