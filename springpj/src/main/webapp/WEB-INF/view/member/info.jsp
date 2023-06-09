<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<link href="${contextPath}/css/joinForm.css" rel="stylesheet"
	type="text/css">
<section>
	<form id="infoForm" action="changeInfo" method="POST">
		<div class="input-row">
			<input type="text" class="id" id="mId" name="mId"
				value="${userInfo.MId}" readonly>
		</div>
		<div id="password">
			<div class="input-row">
				<input type="password" class="pw" id="mPw" name="mPw"
					placeholder="パスワード入力">
			</div>
			<div class="input-row">
				<font id="confirm" size="2"></font> <input type="password"
					class="pw" id="mPwCheck" placeholder="パスワード確認">
			</div>
		</div>

		<div class="input-row">
			<input type="text" id="mName" name="mName" class="name"
				value="${userInfo.MName}">
		</div>
		<div class="input-row">
			<input type="number" id="mAge" name="mAge" value="${userInfo.MAge}">
		</div>
		<input type="hidden" name="mGender" id="mGender"> <span>male</span><input
			type="radio" class="radio" name="option" value="male" id="male">
		<span>female</span><input type="radio" class="radio" name="option"
			value="female" id="female">

		<div class="input-row">
			<input type="email" id="mEmail" class="email" name="mEmail"
				value="${userInfo.MEmail}">
			<button type="button" id="emailCheck">コード送信</button>
		</div>
		<div class="input-row">
			<input type="text" id="code">
			<button type="button" id="codeCheck">コード確認</button>
			<input type="hidden" id="codeConfirm" value="N">
		</div>
	</form>
	<div>
		<button id="modifyBtn">修正</button>
		<button id="deleteBtn">脱退</button>
		<button id="backBtn">後ろへ</button>
	</div>

</section>
<script>
	var mGender = "${userInfo.MGender}"
	if(mGender == 'male'){
		$('#male').prop('checked',true)
	}else{
		$('#female').prop('checked',true)
	}
	
	
	$("#backBtn").click(function() {
		history.go(-1);
	});
	
	$('#code').hide();
	$('#codeCheck').hide();
	var emailcode = "";
	var  myEmail = "${userInfo.MEmail}"
	
	$(function() {
		$('#mPw').keyup(function() {
			$('#confirm').html('');
		});

		$('#mPwCheck').keyup(function() {
			if ($('#mPw').val() != $('#mPwCheck').val()) {
				$('#confirm').html('パスワードが一致しません。.');
				$('#confirm').attr('color', 'red');
			} else {
				$('#confirm').html('パスワードが一致します。');
				$('#confirm').attr('color', 'blue');
			}
		});

	});
	
	
	$("#emailCheck").click(function(){
		if($('#mEmail').val() == myEmail){
			var check = confirm('会員様が既に使用されているメールです。このまま進んでますか？')
			if(check == true){
				$('#emailCheck').hide();
				$('#codeConfirm').val('Y');
				return;
			}else{
				swal('修正要望','メールを修正してください。','info')
				return;
			}
		}
		
		$.ajax({
			type : "post",
			url : "emailCheck",
			dataType : "json",
			async:false,
			data : {
				"mEmail" : $("#mEmail").val()
			},
			success : function(result){
				if(result == 0){
					$.ajax({
						type:'get',
						url:'checkEmail',
						dataType: "text",
						async:false,
						data : { "mEmail" : $("#mEmail").val()},
						success : function(code){
							if(code){
								emailcode = code;
								$("#code").show();
								$("#codeCheck").show();
								swal('完了','認証番号を送りました。','success')
							}else{
								swal('Error',"エーラが発生しました。",'error')
							}
						}
					})
				}else{
					swal('禁止','一致するEmailが存在します。','warning')
					
				}
			}
		})
	});
	
	$('#codeCheck').click(function(){
		if($('#code').val() == emailcode){
			$('#codeConfirm').val('Y');
			swal("完了","確認できました。","success")
		}else{
			swal('確認要望','コードが違います。',"warning")
		}
	})
	
	
	$('#modifyBtn').click(function() {
			var valPass = $('#mPw').val();
			var valCPass = $('#mPwCheck').val();
			var valName = $('#mName').val();
			var valAge = $('#mAge').val();
			var valEmail = $('#mEmail').val();
			var emailCheck = $('#codeConfirm').val();
			
			if($('#male').is(':checked')){
				$('#mGender').attr('value','male')
			}
			
			if($('#female').is(':checked')){
				$('#mGender').attr('value','female')
			}

			if (valPass == null || valPass == undefined || valPass == "") {
				swal("不可能", "パスワードを入力してください。", "info");
				$('#member_pw').focus();
				return;
			}
			if (valPass != valCPass) {
				swal("不可能", "パスワードが一致されません。", "waring");
				$('#mPw').val("");
				$('#mPwCheck').val("");
				$('#mPw').focus();
				return;
			}
			if (valName == null || valName == undefined || valName == "") {
				swal("不可能", "名前を入力してください。", "info");
				$('#ｍName').focus();
				return;
			}

			if (valAge == null || valAge == undefined || valAge == "") {
				swal("不可能", "年齢を入力してください。", "info");
				$("mAge").focus();
				return;
			}

			if (!$('#male').is(':checked') && !$('#female').is(':checked')) {
				swal("不可能", "性別を確認してください。", "info");
				return;
			}
			if (emailCheck == "" || emailCheck == "N") {
				swal("不可能", "Emailをチェックしてください。", "info");
				return;
			}
			$('#infoForm').submit();
		});
	
		$('#deleteBtn').click(function(){
			location.href="${contextPath}/member/delete";
		})
</script>
<%@ include file="../common/footer.jsp"%>