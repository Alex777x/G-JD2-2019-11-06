<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<h4 class="header">Edit Player</h4>

<div class="row">

	<form:form class="col s12" method="POST" action="${pagesPlayer}"
		modelAttribute="formPlayer">
		<form:input path="id" type="hidden" />

		<div class="row">
			<div class="input-field col s12">
				<form:select path="gameId" disabled="${readonly}">
					<form:options items="${gamesChoices}" />
				</form:select>
				<form:errors path="gameId" cssClass="red-text" />
				<label for="gameId">Game</label>
			</div>
		</div>

		<div class="row">
			<div class="input-field col s12">
				<form:select path="userAccountId" disabled="${readonly}">
					<form:options items="${userAccountsChoices}" />
				</form:select>
				<form:errors path="userAccountId" cssClass="red-text" />
				<label for="userAccountId">User Account</label>
			</div>
		</div>

		<div class="row">
			<div class="input-field col s12">
				<form:input path="position" type="text" disabled="${readonly}" />
				<form:errors path="position" cssClass="red-text" />
				<label for="position">Position</label>
			</div>
		</div>
		<div class="row">
			<div class="input-field col s12">
				<form:input path="inGame" type="text" disabled="${readonly}" />
				<form:errors path="inGame" cssClass="red-text" />
				<label for="inGame">In Game</label>
			</div>
		</div>
		<div class="row">
			<div class="input-field col s12">
				<form:input path="state" type="text" disabled="${readonly}" />
				<form:errors path="state" cssClass="red-text" />
				<label for="state">State</label>
			</div>
		</div>
		<div class="row">
			<div class="input-field col s12">
				<form:input path="stack" type="text" disabled="${readonly}" />
				<form:errors path="stack" cssClass="red-text" />
				<label for="stack">Stack</label>
			</div>
		</div>

		<div class="row">
			<div class="col s6"></div>
			<div class="col s3">
				<c:if test="${!readonly}">
					<button class="btn waves-effect waves-light right" type="submit">Save</button>
				</c:if>
			</div>
			<div class="col s3">
				<a class="btn waves-effect waves-light right"
					href="${pagesPlayer}">List<i class="material-icons right"></i>
				</a>
			</div>
		</div>
	</form:form>
</div>


<c:if test='${param["showAlerts"]}'>
	<!-- checks the URL parameter -->


	<script src="${contextPath}/resources/js/sample-alert-with-params.js"></script>
	<script>
		showMessage('${contextPath}'); // execute function defined somewhere above
	</script>

</c:if>