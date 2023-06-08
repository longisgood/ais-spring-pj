<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<style>
    .heading {
        text-align: center;
        margin-top: 50px;
        margin-bottom: 50px;
    }

    /* 버튼 스타일 */
    .eMail button {
        background-color: #8FBC8F; /* 버튼 배경 색상 */
        color: #FFFFFF; /* 버튼 텍스트 색상 */
        border: none;
        padding: 10px 20px;
        margin-top: 10px;
        cursor: pointer;
        border-radius: 3px;
    }

    .pwfind button:hover {
        background-color: #6B8E23; /* 마우스 호버 시 버튼 배경 색상 */
    }
    
   /* 버튼 스타일 */
    .pwfind button {
        background-color: #8FBC8F; /* 버튼 배경 색상 */
        color: #FFFFFF; /* 버튼 텍스트 색상 */
        border: none;
        padding: 10px 20px;
        margin-top: 10px;
        cursor: pointer;
        border-radius: 3px;
    }

    .eMail button:hover {
        background-color: #6B8E23; /* 마우스 호버 시 버튼 배경 색상 */
    }
    
    body {
        background-color: #E9F3E9; /* 연녹색 배경 색상 */
    }

    h1 {
        color: #006400; /* 제목 색상 */
    }

    form {
        background-color: #FFFFFF; /* 폼 배경 색상 */
        padding: 20px;
        width: 400px;
        margin: 0 auto;
        margin-top: 50px;
        border-radius: 5px;
    }

    .form-group label {
        color: #006400; /* 라벨 색상 */
    }

    .form-group input[type="text"],
    .form-group input[type="email"],
    .form-group input[type="password"] {
        width: 100%;
        padding: 10px;
        border: 1px solid #006400; /* 입력 필드 테두리 색상 */
        border-radius: 3px;
        outline: none;
    }

    .form-group button {
        background-color: #006400; /* 버튼 배경 색상 */
        color: #FFFFFF; /* 버튼 텍스트 색상 */
        border: none;
        padding: 10px 20px;
        margin-top: 10px;
        cursor: pointer;
    }
</style>


<h1 class="heading">Id/パスワード探す</h1>

<div id="idFinddetail">

	<!-- 아이디 찾기 기능 구현 -->
	<form>
		<h1>IDを忘れた場合</h1>

		<div class="col-md-10 inputbb">
			<div class="form-group">
				<div class="eMail">
					<input type="email" name="idfindmEmail" class="idfindmEmail"
						id="idfindmEmail" placeholder="email" required>
					<button id="emailCheck"  type="button">確認</button>
					<input type="text" name="idcodein" class="idcodein" id="idcodein">
					<button id="idcodeCheck" type="button">Code確認</button>
						<input type="text" name="id" class="id" id="id">
				</div>
			</div>
		</div>

	</form>

</div>

<div id="pwFinddetail">

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
	$("#idcodein").hide();
	$("#idcodeCheck").hide();
	$('#id').hide();
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
	
	//Id忘れた場合
	$("#emailCheck").click(function(){
		$.ajax({
			type : "post",
			url : "emailCheck",
			dataType : "json",
			async:false,
			data : {
				"mEmail" : $("#idfindmEmail").val()
			},
			success : function(result){
				if(result == 1){
					$.ajax({
						type:'get',
						url:'checkEmail',
						dataType: "text",
						async:false,
						data : { "mEmail" : $("#idfindmEmail").val()},
						success : function(code){
							if(code){
								emailcode = code;
								$("#idcodein").show();
								$("#idcodeCheck").show();
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
	
	
	//IDを忘れた場合のメールのチェック
	$('#idcodeCheck').click(function(){
		if($('#idcodein').val() == emailcode){
			$.ajax({
				type : 'post',
				url:'eMailFind',
				dataType: "text",
				async:false,
				data : {"mEmail" : $('#idfindmEmail').val()},
				success : function(id){
					$('#id').show();
					$('#id').val(id);
					alert("情報を出力します。")
				}
			})
		}else{
			alert("コードが一致しません。");
		}
	})
	
	
	
	//パスワードを忘れた場合
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
	//パスワードを忘れた場合のメールのチェック
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