<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<h4 style="color: white;" class="header">Edit User Account</h4>

<div class="row" style="color: white;">

	<form:form class="col s12" method="POST" action="${pagesUserAccount}"
		modelAttribute="formUserAccount">
		<form:input path="id" type="hidden" />
		<form:input path="foto" type="hidden" />

		<div class="row">
			<div class="input-field col s12">
				<form:input path="nickname" type="text" />
				<form:errors path="nickname" cssClass="red-text" />
				<label for="nickname">Nickname</label>
			</div>
		</div>
		<div class="row">
			<div class="input-field col s12">
				<form:input path="password" type="text" />
				<form:errors path="password" cssClass="red-text" />
				<label for="password">Password</label>
			</div>
		</div>
		<div class="row">
			<div class="input-field col s12">
				<form:input path="email" type="text" />
				<form:errors path="email" cssClass="red-text" />
				<label for="email">Email</label>
			</div>
		</div>
		<div class="row">
			<div class="input-field col s12">
				<form:select path="country">
					<form:options items="${countriesChoices}" />
				</form:select>
				<form:errors path="country" cssClass="red-text" />
				<label for="country">Country</label>
			</div>
		</div>
		<div class="row">
			<div class="input-field col s12">
				<form:input path="userRole" type="text" />
				<form:errors path="userRole" cssClass="red-text" />
				<label for="userRole">Role</label>
			</div>
		</div>
		<div class="row">
			<div class="input-field col s12">
				<form:input path="userStatus" type="text" />
				<form:errors path="userStatus" cssClass="red-text" />
				<label for="userStatus">Status</label>
			</div>
		</div>
		<div class="row">
			<div class="input-field col s12">
				<form:input path="sumGames" type="text"/>
				<form:errors path="sumGames" cssClass="red-text" />
				<label for="sumGames">Sum games</label>
			</div>
		</div>
		<div class="row">
			<div class="input-field col s12">
				<form:input path="wonGames" type="text" />
				<form:errors path="wonGames" cssClass="red-text" />
				<label for="wonGames">Won games</label>
			</div>
		</div>

		<div class="row">
			<div class="col s6"></div>
			<div class="col s3">
				<c:if test="${!readonly}">
					<button class="btn btn-success" type="submit"><spring:message code="page.news.save" /></button>
				</c:if>
			</div>
			<div class="col s3">
				<a class="btn btn-success"
					href="${pagesUserAccount}"><spring:message code="page.news.back" />
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