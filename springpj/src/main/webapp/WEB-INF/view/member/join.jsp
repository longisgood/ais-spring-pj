<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<link href="${contextPath}/css/joinForm.css" rel="stylesheet"
	type="text/css">
<section>
	<form id="joinform" action="register" method="POST">
		<div class="input-row" >
			<input type="text" class="id" id="mId" name="mId"
				placeholder="ID重複確認をしてください。"> <input type="button"
				class="button" value="ID重複確認" id="reduplication_check"> <input
				type="hidden" value="N" id="reduCkConfirm">
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
				placeholder="名前入力">
		</div>
		<div class="input-row">
			<input type="number"  id="mAge" name="mAge"
				placeholder="年齢">
		</div>
		<input type="hidden" name="mGender" id="mGender"> 
		<span>male</span><input type="radio" class="radio" name="option"
			value="male" id="male"> <span>female</span><input
			type="radio" class="radio" name="option" value="female" id="female">

		<div class="input-row">
			<input type="email" id="mEmail" class="email" name="mEmail"
				placeholder="Emailを入力" ><button type="button"  id="emailCheck">コード送信</button>
		</div>
		<div class="input-row">
			<input type="text" id="code" ><button type="button"  id="codeCheck">コード確認</button> <input
				type="hidden" id="codeConfirm" value="N">
		</div>
	</form>
	<div>
				<button id="joinBtn">加入</button>
				<button id="backBtn">後ろへ</button>
		</div>
</section>
<script>
	$('#code').hide();
	$('#codeCheck').hide();
	var emailcode = "";

	$("#reduplication_check").click(function() {
		if($("#mId").val() == null || $("#mId").val() == "" || $("#mId").val() == undefined){
			swal("不可能", "IDを入力してください。", "info");
			$('#mId').focus();
			return;
		}
		$.ajax({
			url : "idCheck",
			type : "POST",
			dataType : "json",
			data : {
				"mId" : $("#mId").val()
			},
			success : function(data) {
				if (data == 1) {
					swal("不可能", "同じIDが存在います。", "info");
					$("#mId").val("");
				} else {
					swal("可能", "使用してもいいIDです。", "info");
					$("#reduCkConfirm").attr("value", "Y");
				}
			}
		});
	});

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

	$("#backBtn").click(function() {
		history.go(-1);
	});
	
	$("#emailCheck").click(function(){
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
		
		$('#joinBtn').click(function() {
			var valId = $('#mId').val();
			var valPass = $('#mPw').val();
			var valCPass = $('#mPwCheck').val();
			var valName = $('#mName').val();
			var valAge = $('#mAge').val();
			var valEmail = $('#mEmail').val();
			var idCheck = $('#reduCkConfirm').val();
			var emailCheck = $('#codeConfirm').val();
			
			if($('#male').is(':checked')){
				$('#mGender').attr('value','male')
			}
			
			if($('#female').is(':checked')){
				$('#mGender').attr('value','female')
			}

			if (valId == null || valId == undefined || valId == "") {
				swal("不可能", "IDを入力してください。", "info");
				$('#mId').focus();
				return;
			}
			if (idCheck == "" || idCheck == "N") {
				swal("不可能", "ID重複確認をしてください。", "info");
				$('#reduCkConfirm').focus();
				return;
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
			$('#joinform').submit();
		});

</script>
<%@ include file="../common/footer.jsp"%>