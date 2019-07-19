<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<h4 class="header">Edit tiket</h4>

<div class="row">

	<form:form class="col s12" method="POST" action="${pagesTiket}"
		modelAttribute="formTiket">
		<form:input path="id" type="hidden" />
		<form:input path="status" type="hidden" />

		<div class="row">
			<div class="input-field col s12">
				<form:select path="userAccount" disabled="${readonly}">
					<form:options items="${userAccountsChoices}" />
				</form:select>
				<form:errors path="userAccount" cssClass="red-text" />
				<label for="userAccount">User</label>
			</div>
		</div>

		<div class="row">
			<div class="input-field col s12">
				<form:input path="tiketTitle" type="text" disabled="${readonly}" />
				<form:errors path="tiketTitle" cssClass="red-text" />
				<label for="tiketTitle">Title</label>
			</div>
		</div>
		<div class="row">
			<div class="input-field col s12">
				<form:input path="tiketText" type="text" disabled="${readonly}" />
				<form:errors path="tiketText" cssClass="red-text" />
				<label for="tiketText">Text</label>
			</div>
		</div>
		<div class="row">
			<div class="col s6"></div>
			<div class="col s3">
				<c:if test="${!readonly}">
					<button class="btn waves-effect waves-light right" type="submit">сохранить</button>
				</c:if>
			</div>
			<div class="col s3">
				<a class="btn waves-effect waves-light right" href="${pagesTiket}">к списку<i class="material-icons right"></i>
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