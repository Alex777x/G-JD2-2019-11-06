<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<h4 class="header">Chat</h4>
<table class="bordered highlight">
	<tbody>
		<tr>
			<th>id</th>
			<th>game</th>
			<th>userAccount</th>
			<th>message</th>
			<th>created</th>
			<th>updated</th>
			<th></th>
		</tr>
		<c:forEach var="chat" items="${gridItems}" varStatus="loopCounter">
			<tr>
				<td><c:out value="${chat.id}" /></td>
				<td><c:out value="${chat.game.id}" /></td>
				<td><c:out value="${chat.userAccount.id}" /></td>
				<td><c:out value="${chat.message}" /></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd"
						value="${chat.created}" /></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd"
						value="${chat.updated}" /></td>
				<td class="right"><a class="btn-floating"
					href="${pagesChat}/${chat.id}"><i class="material-icons">info</i></a>
					<a class="btn-floating" href="${pagesChat}/${chat.id}/edit"><i
						class="material-icons">edit</i></a> <a class="btn-floating red"
					href="${pagesChat}/${chat.id}/delete"><i
						class="material-icons">delete</i></a></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<a class="waves-effect waves-light btn right" href="${pagesChat}/add"><i
	class="material-icons">add</i></a>