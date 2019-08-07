<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" scope="request" />

<c:set var="currentLocale" value="${sessionScope['org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}" />

<!-- Navigation -->
<nav class="navbar sticky-top navbar-expand-lg navbar-dark bg-dark static-top">
	<div class="container">
		<a class="navbar-brand" href="${contextPath}/"> <img src="${contextPath}/resources/img/logo.png" alt="" width="100px">
		</a>

		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="btn-group">
			<button class="btn btn-secondary btn-sm dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				<spring:message code="page.home.language" />
			</button>
			<div class="dropdown-menu">
				<a class="dropdown-item" href="?lang=ru">Русский</a> <a class="dropdown-item" href="?lang=en">English</a>
			</div>
		</div>

		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a class="nav-link" href="${contextPath}/"><spring:message code="page.home.home" /></a></li>
				<sec:authorize access="isAnonymous()">
					<li class="nav-item"><a class="nav-link" href="${contextPath}/login"><spring:message code="page.home.login" /></a></li>
					<li class="nav-item"><a class="nav-link" href="${contextPath}/registration"><spring:message code="page.home.registration" /></a></li>
					<li class="nav-item"><a class="nav-link" href="#"><spring:message code="page.home.notLogged" /></a></li>
				</sec:authorize>

				<sec:authorize access="!isAnonymous()">
					<li class="nav-item"><a class="nav-link" href="${pagesNews}"><spring:message code="page.home.news" /></a></li>
					<li class="nav-item"><a class="nav-link" href="${pagesHowToPlay}"><spring:message code="page.home.howToPlay" /></a></li>
					<li class="nav-item"><a class="nav-link" href="${pagesTopPlayers}"><spring:message code="page.home.topPlayers" /></a></li>
					<li class="nav-item"><a class="nav-link" href="${pagesPersonalArea}"><spring:message code="page.home.personalArea" /></a></li>
					<li class="nav-item"><a class="nav-link" href="${pagesSupport}"><spring:message code="page.home.support" /></a></li>

					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<li class="nav-item"><a class="nav-link" href="${pagesAdminPanel}"><spring:message code="page.home.adminPanel" /></a></li>
					</sec:authorize>

					<sec:authorize access="!isAnonymous()">
						<li class="nav-item"><a class="nav-link"><img class="img-thumbnail" src="<sec:authentication property="foto" />" /></a></li>
						<ul class="nav flex-column">
							<li class="navbar-text"><spring:message code="page.home.name" /> <sec:authentication property="principal" /></li>
							<li class="navbar-text"><spring:message code="page.home.role" /> <sec:authentication property="userRole" /></li>
							<%-- 							<li class="navbar-text">Balance: <sec:authentication property="sum" /></li> --%>

							<li class="navbar-text"><a href="${contextPath}/execute_logout" title="logout"><spring:message code="page.home.logout" /> <i class="fas fa-sign-out-alt"></i></a></li>
						</ul>
					</sec:authorize>
				</sec:authorize>
			</ul>
		</div>
	</div>
</nav>