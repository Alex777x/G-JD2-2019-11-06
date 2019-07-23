<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"
	scope="request" />
<header>
	<nav class="navheader">
		<a href="/poker" class="brand-logo"><img class="imglogo" src="${contextPath}/resources/img/logo.png" alt="" /></a> <a href="#"
			data-target="mobile-demo" class="sidenav-trigger"><i
			class="material-icons">menu</i></a>
		<div class="nav-wrapper container">
			<ul class="left hide-on-med-and-down">
				<li><a href="${contextPath}/">Home</a></li>
				<li><a href="${pagesCard}">Card</a></li>
				<li><a href="${pagesCardInGame}">Card In Game</a></li>
				<li><a href="${pagesChat}">Chat</a></li>
				<li><a href="${pagesCountry}">Country</a></li>
				<li><a href="${pagesGame}">Game</a></li>
				<li><a href="${pagesPlayerAction}">Player Action</a></li>
				<li><a href="${pagesPlayer}">Player</a></li>
				<li><a href="${pagesTiket}">Tiket</a></li>
				<li><a href="${pagesTransaction}">Transaction</a></li>
				<li><a href="${pagesUserAccount}">UserAccount</a></li>
			</ul>
		</div>
	</nav>

	<ul class="sidenav" id="mobile-demo">
		<li><a href="${contextPath}/">Home</a></li>
		<li><a href="${pagesCard}">Card</a></li>
		<li><a href="${pagesCardInGame}">Card In Game</a></li>
		<li><a href="${pagesChat}">Chat</a></li>
		<li><a href="${pagesCountry}">Country</a></li>
		<li><a href="${pagesGame}">Game</a></li>
		<li><a href="${pagesPlayerAction}">Player Action</a></li>
		<li><a href="${pagesPlayer}">Player</a></li>
		<li><a href="${pagesTiket}">Tiket</a></li>
		<li><a href="${pagesTransaction}">Transaction</a></li>
		<li><a href="${pagesUserAccount}">UserAccount</a></li>
	</ul>

</header>