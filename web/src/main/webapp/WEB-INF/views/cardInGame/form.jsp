<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<h4 class="header">Edit Cards in Game</h4>

<div class="row">

	<form:form class="col s12" method="POST" action="${pagesCardInGame}"
		modelAttribute="formCardInGame">
		<form:input path="id" type="hidden" />
		
		<div class="row">
			<div class="input-field col s12">
				<form:select path="card" disabled="${readonly}">
					<form:options items="${cardsChoices}" />
				</form:select>
				<form:errors path="card" cssClass="red-text" />
				<label for="card">Card</label>
			</div>
		</div>
		<div class="row">
			<div class="input-field col s12">
				<form:select path="game" disabled="${readonly}">
					<form:options items="${gamesChoices}" />
				</form:select>
				<form:errors path="game" cssClass="red-text" />
				<label for="game">Game</label>
			</div>
		</div>
		<div class="row">
			<div class="input-field col s12">
				<form:select path="player" disabled="${readonly}">
					<form:options items="${playersChoices}" />
				</form:select>
				<form:errors path="player" cssClass="red-text" />
				<label for="player">Player</label>
			</div>
		</div>

		<div class="row">
			<div class="input-field col s12">
				<form:input path="cardStatus" type="text" disabled="${readonly}" />
				<form:errors path="cardStatus" cssClass="red-text" />
				<label for="cardStatus">Card Status</label>
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
					href="${pagesCardInGame}">Listƒ<i
					class="material-icons right"></i>
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