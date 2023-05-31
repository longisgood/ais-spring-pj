<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<link href="${contextPath}/css/joinForm.css" rel="stylesheet"
	type="text/css">
<section>
	<form action="join" method="POST" onsubmit="return checkValues()">
		<div hidden>
			<img id="preview" class="profile-pic" src="" onclick="fileInput()">
			<input type="file" name="imageFile" id="profile-pic" accept="image/*"
				onchange="previewImage(event)" hidden>
		</div>

			<div class="input-row" id="idcheck">
				<input type="text" class="id" id="mId" name="mId"
					placeholder="중복확인을 해주세요"> <input type="button"
					class="button" value="ID 중복확인" onclick="idCheck();">
			</div>
			<p class="visibility" id="mesage">임시 메세지</p>
			<div id="password">
				<div class="input-row">
					<input type="password" class="pw" id="mPw" name="mPw"
						placeholder="비밀번호 입력">
				</div>
				<div class="input-row">
					<input type="password" class="pw" id="mPwCheck"
						placeholder="비밀번호 확인">
				</div>
			</div>
			<p id=pwcheck class="visibility">임시 메세지</p>

			<div class="input-row">
				<input type="text" id="mName" name="mName" class="name"
					placeholder="이름 입력">
			</div>
			<div class="input-row">
				<input type="number" class="age" id="mAge" name="age"
					placeholder="나이" min="0" maxlength="3"
					oninput="numberMaxLength(this);">
			</div>

			<input type="hidden" name="mGender" id="mGender"> <span>male</span><input
				type="radio" class="radio" name="option" value="male"> <span>female</span><input
				type="radio" class="radio" name="option" value="female"> <span>other</span><input
				type="radio" class="radio" name="option" value="other">

			<div class="input-row">
				<input type="email" id="mEmail" class="email" name="mEmail"
					placeholder="이메일 입력"> <input type="button" class="button" required
					value="코드 송신" onclick="showCode();">
			</div>
			<div class="input-row">
				<div id="codecheck" class="visibility">
					<input type="email" id="code" class=" email" placeholder="코드 입력">
					<input type="button" class="button" value="코드 확인">
				</div>
			</div>
		<input type="submit" class="btn" value="J O I N"> <input
			type="hidden" id="id_cd" value="F"> <input type="hidden"
			id="pw_cd" value="F"> <input type="hidden" id="code_cd"
			value="F">
	</form>
