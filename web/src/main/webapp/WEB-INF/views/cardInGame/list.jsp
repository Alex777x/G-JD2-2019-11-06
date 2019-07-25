<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="mytaglib" uri="my-custom-tags-uri"%>
<%@ taglib prefix="jspFragments" tagdir="/WEB-INF/tags"%>

<h4 class="header">Cards In Game</h4>
<table class="bordered highlight">
	<tbody>
		<tr>
			<th><mytaglib:sort-link column="id" pageUrl="${pagesCardInGame}">Id</mytaglib:sort-link></th>
			<th><mytaglib:sort-link column="card_id" pageUrl="${pagesCardInGame}">Card</mytaglib:sort-link></th>
			<th><mytaglib:sort-link column="game_id" pageUrl="${pagesCardInGame}">Game</mytaglib:sort-link></th>
			<th><mytaglib:sort-link column="player_id" pageUrl="${pagesCardInGame}">Player</mytaglib:sort-link></th>
			<th><mytaglib:sort-link column="card_state" pageUrl="${pagesCardInGame}">Card Status</mytaglib:sort-link></th>
			<th><mytaglib:sort-link column="created" pageUrl="${pagesCardInGame}">Created</mytaglib:sort-link></th>
			<th><mytaglib:sort-link column="updated" pageUrl="${pagesCardInGame}">Updated</mytaglib:sort-link></th>
			<th></th>
		</tr>
		<c:forEach var="cardInGame" items="${gridItems}"
			varStatus="loopCounter">
			<tr cardInGameId="${cardInGame.id}" class="clickable-row">
				<td><c:out value="${cardInGame.id}" /></td>
				<td><c:out value="${cardInGame.card}" /></td>
				<td><c:out value="${cardInGame.game}" /></td>
				<td><c:out value="${cardInGame.player}" /></td>
				<td><c:out value="${cardInGame.cardStatus}" /></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd"
						value="${cardInGame.created}" /></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd"
						value="${cardInGame.updated}" /></td>
				<td class="right"><a class="btn-floating"
					href="${pagesCardInGame}/${cardInGame.id}"><i
						class="material-icons">info</i></a> <a class="btn-floating"
					href="${pagesCardInGame}/${cardInGame.id}/edit"><i
						class="material-icons">edit</i></a> <a class="btn-floating red"
					href="${pagesCardInGame}/${cardInGame.id}/delete"><i
						class="material-icons">delete</i></a></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<a class="waves-effect waves-light btn right"
	href="${pagesCardInGame}/add"><i class="material-icons">add</i></a>
<jspFragments:paging />

<script>
	var baseUrl = '${pageContext.request.contextPath}';
	$("tr.clickable-row").each(function(index) {
		var selectedRow = this;
		$(selectedRow).click(function() {
			$(selectedRow).hide(2000);
			var cardInGameId = $(selectedRow).attr('cardInGameId');
			$.get(baseUrl + '/cardInGame/json?id=' + cardInGameId, function(cardInGameData) {
				M.toast({
					html : 'You removed:' + JSON.stringify(cardInGameData)
				}) // simple popup message using Materialize framework
			});

		});
	});
</script>