<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<h4 class="header">Cards In Game</h4>
<table class="bordered highlight">
	<tbody>
		<tr>
			<th>id</th>
			<th>card</th>
			<th>game</th>
			<th>player</th>
			<th>cardStatus</th>
			<th>created</th>
			<th>updated</th>
			<th></th>
		</tr>
		<c:forEach var="cardInGame" items="${gridItems}" varStatus="loopCounter">
			<tr>
				<td><c:out value="${cardInGame.id}" /></td>
				<td><c:out value="${cardInGame.card.id}" /></td>
				<td><c:out value="${cardInGame.game.id}" /></td>
				<td><c:out value="${cardInGame.player.id}" /></td>
				<td><c:out value="${cardInGame.cardStatus}" /></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd"
						value="${cardInGame.created}" /></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd"
						value="${cardInGame.updated}" /></td>
				<td class="right"><a class="btn-floating"
					href="${pagesCardInGame}/${cardInGame.id}"><i class="material-icons">info</i></a>
					<a class="btn-floating" href="${pagesCardInGame}/${cardInGame.id}/edit"><i
						class="material-icons">edit</i></a> <a class="btn-floating red"
					href="${pagesCardInGame}/${cardInGame.id}/delete"><i
						class="material-icons">delete</i></a></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<a class="waves-effect waves-light btn right" href="${pagesCardInGame}/add"><i
	class="material-icons">add</i></a>