<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp" %>
<section class="container">
	<label for="pTitle">Title:</label>
      <input type="text" id="pTitle" name="pTitle" placeholder="Enter title label.."  readonly>

      <label for="pJob">Job:</label>
      <input type="text" id="pJob" name="pJob" placeholder="Enter job label.."  readonly>

      <label for="pComp">Company:</label>
      <input type="text" id="pComp" name="pComp" placeholder="Enter company label.."  readonly>

      <label for="pEdu">Education:</label>
      <input type="text" id="pEdu" name="pEdu" placeholder="Enter education label.."  readonly>
		
      <label for="pCareer">Career:</label>
      <input type="text" id="pCareer" name="pCareer" placeholder="Enter career label.."  readonly>
      
      <label for="viewCheck">View Check</label>
      <input type="checkbox" id="viewCheck" name="viewCheck">

      <label for="pLicense">License:</label>
      <input type="text" id="pLicense" name="pLicense" placeholder="Enter license label.."  readonly>

      <label for="pSkill">Skill:</label>
      <input type="text" id="pSkill" name="pSkill" placeholder="Enter skill label.."  readonly>

      <label for="pText">Text:</label>
      <textarea id="pText" name="pText" placeholder="Enter text..."  readonly></textarea>s
</section>
<script>
	var msg = "${message}";
	if(msg != null){
		alert(msg);
	}
</script>
<%@ include file="../common/footer.jsp" %>