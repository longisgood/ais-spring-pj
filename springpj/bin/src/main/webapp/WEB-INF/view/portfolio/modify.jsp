<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp" %>
<section class="container">
	<h1>작성 페이지</h1>
	<form id="regi" action="regi" method="post">
		<div>
			<label for="pTitle">Title:</label> <input type="text" id="pTitle"
				name="pTitle" placeholder="Enter title label.." required> <label
				for="viewCheck">View Check</label> <input type="checkbox"
				id="viewCheck" name="viewCheck">
		</div>
		<div>
			<label for="pJob">Job:</label> <input type="text" id="pJob"
				name="pJob" placeholder="Enter job label.." required> <label
				for="pComp">Company:</label> <input type="text" id="pComp"
				name="pComp" placeholder="Enter company label.." required>
		</div>
		<div>
			<label for="pEdu">Education:</label> <input type="text" id="pEdu"
				name="pEdu" placeholder="Enter education label.." required>

			<label for="pCareer">Career:</label> <input type="number"
				id="pCareer" name="pCareer" placeholder="Enter career label.."
				required>
		</div>
		<div>
			<label for="pLicense">Lisence:</label> <input type="text"
				id="pLisence" name="pLisence" placeholder="Enter lisence label.."
				required> <label for="pSkill">Skill:</label> <input
				type="text" id="pSkill" name="pSkill"
				placeholder="Enter skill label.." required>
		</div>
		<div>
			<label for="pText">Text:</label>
			<textarea id="pText" name="pText" placeholder="Enter text..."
				required></textarea>
		</div>
	</form>
	<button id="submitBtn" type="submit">Modify</button>
</section>
<script>
	$("#submitBtn").click(function() {
		var viewCheck = $("#viewCheck").checked ? "N" : "Y"
		$("#viewCheck").val(viewCheck);
		$("#regi").submit();
	});
</script>
<%@ include file="../common/footer.jsp" %>