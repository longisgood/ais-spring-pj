<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp" %>
<section class="container">
		 <h1>My Form</h1>
    <form id="regi" action="regi" method="post">
      <label for="pTitle">Title:</label>
      <input type="text" id="pTitle" name="pTitle" placeholder="Enter title label.." required>

      <label for="pJob">Job:</label>
      <input type="text" id="pJob" name="pJob" placeholder="Enter job label.." required>

      <label for="pComp">Company:</label>
      <input type="text" id="pComp" name="pComp" placeholder="Enter company label.." required>

      <label for="pEdu">Education:</label>
      <input type="text" id="pEdu" name="pEdu" placeholder="Enter education label.." required>

      <label for="pCareer">Career:</label>
      <input type="number" id="pCareer" name="pCareer" placeholder="Enter career label.." required>
      
      <label for="viewCheck">View Check</label>
      <input type="checkbox" id="viewCheck" name="viewCheck">

      <label for="pLicense">License:</label>
      <input type="text" id="pLicense" name="pLicense" placeholder="Enter license label.." required>

      <label for="pSkill">Skill:</label>
      <input type="text" id="pSkill" name="pSkill" placeholder="Enter skill label.." required>

      <label for="pText">Text:</label>
      <textarea id="pText" name="pText" placeholder="Enter text..." required></textarea>
    </form>
    	<button id="submitBtn" type="submit">Write</button>
</section>
<script>
	$("#submitBtn").click(function(){
		var viewCheck = $("#viewCheck").checked ? "N" : "Y"
		$("#viewCheck").val(viewCheck);
		$("#regi").submit();
	});
</script>
<%@ include file="../common/footer.jsp" %>