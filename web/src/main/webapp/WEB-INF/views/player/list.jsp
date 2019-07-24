<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="mytaglib" uri="my-custom-tags-uri"%>
<%@ taglib prefix="jspFragments" tagdir="/WEB-INF/tags"%>

<h4 class="header">Player</h4>
<table class="bordered highlight">
	<tbody>
		<tr>
			<th><mytaglib:sort-link column="id" pageUrl="${pagesPlayer}">Id</mytaglib:sort-link></th>
			<th><mytaglib:sort-link column="game_id"
					pageUrl="${pagesPlayer}">Game</mytaglib:sort-link>game</th>
			<th><mytaglib:sort-link column="user_account_id"
					pageUrl="${pagesPlayer}">User Account</mytaglib:sort-link></th>
			<th><mytaglib:sort-link column="position_id"
					pageUrl="${pagesPlayer}">Position</mytaglib:sort-link></th>
			<th><mytaglib:sort-link column="in_game"
					pageUrl="${pagesPlayer}">in Game</mytaglib:sort-link></th>
			<th><mytaglib:sort-link column="state" pageUrl="${pagesPlayer}">state</mytaglib:sort-link></th>
			<th><mytaglib:sort-link column="stack" pageUrl="${pagesPlayer}">stack</mytaglib:sort-link></th>
			<th><mytaglib:sort-link column="created"
					pageUrl="${pagesPlayer}">created</mytaglib:sort-link></th>
			<th><mytaglib:sort-link column="updated"
					pageUrl="${pagesPlayer}">updated</mytaglib:sort-link></th>
			<th></th>
		</tr>
		<c:forEach var="player" items="${gridItems}" varStatus="loopCounter">
			<tr>
				<td><c:out value="${player.id}" /></td>
				<td><c:out value="${player.gameId}" /></td>
				<td><c:out value="${player.userAccountId}" /></td>
				<td><c:out value="${player.position}" /></td>
				<td><c:out value="${player.inGame}" /></td>
				<td><c:out value="${player.state}" /></td>
				<td><c:out value="${player.stack}" /></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd"
						value="${player.created}" /></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd"
						value="${player.updated}" /></td>
				<td class="right"><a class="btn-floating"
					href="${pagesPlayer}/${player.id}"><i class="material-icons">info</i></a>
					<a class="btn-floating" href="${pagesPlayer}/${player.id}/edit"><i
						class="material-icons">edit</i></a> <a class="btn-floating red"
					href="${pagesPlayer}/${player.id}/delete"><i
						class="material-icons">delete</i></a></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<a class="waves-effect waves-light btn right" href="${pagesPlayer}/add"><i
	class="material-icons">add</i></a>
<jspFragments:paging />