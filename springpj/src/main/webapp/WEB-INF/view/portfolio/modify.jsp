<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<link href="${contextPath}/css/write.css" rel="stylesheet"
	type="text/css">
<section class="container">
	<h1>수정 페이지</h1>
	<form id="change" action="change" method="post">
		<input type="hidden" id="pNum" name="pNum"
			placeholder="Enter title label.." value="${portfolio.PNum}" required>
		<div>
			<label for="pTitle">Title:</label> <input type="text" id="pTitle"
				name="pTitle" placeholder="Enter title label.."
				value="${portfolio.PTitle}" required> <label for="viewCheck">View
				Check</label> <input type="checkbox" id="viewCheck" name="viewCheck">
		</div>
		<div>
			<label for="pJob">Job:</label> <input type="text" id="pJob"
				name="pJob" placeholder="Enter job label.."
				value="${portfolio.PJob}" required> <label for="pComp">Company:</label>
			<input type="text" id="pComp" name="pComp"
				placeholder="Enter company label.." value="${portfolio.PComp}"
				required>
		</div>
		<div>
			<label for="pEdu">Education:</label> <input type="text" id="pEdu"
				name="pEdu" placeholder="Enter education label.."
				value="${portfolio.PEdu}" required> <label for="pCareer">Career:</label>
			<input type="number" id="pCareer" name="pCareer"
				placeholder="Enter career label.." value="${portfolio.PCareer}"
				required>
		</div>
		<div>
			<label for="pLicense">Lisence:</label> <input type="text"
				id="pLisence" name="pLisence" placeholder="Enter lisence label.."
				value="${portfolio.PLisence}" required> <label for="pSkill">Skill:</label>
			<input type="text" id="pSkill" name="pSkill"
				placeholder="Enter skill label.." value="${portfolio.PSkill}"
				required>
		</div>
		<div>
			<label for="pText">Text:</label>
			<textarea id="pText" name="pText" placeholder="Enter text..."
				required>${portfolio.PText}</textarea>
		</div>
	</form>
	<button id="submitBtn" type="submit">Modify</button>
	<button id="backBtn">Back</button>
</section>
<script>
	
	$("#backBtn").click(function(){
		history.go(-1);
	}); 

	$("#submitBtn").click(function(){
		var titleCheck = $("#pTitle").val();
		if($("#viewCheck").is(":checked") == true){
			$("#viewCheck").val("Y");
	    }else{
	    	$("#viewCheck").val("N");
	    }
		var viewCheck = $("#viewCheck").val();
		
		if(titleCheck == null || titleCheck == undefined || titleCheck == ""){
			alert('タイトルを入力してください。')
			$('#pTitle').focus(); 
			return;
		}
		
		var check = confirm("このまま進めてもいいですか？");
		
		if(check == true){
			$("#change").submit();
		}else{
			alert('もう一度確認してください。')
		}
	})
</script>
<%@ include file="../common/footer.jsp"%>