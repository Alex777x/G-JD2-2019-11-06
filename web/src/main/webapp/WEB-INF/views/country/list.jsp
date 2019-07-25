<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="mytaglib" uri="my-custom-tags-uri"%>
<%@ taglib prefix="jspFragments" tagdir="/WEB-INF/tags"%>

<h4 class="header">Country</h4>
<table class="bordered highlight">
	<tbody>
		<tr>
			<th><mytaglib:sort-link column="id" pageUrl="${pagesCountry}">Id</mytaglib:sort-link></th>
			<th><mytaglib:sort-link column="country" pageUrl="${pagesCountry}">Country</mytaglib:sort-link></th>
			<th></th>
		</tr>
		<c:forEach var="country" items="${gridItems}" varStatus="loopCounter">
			<tr countryId="${country.id}" class="clickable-row">
				<td><c:out value="${country.id}" /></td>
				<td><c:out value="${country.country}" /></td>
				<td class="right"><a class="btn-floating"
					href="${pagesCountry}/${country.id}"><i class="material-icons">info</i></a>
					<a class="btn-floating" href="${pagesCountry}/${country.id}/edit"><i
						class="material-icons">edit</i></a> <a class="btn-floating red"
					href="${pagesCountry}/${country.id}/delete"><i
						class="material-icons">delete</i></a></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<a class="waves-effect waves-light btn right" href="${pagesCountry}/add"><i
	class="material-icons">add</i></a>
<jspFragments:paging />

<script>
	var baseUrl = '${pageContext.request.contextPath}';
	$("tr.clickable-row").each(function(index) {
		var selectedRow = this;
		$(selectedRow).click(function() {
			$(selectedRow).hide(2000);
			var countryId = $(selectedRow).attr('countryId');
			$.get(baseUrl + '/country/json?id=' + countryId, function(countryData) {
				M.toast({
					html : 'You removed:' + JSON.stringify(countryData)
				}) // simple popup message using Materialize framework
			});

		});
	});
</script>