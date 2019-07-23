<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<h4 class="header">Player Action</h4>
<table class="bordered highlight">
	<tbody>
		<tr>
			<th>id</th>
			<th>player</th>
			<th>bet</th>
			<th>call</th>
			<th>raise</th>
			<th>fold</th>
			<th>check</th>
			<th>allIn</th>
			<th>created</th>
			<th>updated</th>
			<th></th>
		</tr>
		<c:forEach var="playerAction" items="${gridItems}" varStatus="loopCounter">
			<tr>
				<td><c:out value="${playerAction.id}" /></td>
				<td><c:out value="${playerAction.player}" /></td>
				<td><c:out value="${playerAction.bet}" /></td>
				<td><c:out value="${playerAction.call}" /></td>
				<td><c:out value="${playerAction.raise}" /></td>
				<td><c:out value="${playerAction.fold}" /></td>
				<td><c:out value="${playerAction.check}" /></td>
				<td><c:out value="${playerAction.allIn}" /></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd"
						value="${playerAction.created}" /></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd"
						value="${playerAction.updated}" /></td>
				<td class="right"><a class="btn-floating"
					href="${pagesPlayerAction}/${playerAction.id}"><i class="material-icons">info</i></a>
					<a class="btn-floating" href="${pagesPlayerAction}/${playerAction.id}/edit"><i
						class="material-icons">edit</i></a> <a class="btn-floating red"
					href="${pagesPlayerAction}/${playerAction.id}/delete"><i
						class="material-icons">delete</i></a></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<a class="waves-effect waves-light btn right" href="${pagesPlayerAction}/add"><i
	class="material-icons">add</i></a>