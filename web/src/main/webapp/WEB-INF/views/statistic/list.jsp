<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<h4 class="header">CardsInGame</h4>
<table class="bordered highlight">
	<tbody>
		<tr>
			<th>id</th>
			<th>sumGames</th>
			<th>wonGames</th>
			<th></th>
		</tr>
		<c:forEach var="statistic" items="${gridItems}" varStatus="loopCounter">
			<tr>
				<td><c:out value="${statistic.id}" /></td>
				<td><c:out value="${statistic.sumGames}" /></td>
				<td><c:out value="${statistic.wonGames}" /></td>
				<td class="right"><a class="btn-floating"
					href="${pagesStatistic}/${statistic.id}"><i class="material-icons">info</i></a>
					<a class="btn-floating" href="${pagesStatistic}/${statistic.id}/edit"><i
						class="material-icons">edit</i></a> <a class="btn-floating red"
					href="${pagesStatistic}/${statistic.id}/delete"><i
						class="material-icons">delete</i></a></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<a class="waves-effect waves-light btn right" href="${pagesStatistic}/add"><i
	class="material-icons">add</i></a>