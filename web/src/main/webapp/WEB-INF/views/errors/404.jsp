<%@ page isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" scope="request" />

<link rel="stylesheet" href="${contextPath}/resources/css/error404.css">


<a href="${contextPath}/"> <svg height="0.8em" width="0.8em" viewBox="0 0 2 1" preserveAspectRatio="none">
  <polyline fill="none" stroke="#777777" stroke-width="0.1" points="0.9,0.1 0.1,0.5 0.9,0.9" />
</svg> Home
</a>
<div class="background-wrapper">
	<h1 id="visual">404</h1>
</div>
<p>The page you’re looking for does not exist.</p>
<script src="${contextPath}/resources/js/error404.js"></script>
