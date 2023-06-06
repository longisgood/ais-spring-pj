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
					<button 　onclick="pwFind">確認</button>
				</div>
			</div>
		</div>
	</form>



</div>

<script>
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

	//아이디 찾기 실패시
	/* 	var msg = '${message}';
		if (msg != '') {
			alert(msg);

		} */

	//ID探すのeMailを確認を通じてIDの情報を返還
/* function emailCheck() {
		$.ajax({
			type : "POST",
			url : "eMailFind",
			data : {
				"mEmail" : document.getElementById("idfindmEmail").value
			},
			success : function(result) {
				if (result == "") {
					alert("確認ができました。");
				} else {
					alert("없어 병신아");
				}
			},
			error : function() {
				alert("이메일을 찾을 수 없습니다."); // 이메일 찾기 실패 시 알림창 표시
			}
		});

	}
 */
	//パスワード探す機能のIDが合ってるか確認する
	function idCheck() {
		$.ajax({
			type : "POST",
			url : "idCheck",
			data : {
				"mId" : document.getElementById("mId").value
			},
			success : function(result) {
				if (result == 1) {
					alert("確認ができました。");
				} else {
					alert("없어 병신아");
				}
			},
			error : function() {
				alert("아이디를 찾을 수 없습니다."); // ID 찾기 실패 시 알림창 표시
			}
		});

	}

	//パスワード探す機能のeMailが合ってるか確認する
	/* function emailCheck() {
		$.ajax({
			type : "POST",
			url : "emailCheck",
			data : {
				"mEmail" : document.getElementById("pwfindmEmail").value
			},
			success : function(result) {
				if (result == 1) {
					alert("確認ができました。");
				} else {
					alert("없어 병신아");
				}
			},
			error : function() {
				alert("이메일을 찾을 수 없습니다."); // 이메일 찾기 실패 시 알림창 표시
			}
		});

	} */
	
	
</script>


<%@ include file="../common/footer.jsp"%>