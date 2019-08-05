<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
	<c:when test="${currentPageGridState.totalCount>0}">
		<ul class="pagination">
			<c:choose>
				<c:when test="${currentPageGridState.firstPage}">
					<li class="page-item disabled"><a class="page-link"><i class="fas fa-arrow-left"></i></a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link"
						href="?page=${currentPageGridState.page-1}"><i class="fas fa-arrow-left"></i></a></li>
				</c:otherwise>
			</c:choose>
			<c:forEach begin="1" end="${currentPageGridState.pageCount}"
				varStatus="loop">
				<c:choose>
					<c:when test="${loop.index == currentPageGridState.page}">
						<li class="page-item active" aria-current="page"><a class="page-link">${loop.index} <span class="sr-only">(current)</span></a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item" aria-current="page"><a class="page-link" href="?page=${loop.index}">${loop.index}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:choose>
				<c:when test="${currentPageGridState.lastPage}">
					<li class="disabled"><a class="page-link"><i class="fas fa-arrow-right"></i></a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link"
						href="?page=${currentPageGridState.page+1}"><i class="fas fa-arrow-right"></i></a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</c:when>
</c:choose>