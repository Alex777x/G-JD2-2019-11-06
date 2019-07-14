<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<h4 class="header">CardsInGame</h4>
<table class="bordered highlight">
	<tbody>
		<tr>
			<th>id</th>
			<th>nickname</th>
			<th>password</th>
			<th>email</th>
			<th>foto</th>
			<th>country</th>
			<th>statistic</th>
			<th>userRole</th>
			<th>userStatus</th>
			<th>transaction</th>
			<th>created</th>
			<th>updated</th>
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