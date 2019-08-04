<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<h4 class="header">Edit News</h4>


<form:form class="col s12" method="POST" action="${pagesNews}" modelAttribute="formNews">
	<form:input path="id" type="hidden" />

	<div class="row">
		<div class="col s3"></div>
		<div class="col s6">
			<div class="input-field col s12">
				<form:input path="newsTitle" type="text" />
				<form:errors path="newsTitle" cssClass="red-text" />
				<label for="newsTitle">Title</label>
			</div>
			<div class="input-field col s12">
				<form:textarea id="textarea1" class="materialize-textarea" path="newsText" type="text" />
				<form:errors path="newsText" cssClass="red-text" />
				<label for="newsText">Text</label>
			</div>
		</div>
		<div class="col s3"></div>
	</div>
	<div class="row">
		<div class="col s4"></div>
		<div class="col s4">
			<button class="btn waves-effect waves-light" type="submit">Saveå</button>
		</div>
		<div class="col s4">
			<a class="btn waves-effect waves-light" href="${pagesNews}">Back</a>
		</div>
	</div>
</form:form>
