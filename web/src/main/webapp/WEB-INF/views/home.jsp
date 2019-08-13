<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="mytaglib" uri="my-custom-tags-uri"%>
<%@ taglib prefix="jspFragments" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>


<div class="container">
	<div class="row">

		<div class="col-sm">

			<table class="table table-striped table-sm table-dark">
				<thead>
					<tr>
						<th scope="col">Id</th>
						<th scope="col">Players in game</th>
						<th scope="col">Average Bank</th>
						<th scope="col">Created</th>
						<th scope="col">Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="game" items="${gridItems}" varStatus="loopCounter">
						<tr>
							<td><c:out value="${game.id}" /></td>
							<td><c:out value="${game.plaersCount}" /></td>
							<td><c:out value="${game.bank}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${game.created}" /></td>
							<td><a href="${contextPath}/inGame?id=${game.id}"><button type="button" class="btn btn-secondary btn-sm">In Game</button></a></td>
							<td></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<jspFragments:paging />

		</div>

		<div class="col-sm">


			<table class="table table-borderless table-sm table-dark">
				<thead>
					<tr>
						<th scope="col">NickName</th>
						<th scope="col">Message</th>
						<th scope="col">Time</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="chatInHome" items="${chatItems}" varStatus="loopCounter">
						<tr>
							<td><c:out value="${chatInHome.userAccountName}" /></td>
							<td><c:out value="${chatInHome.message}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${chatInHome.created}" /></td>
							<td></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

		</div>

	</div>
</div>


