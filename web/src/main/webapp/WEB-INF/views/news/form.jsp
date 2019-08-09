<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<sec:authorize access="isAnonymous()">
	<p class="text-center"><spring:message code="page.all.notLogged" /></p>
</sec:authorize>

<sec:authorize access="!isAnonymous()">
	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<h4 class="header">Edit News</h4>

		<form:form method="POST" action="${pagesNews}" modelAttribute="formNews">
			<form:input path="id" type="hidden" />

			<div class="form-group">
				<label for="newsTitle"><spring:message code="page.news.title" /></label>
				<form:input class="form-control" path="newsTitle" type="text" />
				<form:errors path="newsTitle" cssClass="red-text" />
			</div>

			<div class="form-group">
				<label for="newsText"><spring:message code="page.news.text" /></label>
				<form:textarea class="form-control" path="newsText" type="text" rows="15" />
				<form:errors path="newsText" cssClass="red-text" />
			</div>

			<button class="btn btn-primary" type="submit">
				<spring:message code="page.news.save" />
			</button>
			<a class="btn btn-primary" href="${pagesNews}"><spring:message code="page.news.back" /></a>
		</form:form>
	</sec:authorize>
</sec:authorize>