</section>
<script>
	let mId = document.getElementById('mId');
	let mPw = document.getElementById('mPw');
	let mPwCheck = document.getElementById('mPwCheck');
	let pwcheck = document.getElementById('pwcheck');
	let mName = document.getElementById('mName');
	let age = document.getElementById('mAge');
	let gender = document.getElementById('mGender');
	let id_cd = document.getElementById('id_cd');//중복확인 여부
	let pw_cd = document.getElementById('pw_cd');// 비밀번호 일치 여부
	let code_cd = document.getElementById('code_cd'); //이메일 송신코드 일치 여부

	//라디오 버튼 하나만 고르기
	const radioButtons = document.querySelectorAll('input[class="radio"]');
	radioButtons.forEach(function(radio) {
		radio.addEventListener('click', function() {
			var selectedOption = document
					.querySelector('input[name="option"]:checked');
			if (selectedOption) {
				var selectedValue = selectedOption.value;
				gender.value = selectedValue;
			}
			radioButtons.forEach(function(otherRadio) {
				if (otherRadio !== radio) {
					otherRadio.checked = false;
				}
			});
		});
	});

	/* 	//사진 저장 관련 기능
	 function fileInput() {
	 var fileInput = document.getElementById("profile-pic");
	 fileInput.click();
	 }

	 //사진 출력 기능
	 function previewImage(event) {
	 var input = event.target;
	 var image = document.getElementById("preview");

	 if (input.files && input.files[0]) {
	 var reader = new FileReader();
	 reader.onload = function() {
	 image.src = reader.result;
	 };
	 reader.readAsDataURL(input.files[0]);
	 } else {
	 image.src = "";
	 }
	 } */

	//숫자 자릿수 제한
	function numberMaxLength(e) {
		if (e.value.length > e.maxLength) {
			e.value = e.value.slice(0, e.maxLength);
		}
	}

	let password = document.getElementById('password');

	//패스워드를 입력할 때마다 일치하는지검사 
	password.addEventListener("input", checkPassword);

	function checkPassword() {
		document.getElementById("pwcheck").style.visibility = "visible";
		if (mPw.value.trim().length == 0) {
			document.getElementById('pwcheck').textContent = "비밀번호는 필수 항목입니다."
		} else if (mPw.value.trim().length < 7 || mPw.value.trim().length > 10) {
			document.getElementById('pwcheck').textContent = "비밀번호는 7~10자 사이로 입력해주세요."
		} else if (mPw.value.trim() != mPwCheck.value.trim()) {
			document.getElementById('pwcheck').textContent = "비밀번호가 서로 다릅니다"
		} else {
			document.getElementById('pwcheck').textContent = ""
		}

		if (pwcheck.textContent == "") {
			$("#pw_cd").val("T");
		} else {
			$("#pw_cd").val("F");
		}
	}

	//입력된 값 검사
	function checkValues() {
		if (mId.value.trim().length == 0) {
			alert('아이디는 필수 항목입니다.');
			mId.focus();
			return false;
		} else if (mId.value.trim().length < 3 || mId.value.trim().length > 10) {
			alert('아이디는 3~10자로 입력해주세요');
			mId.focus();
			return false;
		}
		//이름체크
		if (mName.value.trim().length == 0) {
			alert('이름은 필수항목입니다.');
			mName.focus();
			return false;
		} else if (mName.value.trim().length < 2
				|| mName.value.trim().length > 10) {
			alert('이름은 2~10자리로 입력해주세요.');
			mName.focus();
			return false;
		}

		if (mEmail.value.trim().length == 0) {
			alert('이메일은 필수 항목입니다.');
			mEmail.focus();
			return false;
		}

		/* 이름에 숫자 못넣게 하기 */
		let nameValue = mName.value;
		for (let i = 0; i < nameValue.length; i++) {
			if (!isNaN(nameValue.charAt(i))) {
				let message = nameValue.charAt(i) + '은 사용할수 없습니다.';
				alert(message);
				mName.focus();
				return false;
			}
		}

		//중복확인과 비밀번호 일치가 확인 됬는지 확인
		if (id_cd.value == 'F') {
			alert('중복확인을 해주세요.');
			return false;
		}

		if (pw_cd.value == 'F') {
			alert('비밀번호를 올바르게 입력해주세요.');
			return false;
		}
		if (code_cd.value == 'F') {
			alert('코드를 올바르게 입력해주세요');
			return false;
		}

	}

	//중복확인 
	function idCheck() {
		$.ajax({
			type : "POST",
			url : "idCheck",
			data : {
				"mId" : mId.value
			},
			success : function(data) {
				document.getElementById("mesage").style.visibility = "visible";
				if (data == 0) {
					$("#mesage").text("사용 가능한 아이디입니다");
					$("#id_cd").val("T");
					//id_check_cd="true";
				} else {
					$("#mesage").text("이미 존재하는 아이디입니다");
					$("#id_cd").val("F");

				}

			},
		});

	}

	//코드 입력칸 나타내기
	function showCode() {
		$.ajax({
					type : "POST",
					url : "emailCheck",
					data : {
						"mEmail" : mEmail.value
					},
					success : function(data) {
						if (data == 0) {
							document.getElementById("codecheck").style.visibility = "visible";
						} else {
							alert("이 메일로 가입한 유저가 이미 존재합니다.");
							document.getElementById("codecheck").style.visibility = "hidden";
						}

					},
				});
	}
</script>
<%@ include file="../common/footer.jsp"%>