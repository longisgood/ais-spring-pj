<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<h1>아이디/비밀번호 찾기</h1>

<div id="idFinddetail">
	<h2>아이디 찾기</h2>
	<!-- 아이디 찾기 기능 구현 -->
	<form>
		<h1>IDを忘れた場合</h1>

		<div class="col-md-10 inputbb">
			<div class="form-group">
				<div class="eMail">
					<input type="email" name="idfindmEmail" class="idfindmEmail"
						id="idfindmEmail" placeholder="email" required>
					<button onclick="emailCheck()">確認</button>
				</div>
			</div>
		</div>

	</form>

</div>

<div id="pwFinddetail">
	<h2>비밀번호 찾기</h2>
	<!-- 비밀번호 찾기 기능 구현 -->

	<form>
		<h1>パスワードを忘れた場合</h1>
		<div class="row">
			<div class="col-md-10 inputbb">
				<div class="pwfind">
					<div>
						<input type="text" name="mId" class="mId" id="mId"
							placeholder="mId" required>
					</div>
					<div class="eMail">
						<input type="email" name="pwfindmEmail" class="pwfindmEmail"
							id="pwfindmEmail" placeholder="email" required>
					</div>
					<button id="memberCheck"  type="button">確認</button>
					<input type="text" name="codein" class="codein" id="codein">
					<button id="codeCheck" type="button">Code確認</button>
					<input type="text" name="pw" class="pw" id="pw">
				</div>
			</div>
		</div>
	</form>



</div>

<script>
	$("#codein").hide();
	$("#codeCheck").hide();
	$('#pw').hide();
	//ボタンによってID／パスワード探す画面表示
	$(document).ready(function() {
		var find = '${find}';
		if (find == 'id') {
			$("#idFinddetail").show();
			$("#pwFinddetail").hide();
		} else {
			$("#idFinddetail").hide();
			$("#pwFinddetail").show();
		}
	});
	var emailcode = '';
	$('#memberCheck').click(function(){
		$.ajax({
			type : 'post',
			url : 'memberCheck',
			dataType : "json",
			async:false,
			data : {"mId" : $('#mId').val() , "mEmail" : $('#pwfindmEmail').val()},
			success : function(result){
					if(result　== 1){
						$.ajax({
							type:'get',
							url:'checkEmail',
							dataType: "text",
							async:false,
							data : { "mEmail" : $('#pwfindmEmail').val()},
							success : function(code){
								if(code){
									emailcode = code;
									$("#codein").show();
									$("#codeCheck").show();
									alert('認証番号を送りました。')
								}else{
									alert("エーラが発生しました。")
								}
							}
						})
					}else{
						alert('一致するメンバーがいないです。')
					}
			}
		})
	})
	
	$('#codeCheck').click(function(){
		if($('#codein').val() == emailcode){
			$.ajax({
				type : 'post',
				url:'pwFind',
				dataType: "text",
				async:false,
				data : {"mId" : $('#mId').val() , "mEmail" : $('#pwfindmEmail').val()},
				success : function(pw){
					$('#pw').show();
					$('#pw').val(pw);
					alert("情報を出力します。")
				}
			})
		}else{
			alert("コードが一致しません。");
		}
	})
	
</script>


<%@ include file="../common/footer.jsp"%>