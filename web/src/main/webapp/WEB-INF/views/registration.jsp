<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<h2 class="header">User registration</h2>

<div class="row justify-content-center">

	<form:form method="POST" action="${pagesRegistration}" modelAttribute="formRegistrationUserAccount">
		<form:input path="id" type="hidden" />
		<form:input path="foto" type="hidden" />
		<form:input path="userRole" type="hidden" />
		<form:input path="userStatus" type="hidden" />

		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="email">Email</label>
				<form:input path="email" type="email" class="form-control" placeholder="Email" />
				<form:errors path="email" cssClass="red-text" />
			</div>
			<div class="form-group col-md-6">
				<label for="password">Password</label>
				<form:input path="password" type="password" class="form-control" placeholder="Password" />
				<form:errors path="password" cssClass="red-text" />
			</div>
		</div>

		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="nickname">Nickname</label>
				<form:input path="nickname" type="text" class="form-control" placeholder="Nickname" />
				<form:errors path="nickname" cssClass="red-text" />
			</div>
			<div class="form-group col-md-6">
				<label for="country">Country</label>
				<form:select path="country" class="form-control">
					<form:options items="${countriesChoices}" />
				</form:select>
				<form:errors path="country" cssClass="red-text" />
			</div>
		</div>

		<button type="submit" class="btn btn-primary">Submit</button>
	</form:form>
</div>


<c:if test='${param["showAlerts"]}'>
	<!-- checks the URL parameter -->


	<script src="${contextPath}/resources/js/sample-alert-with-params.js"></script>
	<script>
		showMessage('${contextPath}'); // execute function defined somewhere above
	</script>

</c:if>