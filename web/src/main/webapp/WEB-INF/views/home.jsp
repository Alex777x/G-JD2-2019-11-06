<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="mytaglib" uri="my-custom-tags-uri"%>
<%@ taglib prefix="jspFragments" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- <div> -->
<%-- 	<form method="POST" enctype="multipart/form-data" action="${contextPath}/file"> --%>
<!-- 		<table> -->
<!-- 			<tr> -->
<!-- 				<td>File to upload:</td> -->
<!-- 				<td><input type="file" name="file" /></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td></td> -->
<!-- 				<td><input type="submit" value="Upload" /></td> -->
<!-- 			</tr> -->
<!-- 		</table> -->
<!-- 	</form> -->

<%-- 	<img alt="no image" src="${contextPath}/file/image" /> --%>
<!-- </div> -->

<div class="container gameTable">
	<div class="row">

		<div class="col-sm">

			<table class="table table-striped table-sm table-dark">
				<thead>
					<tr>
						<th scope="col">Id</th>
						<th scope="col">Players in game</th>
						<th scope="col">Average Bank</th>
						<th scope="col">Created</th>
						<th scope="col"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="game" items="${gridItems}" varStatus="loopCounter">
						<tr>
							<td><c:out value="${game.id}" /></td>
							<td><c:out value="${game.id}" /></td>
							<td><c:out value="${game.bank}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${game.created}" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<jspFragments:paging />

		</div>

		<div class="col-sm"></div>

	</div>
</div>


