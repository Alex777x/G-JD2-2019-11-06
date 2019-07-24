<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<h4 class="header">Edit Player Action</h4>

<div class="row">

	<form:form class="col s12" method="POST" action="${pagesPlayerAction}"
		modelAttribute="formPlayerAction">
		<form:input path="id" type="hidden" />

		<div class="row">
			<div class="input-field col s12">
				<form:select path="player" disabled="${readonly}">
					<form:options items="${playersChoices}" />
				</form:select>
				<form:errors path="player" cssClass="red-text" />
				<label for="player">Player Id</label>
			</div>
		</div>

		<div class="row">
			<div class="input-field col s12">
				<form:input path="bet" type="text" disabled="${readonly}" />
				<form:errors path="bet" cssClass="red-text" />
				<label for="bet">Bet</label>
			</div>
		</div>
		<div class="row">
			<div class="input-field col s12">
				<form:input path="call" type="text" disabled="${readonly}" />
				<form:errors path="call" cssClass="red-text" />
				<label for="call">Call</label>
			</div>
		</div>
		<div class="row">
			<div class="input-field col s12">
				<form:input path="raise" type="text" disabled="${readonly}" />
				<form:errors path="raise" cssClass="red-text" />
				<label for="raise">Raise</label>
			</div>
		</div>
		<div class="row">
			<div class="input-field col s12">
				<form:input path="fold" type="text" disabled="${readonly}" />
				<form:errors path="fold" cssClass="red-text" />
				<label for="fold">Fold</label>
			</div>
		</div>
		<div class="row">
			<div class="input-field col s12">
				<form:input path="check" type="text" disabled="${readonly}" />
				<form:errors path="check" cssClass="red-text" />
				<label for="check">Check</label>
			</div>
		</div>
		<div class="row">
			<div class="input-field col s12">
				<form:input path="allIn" type="text" disabled="${readonly}" />
				<form:errors path="allIn" cssClass="red-text" />
				<label for="allIn">AllIn</label>
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
					href="${pagesPlayerAction}">List<i class="material-icons right"></i>
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