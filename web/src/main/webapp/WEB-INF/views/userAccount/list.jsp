<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="mytaglib" uri="my-custom-tags-uri"%>
<%@ taglib prefix="jspFragments" tagdir="/WEB-INF/tags"%>

<h4 class="header">User Account</h4>
<table class="bordered highlight">
	<tbody>
		<tr>
			<th><mytaglib:sort-link column="id" pageUrl="${pagesUserAccont}">id</mytaglib:sort-link></th>
			<th><mytaglib:sort-link column="nickname" pageUrl="${pagesUserAccont}">Nickname</mytaglib:sort-link></th>
			<th><mytaglib:sort-link column="password" pageUrl="${pagesUserAccont}">Password</mytaglib:sort-link></th>
			<th><mytaglib:sort-link column="email" pageUrl="${pagesUserAccont}">Email</mytaglib:sort-link></th>
			<th><mytaglib:sort-link column="foto" pageUrl="${pagesUserAccont}">Foto</mytaglib:sort-link></th>
			<th><mytaglib:sort-link column="country_id" pageUrl="${pagesUserAccont}">Country</mytaglib:sort-link></th>
			<th><mytaglib:sort-link column="statistic_id" pageUrl="${pagesUserAccont}">Statistic</mytaglib:sort-link></th>
			<th><mytaglib:sort-link column="role_id" pageUrl="${pagesUserAccont}">User role</mytaglib:sort-link></th>
			<th><mytaglib:sort-link column="status_id" pageUrl="${pagesUserAccont}">User status</mytaglib:sort-link></th>
			<th><mytaglib:sort-link column="transaction_id" pageUrl="${pagesUserAccont}">Transaction</mytaglib:sort-link></th>
			<th><mytaglib:sort-link column="created" pageUrl="${pagesUserAccont}">Created</mytaglib:sort-link></th>
			<th><mytaglib:sort-link column="updated" pageUrl="${pagesUserAccont}">Updated</mytaglib:sort-link></th>
			<th></th>
		</tr>
		<c:forEach var="userAccount" items="${gridItems}" varStatus="loopCounter">
			<tr>
				<td><c:out value="${userAccount.id}" /></td>
				<td><c:out value="${userAccount.nickname}" /></td>
				<td><c:out value="${userAccount.password}" /></td>
				<td><c:out value="${userAccount.email}" /></td>
				<td><c:out value="${userAccount.foto}" /></td>
				<td><c:out value="${userAccount.country.id}" /></td>
				<td><c:out value="${userAccount.statistic.id}" /></td>
				<td><c:out value="${userAccount.userRole}" /></td>
				<td><c:out value="${userAccount.userStatus}" /></td>
				<td><c:out value="${userAccount.transaction.id}" /></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd"
						value="${userAccount.created}" /></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd"
						value="${userAccount.updated}" /></td>
				<td class="right"><a class="btn-floating"
					href="${pagesUserAccount}/${userAccount.id}"><i class="material-icons">info</i></a>
					<a class="btn-floating" href="${pagesUserAccount}/${userAccount.id}/edit"><i
						class="material-icons">edit</i></a> <a class="btn-floating red"
					href="${pagesUserAccount}/${userAccount.id}/delete"><i
						class="material-icons">delete</i></a></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<a class="waves-effect waves-light btn right" href="${pagesUserAccount}/add"><i
	class="material-icons">add</i></a>