<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="mytaglib" uri="my-custom-tags-uri"%>
<%@ taglib prefix="jspFragments" tagdir="/WEB-INF/tags"%>

<h4 class="header">User Account</h4>
<table class="bordered highlight">
	<tbody>
		<tr>
			<th><mytaglib:sort-link column="id" pageUrl="${pagesUserAccount}">id</mytaglib:sort-link></th>
			<th><mytaglib:sort-link column="nickname" pageUrl="${pagesUserAccount}">Nickname</mytaglib:sort-link></th>
			<th><mytaglib:sort-link column="password" pageUrl="${pagesUserAccount}">Password</mytaglib:sort-link></th>
			<th><mytaglib:sort-link column="email" pageUrl="${pagesUserAccount}">Email</mytaglib:sort-link></th>
			<th><mytaglib:sort-link column="foto" pageUrl="${pagesUserAccount}">Foto</mytaglib:sort-link></th>
			<th><mytaglib:sort-link column="country_id" pageUrl="${pagesUserAccount}">Country</mytaglib:sort-link></th>
			<th><mytaglib:sort-link column="role_id" pageUrl="${pagesUserAccount}">Role</mytaglib:sort-link></th>
			<th><mytaglib:sort-link column="status_id" pageUrl="${pagesUserAccount}">Status</mytaglib:sort-link></th>
			<th><mytaglib:sort-link column="sum_games" pageUrl="${pagesUserAccount}">Sum games</mytaglib:sort-link></th>
			<th><mytaglib:sort-link column="won_games" pageUrl="${pagesUserAccount}">Won games</mytaglib:sort-link></th>
			<th><mytaglib:sort-link column="created" pageUrl="${pagesUserAccount}">Created</mytaglib:sort-link></th>
			<th><mytaglib:sort-link column="updated" pageUrl="${pagesUserAccount}">Updated</mytaglib:sort-link></th>
			<th></th>
		</tr>
		<c:forEach var="userAccount" items="${gridItems}" varStatus="loopCounter">
			<tr userAccountId="${userAccount.id}" class="clickable-row">
				<td><c:out value="${userAccount.id}" /></td>
				<td><c:out value="${userAccount.nickname}" /></td>
				<td><c:out value="${userAccount.password}" /></td>
				<td><c:out value="${userAccount.email}" /></td>
				<td><img src="${contextPath}/resources/img/foto.png" /></td>
				<td><c:out value="${userAccount.country}" /></td>
				<td><c:out value="${userAccount.userRole}" /></td>
				<td><c:out value="${userAccount.userStatus}" /></td>
				<td><c:out value="${userAccount.sumGames}" /></td>
				<td><c:out value="${userAccount.wonGames}" /></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${userAccount.created}" /></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${userAccount.updated}" /></td>
				<td class="right"><a class="btn-floating" href="${pagesUserAccount}/${userAccount.id}"><i class="material-icons">info</i></a> <a
					class="btn-floating" href="${pagesUserAccount}/${userAccount.id}/edit"><i class="material-icons">edit</i></a> <a
					class="btn-floating red" href="${pagesUserAccount}/${userAccount.id}/delete"><i class="material-icons">delete</i></a></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<a class="waves-effect waves-light btn right" href="${pagesUserAccount}/add"><i class="material-icons">add</i></a>
<c:out value="{4*5+12}" />
<jspFragments:paging />

<script>
	var baseUrl = '${pageContext.request.contextPath}';
	$("tr.clickable-row").each(
			function(index) {
				var selectedRow = this;
				$(selectedRow).click(
						function() {
							$(selectedRow).hide(2000);
							var userAccountId = $(selectedRow).attr(
									'userAccountId');
							$.get(baseUrl + '/userAccount/json?id='
									+ userAccountId, function(userAccountData) {
								M.toast({
									html : 'You removed:'
											+ JSON.stringify(userAccountData)
								}) // simple popup message using Materialize framework
							});

						});
			});
</script>