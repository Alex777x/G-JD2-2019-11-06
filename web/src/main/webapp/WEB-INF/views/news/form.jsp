<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<h4 class="header">Edit News</h4>


<form:form method="POST" action="${pagesNews}" modelAttribute="formNews">
	<form:input path="id" type="hidden" />

	<div class="form-group">
		<label for="newsTitle">Title</label>
		<form:input  class="form-control" path="newsTitle" type="text" />
		<form:errors path="newsTitle" cssClass="red-text" />
	</div>

	<div class="form-group">
		<label for="newsText">Text</label>
		<form:textarea class="form-control" path="newsText" type="text" rows="3" />
		<form:errors path="newsText" cssClass="red-text" />
	</div>

	<button class="btn btn-primary" type="submit">Save</button>
	<a class="btn btn-primary" href="${pagesNews}">Back</a>
</form:form>
