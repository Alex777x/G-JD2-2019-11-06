<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" scope="request" />

<!-- Navigation -->
<nav class="navbar sticky-top navbar-expand-lg navbar-dark bg-dark static-top">
	<div class="container">
		<a class="navbar-brand" href="${contextPath}/"> <img src="${contextPath}/resources/img/logo.png" alt="" width="100px">
		</a>

		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a class="nav-link" href="${contextPath}/">Home <span class="sr-only">(current)</span>
				</a></li>
				<sec:authorize access="isAnonymous()">
					<li class="nav-item"><a class="nav-link" href="${contextPath}/login">Login</a></li>
					<li class="nav-item"><a class="nav-link" href="${contextPath}/registration">Registration</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Logged user: You are not logged in!</a></li>
				</sec:authorize>

				<sec:authorize access="!isAnonymous()">
					<li class="nav-item"><a class="nav-link" href="${pagesNews}">News</a></li>
					<li class="nav-item"><a class="nav-link" href="${pagesHowToPlay}">How to play</a></li>
					<li class="nav-item"><a class="nav-link" href="${pagesTopPlayers}">Top Players</a></li>
					<li class="nav-item"><a class="nav-link" href="${pagesPersonalArea}">Personal Area</a></li>
					<li class="nav-item"><a class="nav-link" href="${pagesSupport}">Support</a></li>

					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<li class="nav-item"><a class="nav-link" href="${pagesAdminPanel}">Admin Panel</a></li>
					</sec:authorize>

					<sec:authorize access="!isAnonymous()">
						<li class="nav-item"><a class="nav-link"><img class="img-thumbnail" src="<sec:authentication property="foto" />" /></a></li>
						<ul class="nav flex-column">
							<li class="navbar-text">Name: <sec:authentication property="principal" /></li>
							<li class="navbar-text">Role: <sec:authentication property="userRole" /></li>
<%-- 							<li class="navbar-text">Balance: <sec:authentication property="sum" /></li> --%>

							<li class="navbar-text"><a href="${contextPath}/execute_logout" title="logout">Logout <i class="fas fa-sign-out-alt"></i></a></li>
						</ul>
					</sec:authorize>
				</sec:authorize>
			</ul>
		</div>
	</div>
</nav>