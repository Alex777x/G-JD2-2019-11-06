<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="mytaglib" uri="my-custom-tags-uri"%>
<%@ taglib prefix="jspFragments" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>


<c:forEach var="news" items="${gridItems}" varStatus="loopCounter">
	<div>
		<h4>
			<c:out value="${news.newsTitle}" />
		</h4>
		<br>
		<c:out value="${news.newsText}" />
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<a class="btn-floating right" href="${pagesNews}/${news.id}/edit"><i class="material-icons">edit</i></a>
			<a class="btn-floating red right" href="${pagesNews}/${news.id}/delete"><i class="material-icons">delete</i></a>
		</sec:authorize>
	</div>
	<br>
	<hr>
</c:forEach>
<br>
<sec:authorize access="hasRole('ROLE_ADMIN')">
	<a class="waves-effect waves-light btn right" href="${pagesNews}/add"><i class="material-icons">add</i></a>
</sec:authorize>
<jspFragments:paging />