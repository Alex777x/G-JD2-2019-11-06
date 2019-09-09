<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" scope="request" />
<footer class="page-footer">
	<div class="container">
		<div class="row">
			<div class="col l6 s12">
			</div>
			<div class="col l4 offset-l2 s12">
				<h5 class="white-text">Links</h5>
				<ul>
					<li><a target="_blank" class="grey-text text-lighten-3" href="${contextPath}/img/dbmodel.png">DB Model</a></li>
				</ul>
			</div>
		</div>
	</div>
</footer>