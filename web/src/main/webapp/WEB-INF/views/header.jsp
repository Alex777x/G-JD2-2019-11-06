<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" scope="request" />
<header>
	<nav class="navheader">
		<a href="/poker" class="brand-logo"><img class="imglogo" src="${contextPath}/resources/img/logo.png" alt="" /></a> <a href="#"
			data-target="mobile-demo" class="sidenav-trigger"><i class="material-icons">menu</i></a>
		<div class="nav-wrapper container">
			<ul class="left hide-on-med-and-down">
				<li><a href="${contextPath}/">Home</a></li>
				<sec:authorize access="isAnonymous()">
					<li><a href="${contextPath}/login">Login</a></li>
					<li><a href="${contextPath}/registration">Registration</a></li>
					<li>Logged user: You are not logged in!</li>
				</sec:authorize>
				<sec:authorize access="!isAnonymous()">
					<li><a href="${pagesNews}">News</a></li>
					<li><a href="${pagesHowToPlay}">How to play</a></li>
					<li><a href="${pagesTopPlayers}">Top Players</a></li>
					<li><a href="${pagesPersonalArea}">Personal Area</a></li>
					<li><a href="${pagesSupport}">Support</a></li>
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<li><a href="${pagesAdminPanel}">Admin Panel</a></li>
					</sec:authorize>
					<sec:authorize access="!isAnonymous()">
						<li><a class="right" href="${contextPath}/execute_logout" title="logout">Logout</a></li>
					</sec:authorize>
				</sec:authorize>
			</ul>
			<div class="user-data">
				<ul class="left hide-on-med-and-down">
					<sec:authorize access="!isAnonymous()">
						<li><img src="<sec:authentication property="foto" />" /></li>
						<li class="id-data">Id: <sec:authentication property="id" /></li>
						<li class="name-data">Name: <sec:authentication property="principal" /></li>
						<li class="role-data">Role: <sec:authentication property="userRole" /></li>
					</sec:authorize>
				</ul>
			</div>
		</div>
	</nav>

	<ul class="sidenav" id="mobile-demo">
		<li><a href="${contextPath}/">Home</a></li>
		<sec:authorize access="isAnonymous()">
			<li><a href="${contextPath}/login">Login</a></li>
			<li><a href="${contextPath}/registration">Registration</a></li>
			<li>Logged user: You are not logged in!</li>
		</sec:authorize>
		<sec:authorize access="!isAnonymous()">
			<li><a href="${pagesNews}">News</a></li>
			<li><a href="${pagesHowToPlay}">How to play</a></li>
			<li><a href="${pagesTopPlayers}">Top Players</a></li>
			<li><a href="${pagesPersonalArea}">Personal Area</a></li>
			<li><a href="${pagesSupport}">Support</a></li>
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<li><a href="${pagesAdminPanel}">Admin Panel</a></li>
			</sec:authorize>
			<sec:authorize access="!isAnonymous()">
				<li><a class="right" href="${contextPath}/execute_logout" title="logout">Logout</a></li>
			</sec:authorize>
		</sec:authorize>
			<sec:authorize access="!isAnonymous()">
				<li><img src="<sec:authentication property="foto" />" /></li>
				<li class="id-data">Id: <sec:authentication property="id" /></li>
				<li class="name-data">Name: <sec:authentication property="principal" /></li>
				<li class="role-data">Role: <sec:authentication property="userRole" /></li>
			</sec:authorize>
		</ul>
</header>