<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp" %>
  <h1>아이디/비밀번호 찾기</h1>

  <div id="idFinddetail" >
    <h2>아이디 찾기</h2>
    <!-- 아이디 찾기 기능 구현 -->
  </div>

  <div id="pwFinddetail" >
    <h2>비밀번호 찾기</h2>
    <!-- 비밀번호 찾기 기능 구현 -->
  </div>
  
  <script>

  
  $(document).ready(function() {
	  var find = '${find}';
	  if(find=='id'){
		  $("#idFinddetail").show();
	        $("#pwFinddetail").hide();
	  }else{
		  $("#idFinddetail").hide();
	        $("#pwFinddetail").show();
	  }
      });
  
  
  </script>


<%@ include file="../common/footer.jsp" %>