<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<h2>Login with Username and Password</h2>

<div class="row">
<div class="col-4"></div>
<form class="col-4 login-form" name='loginForm' action="<c:url value='login' />" method='POST'>
	<div class="form-group">
		<label for="username"><spring:message code="page.registration.nickname" /></label><input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"
			placeholder="Enter nickname" name='username' value=''>
	</div>
	<div class="form-group">
		<label for="password"><spring:message code="page.registration.password" /></label> <input type='password' name='password' class="form-control" id="exampleInputPassword1"
			placeholder="Password">
	</div>
	<c:if test="${not empty error}">
		<div class="form-group">
			<div class="col-6">
				<div class="error">${error}</div>
			</div>
		</div>
	</c:if>
	<c:if test="${not empty msg}">
		<div class="form-group">
			<div class="col-6">
				<div class="msg">${msg}</div>
			</div>
		</div>
	</c:if>
	<button type="submit" class="btn btn-primary"><spring:message code="page.registration.submit" /></button>
</form>
<div class="col-4"></div>
</div>