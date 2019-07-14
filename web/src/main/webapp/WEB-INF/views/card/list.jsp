<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<h4 class="header">Cards</h4>
<table class="bordered highlight">
	<tbody>
		<tr>
			<th>id</th>
			<th>suit</th>
			<th>rank</th>
			<th>filename</th>
			<th>created</th>
			<th>updated</th>
			<th></th>
		</tr>
		<c:forEach var="card" items="${gridItems}" varStatus="loopCounter">
			<tr>
				<td><c:out value="${card.id}" /></td>
				<td><c:out value="${card.suit}" /></td>
				<td><c:out value="${card.rank}" /></td>
				<td><c:out value="${card.filename}" /></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd"
						value="${card.created}" /></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd"
						value="${card.updated}" /></td>
				<td class="right"><a class="btn-floating"
					href="${pagesCard}/${card.id}"><i class="material-icons">info</i></a>
					<a class="btn-floating" href="${pagesCard}/${card.id}/edit"><i
						class="material-icons">edit</i></a> <a class="btn-floating red"
					href="${pagesCard}/${card.id}/delete"><i
						class="material-icons">delete</i></a></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<a class="waves-effect waves-light btn right" href="${pagesCard}/add"><i
	class="material-icons">add</i></a>