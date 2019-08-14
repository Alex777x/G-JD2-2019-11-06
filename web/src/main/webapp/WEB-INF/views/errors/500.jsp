<%@ page isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" scope="request" />

<link rel="stylesheet" href="${contextPath}/resources/css/error500.css">

<div class="titanic"></div>

<h1 data-txt="5⬡⬡" aria-label="Internal Server Error">5<span data-overlay="🤦‍♀️">⬡</span><span data-overlay="🤦‍♂️">⬡</span></h1>
<p>It's broken, but it's not your fault.</p>