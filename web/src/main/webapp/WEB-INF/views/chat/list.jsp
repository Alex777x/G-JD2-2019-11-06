<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="mytaglib" uri="my-custom-tags-uri"%>
<%@ taglib prefix="jspFragments" tagdir="/WEB-INF/tags"%>

<h4 class="header">Chat</h4>
<table class="bordered highlight">
	<tbody>
		<tr>
			<th><mytaglib:sort-link column="id" pageUrl="${pagesChat}">Id</mytaglib:sort-link></th>
			<th><mytaglib:sort-link column="game_id" pageUrl="${pagesChat}">Game</mytaglib:sort-link></th>
			<th><mytaglib:sort-link column="user_account_id"
					pageUrl="${pagesChat}">User Account</mytaglib:sort-link></th>
			<th><mytaglib:sort-link column="message" pageUrl="${pagesChat}">Message</mytaglib:sort-link></th>
			<th><mytaglib:sort-link column="created" pageUrl="${pagesChat}">Created</mytaglib:sort-link></th>
			<th><mytaglib:sort-link column="updated" pageUrl="${pagesChat}">Updated</mytaglib:sort-link></th>
			<th></th>
		</tr>
		<c:forEach var="chat" items="${gridItems}" varStatus="loopCounter">
			<tr>
				<td><c:out value="${chat.id}" /></td>
				<td><c:out value="${chat.game}" /></td>
				<td><c:out value="${chat.userAccount}" /></td>
				<td><c:out value="${chat.message}" /></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd"
						value="${chat.created}" /></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd"
						value="${chat.updated}" /></td>
				<td class="right"><a class="btn-floating"
					href="${pagesChat}/${chat.id}"><i class="material-icons">info</i></a>
					<a class="btn-floating" href="${pagesChat}/${chat.id}/edit"><i
						class="material-icons">edit</i></a> <a class="btn-floating red"
					href="${pagesChat}/${chat.id}/delete"><i class="material-icons">delete</i></a></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<a class="waves-effect waves-light btn right" href="${pagesChat}/add"><i
	class="material-icons">add</i></a>
<jspFragments:paging />