<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="mytaglib" uri="my-custom-tags-uri"%>
<%@ taglib prefix="jspFragments" tagdir="/WEB-INF/tags"%>

<h4 class="header">Cards</h4>
<table class="bordered highlight">
	<tbody>
		<tr>
			<th><mytaglib:sort-link column="id" pageUrl="${pagesCard}">Id</mytaglib:sort-link></th>
			<th><mytaglib:sort-link column="suit" pageUrl="${pagesCard}">Suit</mytaglib:sort-link></th>
			<th><mytaglib:sort-link column="rank" pageUrl="${pagesCard}">Rank</mytaglib:sort-link></th>
			<th><mytaglib:sort-link column="filename" pageUrl="${pagesCard}">Filename</mytaglib:sort-link></th>
			<th><mytaglib:sort-link column="created" pageUrl="${pagesCard}">Created</mytaglib:sort-link></th>
			<th><mytaglib:sort-link column="updated" pageUrl="${pagesCard}">Updated</mytaglib:sort-link></th>
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
					href="${pagesCard}/${card.id}/delete"><i class="material-icons">delete</i></a></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<a class="waves-effect waves-light btn right" href="${pagesCard}/add"><i
	class="material-icons">add</i></a>
<jspFragments:paging />