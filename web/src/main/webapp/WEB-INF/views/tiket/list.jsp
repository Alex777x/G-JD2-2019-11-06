<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="mytaglib" uri="my-custom-tags-uri"%>
<%@ taglib prefix="jspFragments" tagdir="/WEB-INF/tags"%>

<h4 class="header">Tikets</h4>
<table class="bordered highlight">
	<tbody>
		<tr>
			<th><mytaglib:sort-link column="id" pageUrl="${pagesTiket}">id</mytaglib:sort-link></th>
			<th><mytaglib:sort-link column="user_account_id"
					pageUrl="${pagesTiket}">User Account ID</mytaglib:sort-link></th>
			<th><mytaglib:sort-link column="tiket_title"
					pageUrl="${pagesTiket}">Tiket Title</mytaglib:sort-link></th>
			<th><mytaglib:sort-link column="tiket_text"
					pageUrl="${pagesTiket}">Tiket Text</mytaglib:sort-link></th>
			<th><mytaglib:sort-link column="status" pageUrl="${pagesTiket}">Status</mytaglib:sort-link></th>
			<th><mytaglib:sort-link column="created" pageUrl="${pagesTiket}">Created</mytaglib:sort-link></th>
			<th><mytaglib:sort-link column="updated" pageUrl="${pagesTiket}">Updated</mytaglib:sort-link></th>
			<th></th>
		</tr>
		<c:forEach var="tiket" items="${gridItems}" varStatus="loopCounter">
			<tr brandId="${tiket.id}" class="clickable-row">
				<td><c:out value="${tiket.id}" /></td>
				<td><c:out value="${tiket.userAccount}" /></td>
				<td><c:out value="${tiket.tiketTitle}" /></td>
				<td><c:out value="${tiket.tiketText}" /></td>
				<td><c:out value="${tiket.status}" /></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd"
						value="${tiket.created}" /></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd"
						value="${tiket.updated}" /></td>
				<td class="right"><a class="btn-floating"
					href="${pagesTiket}/${tiket.id}"><i class="material-icons">info</i></a>
					<a class="btn-floating" href="${pagesTiket}/${tiket.id}/edit"><i
						class="material-icons">edit</i></a> <a class="btn-floating red"
					href="${pagesTiket}/${tiket.id}/delete"><i
						class="material-icons">delete</i></a></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<a class="waves-effect waves-light btn right" href="${pagesTiket}/add"><i
	class="material-icons">add</i></a>
<jspFragments:paging />
