<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<h4 class="header">Tikets</h4>
<table class="bordered highlight">
	<tbody>
		<tr>
			<th>id</th>
			<th>userAccountId</th>
			<th>tiketTitle</th>
			<th>tiketText</th>
			<th>status</th>
			<th></th>
		</tr>
		<c:forEach var="tiket" items="${gridItems}" varStatus="loopCounter">
			<tr>
				<td><c:out value="${tiket.id}" /></td>
				<td><c:out value="${tiket.userAccountId.id}" /></td>
				<td><c:out value="${tiket.tiketTitle}" /></td>
				<td><c:out value="${tiket.tiketText}" /></td>
				<td><c:out value="${tiket.status}" /></td>
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