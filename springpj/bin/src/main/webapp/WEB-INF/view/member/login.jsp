<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp" %>

<section class="container">
<div class="container">
    <h1>로그인</h1>
    <form action="loginCheck" method="POST">
      <div class="form-group">
        <label for="username">아이디:</label>
        <input type="text" id="mId" name="mId" placeholder="아이디를 입력하세요" required>
      </div>
      <div class="form-group">
        <label for="password">비밀번호:</label>
        <input type="password" id="mPw" name="mPw" placeholder="비밀번호를 입력하세요" required>
      </div>
      <div class="form-group">
        <input id="submitBtn" type="submit" value="로그인">
      </div>
    </form>
    <div class="buttons">
      <button id = "join" name = "join">회원가입</button>
      <button id = "idFind" name = "idFind">아이디찾기</button>
      <button id = "pwFind" name = "pwFind">비밀번호찾기</button>
      
    </div>
   
 
  </div>

</section>
<script>

//로그인 실패시
var msg = '${message}';
if(msg != ''){
   alert(msg);
   
}
//아이디찾기 버튼 클릭시
$("#idFind").click(function(){

    location.href = "find1";  // find 페이지로 이동
});

// 비번찾기 버튼 클릭시
$("#pwFind").click(function(){
/*     $("#idFinddetail").hide();  // 아이디찾기 기능을 숨김
    $("#pwFinddetail").show();  // 비밀번호 찾기 기능을 보이도록 설정 */
    location.href = "find2";  // find 페이지로 이동
});


</script>
<%@ include file="../common/footer.jsp" %>