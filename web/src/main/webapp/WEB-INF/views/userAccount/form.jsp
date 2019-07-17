<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<h4 class="header">Edit User Account</h4>

<div class="row">

	<form:form class="col s12" method="POST" action="${pagesUserAccont}"
		modelAttribute="formUserAccount">
		<form:input path="id" type="hidden" />
		<form:input path="foto" type="hidden" />
		<form:input path="statistic" type="hidden" />
		<form:input path="userRole" type="hidden" />
		<form:input path="userStatus" type="hidden" />
		<form:input path="transaction" type="hidden" />

		<div class="row">
			<div class="input-field col s12">
				<form:input path="nickname" type="text" disabled="${readonly}" />
				<form:errors path="nickname" cssClass="red-text" />
				<label for="nickname">Nickname</label>
			</div>
		</div>
		<div class="row">
			<div class="input-field col s12">
				<form:input path="password" type="text" disabled="${readonly}" />
				<form:errors path="password" cssClass="red-text" />
				<label for="password">Password</label>
			</div>
		</div>
		<div class="row">
			<div class="input-field col s12">
				<form:input path="email" type="text" disabled="${readonly}" />
				<form:errors path="email" cssClass="red-text" />
				<label for="email">Email</label>
			</div>
		</div>
		<div class="row">
			<div class="input-field col s12">
				<form:select path="country" disabled="${readonly}">
					<form:options items="${countriesChoices}" />
				</form:select>
				<form:errors path="country" cssClass="red-text" />
				<label for="country">Country</label>
			</div>
		</div>
		<div class="row">
			<div class="input-field col s12">
				<form:select path="statistic" disabled="${readonly}">
					<form:options items="${statisticsChoices}" />
				</form:select>
				<form:errors path="statistic" cssClass="red-text" />
				<label for="statistic">Statistic</label>
			</div>
		</div>
		<div class="row">
			<div class="input-field col s12">
				<form:select path="transaction" disabled="${readonly}">
					<form:options items="${transactionsChoices}" />
				</form:select>
				<form:errors path="transaction" cssClass="red-text" />
				<label for="transaction">Transaction</label>
			</div>
		</div>
		<div class="row">
			<div class="col s6"></div>
			<div class="col s3">
				<c:if test="${!readonly}">
					<button class="btn waves-effect waves-light right" type="submit">Save</button>
				</c:if>
			</div>
			<div class="col s3">
				<a class="btn waves-effect waves-light right" href="${pagesUserAccont}">К списку<i class="material-icons right"></i>
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