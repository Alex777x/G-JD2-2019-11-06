<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<h4 class="header">CardsInGame</h4>
<table class="bordered highlight">
	<tbody>
		<tr>
			<th>id</th>
			<th>state</th>
			<th>bank</th>
			<th>created</th>
			<th>updated</th>
			<th></th>
		</tr>
		<c:forEach var="game" items="${gridItems}" varStatus="loopCounter">
			<tr>
				<td><c:out value="${game.id}" /></td>
				<td><c:out value="${game.state}" /></td>
				<td><c:out value="${game.bank}" /></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd"
						value="${game.created}" /></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd"
						value="${game.updated}" /></td>
				<td class="right"><a class="btn-floating"
					href="${pagesGame}/${game.id}"><i class="material-icons">info</i></a>
					<a class="btn-floating" href="${pagesGame}/${game.id}/edit"><i
						class="material-icons">edit</i></a> <a class="btn-floating red"
					href="${pagesGame}/${game.id}/delete"><i
						class="material-icons">delete</i></a></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<a class="waves-effect waves-light btn right" href="${pagesGame}/add"><i
	class="material-icons">add</i></a>