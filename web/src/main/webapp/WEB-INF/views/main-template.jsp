<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" scope="request" />
<c:set var="pagesCard" value="${contextPath}/card" scope="request" />
<c:set var="pagesCardInGame" value="${contextPath}/cardInGame" scope="request" />
<c:set var="pagesChat" value="${contextPath}/chat" scope="request" />
<c:set var="pagesCountry" value="${contextPath}/country" scope="request" />
<c:set var="pagesGame" value="${contextPath}/game" scope="request" />
<c:set var="pagesPlayerAction" value="${contextPath}/playerAction" scope="request" />
<c:set var="pagesPlayer" value="${contextPath}/player" scope="request" />
<c:set var="pagesTiket" value="${contextPath}/tiket" scope="request" />
<c:set var="pagesTransaction" value="${contextPath}/transaction" scope="request" />
<c:set var="pagesUserAccount" value="${contextPath}/userAccount" scope="request" />
<c:set var="pagesLogin" value="${contextPath}/login" scope="request" />
<c:set var="pagesRegistration" value="${contextPath}/registration" scope="request" />
<c:set var="pagesNews" value="${contextPath}/news" scope="request" />
<c:set var="pagesTopPlayers" value="${contextPath}/topPlayers" scope="request" />
<c:set var="pagesHowToPlay" value="${contextPath}/howToPlay" scope="request" />
<c:set var="pagesSupport" value="${contextPath}/support" scope="request" />
<c:set var="pagesAdminPanel" value="${contextPath}/adminPanel" scope="request" />
<c:set var="pagesPersonalArea" value="${contextPath}/personalArea" scope="request" />
<c:set var="pagesInGame" value="${contextPath}/inGame" scope="request" />



<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><tiles:insertAttribute name="title" /></title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>



<link rel="stylesheet" href="${contextPath}/resources/css/custom.css">
<script src="${contextPath}/resources/js/init-menu.js"></script>
<script src="https://kit.fontawesome.com/b4ac90640c.js"></script>
</head>
<body>
	<tiles:insertAttribute name="header" />
	<main>
	<div class="container">
		<tiles:insertAttribute name="body" />
	</div>
	</main>
	<tiles:insertAttribute name="footer" />
</body>
</html>