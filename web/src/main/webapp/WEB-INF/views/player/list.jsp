<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<h4 class="header">CardsInGame</h4>
<table class="bordered highlight">
	<tbody>
		<tr>
			<th>id</th>
			<th>game</th>
			<th>userAccount</th>
			<th>position</th>
			<th>inGame</th>
			<th>state</th>
			<th>stack</th>
			<th>created</th>
			<th>updated</th>
			<th></th>
		</tr>
		<c:forEach var="player" items="${gridItems}" varStatus="loopCounter">
			<tr>
				<td><c:out value="${player.id}" /></td>
				<td><c:out value="${player.game.id}" /></td>
				<td><c:out value="${player.userAccount.id}" /></td>
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