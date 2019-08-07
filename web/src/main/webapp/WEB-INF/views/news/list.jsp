<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="mytaglib" uri="my-custom-tags-uri"%>
<%@ taglib prefix="jspFragments" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<sec:authorize access="hasRole('ROLE_ADMIN')">
	<button type="button" class="btn btn-light addnews">
		<a href="${pagesNews}/add"><i class="fas fa-plus"><spring:message code="page.news.addNews" /></i></a>
	</button>
</sec:authorize>

<c:forEach var="news" items="${gridItems}" varStatus="loopCounter">
	<div>

		<p class="font-weight-bold text-uppercase">
			<c:out value="${news.newsTitle}" />
		</p>

		<br>
		<p class="text-justify">
			<c:out value="${news.newsText}" />
		</p>
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<a href="${pagesNews}/${news.id}/edit"><i class="fas fa-edit"><spring:message code="page.news.edit" /></i></a>
			<a href="${pagesNews}/${news.id}/delete"><i class="fas fa-trash-alt"><spring:message code="page.news.delete" /></i></a>
		</sec:authorize>
	</div>
	<br>
	<hr>
</c:forEach>
<br>

<jspFragments:paging />