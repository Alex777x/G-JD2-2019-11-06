<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="mytaglib" uri="my-custom-tags-uri"%>
<%@ taglib prefix="jspFragments" tagdir="/WEB-INF/tags"%>

<h4 class="header">Transaction</h4>
<table class="bordered highlight">
	<tbody>
		<tr>
			<th><mytaglib:sort-link column="id"
					pageUrl="${pagesTransaction}">id</mytaglib:sort-link></th>
			<th><mytaglib:sort-link column="user_account_id"
					pageUrl="${pagesTransaction}">user account</mytaglib:sort-link></th>
			<th><mytaglib:sort-link column="amount"
					pageUrl="${pagesTransaction}">amount</mytaglib:sort-link></th>
			<th><mytaglib:sort-link column="comment"
					pageUrl="${pagesTransaction}">comment</mytaglib:sort-link></th>
			<th><mytaglib:sort-link column="created"
					pageUrl="${pagesTransaction}">created</mytaglib:sort-link></th>
			<th><mytaglib:sort-link column="updated"
					pageUrl="${pagesTransaction}">updated</mytaglib:sort-link></th>
			<th></th>
		</tr>
		<c:forEach var="transaction" items="${gridItems}"
			varStatus="loopCounter">
			<tr transactionId="${transaction.id}" class="clickable-row">
				<td><c:out value="${transaction.id}" /></td>
				<td><c:out value="${transaction.userAccountId}" /></td>
				<td><c:out value="${transaction.amount}" /></td>
				<td><c:out value="${transaction.comment}" /></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd"
						value="${transaction.created}" /></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd"
						value="${transaction.updated}" /></td>
				<td class="right"><a class="btn-floating"
					href="${pagesTransaction}/${transaction.id}"><i
						class="material-icons">info</i></a> <a class="btn-floating"
					href="${pagesTransaction}/${transaction.id}/edit"><i
						class="material-icons">edit</i></a> <a class="btn-floating red"
					href="${pagesTransaction}/${transaction.id}/delete"><i
						class="material-icons">delete</i></a></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<a class="waves-effect waves-light btn right"
	href="${pagesTransaction}/add"><i class="material-icons">add</i></a>
<jspFragments:paging />

<script>
	var baseUrl = '${pageContext.request.contextPath}';
	$("tr.clickable-row").each(
			function(index) {
				var selectedRow = this;
				$(selectedRow).click(
						function() {
							$(selectedRow).hide(2000);
							var transactionId = $(selectedRow).attr(
									'transactionId');
							$.get(baseUrl + '/transaction/json?id='
									+ transactionId, function(transactionData) {
								M.toast({
									html : 'You removed:'
											+ JSON.stringify(transactionData)
								}) // simple popup message using Materialize framework
							});

						});
			});
</script>