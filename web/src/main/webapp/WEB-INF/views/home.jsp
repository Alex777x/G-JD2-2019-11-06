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

			<div class="overflow-auto gamesOver">
				<table class="table table-striped table-bordered table-sm table-dark listGames">
					<thead>
						<tr>
							<th scope="col">Id</th>
							<th scope="col">Players in game</th>
							<th scope="col">Current Bank</th>
							<th scope="col">Created</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="game" items="${gridItems}" varStatus="loopCounter">
							<tr>
								<td><c:out value="${game.id}" /></td>
								<td><c:out value="${game.plaersCount} /10" /></td>
								<td><c:out value="${game.bank} $" /></td>
								<td><fmt:formatDate pattern="dd-MMMM hh:mm:ss" value="${game.created}" /></td>
								<sec:authorize access="!isAnonymous()">
									<td><a href="${contextPath}/inGame?id=${game.id}"><button type="button" class="btn btn-secondary btn-sm">In Game</button></a></td>
								</sec:authorize>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<jspFragments:paging />

		</div>

		<div class="col-sm">

			<div class="overflow-auto chatOver">
				<table class="table table-striped table-sm">
					<thead>
						<tr>
							<th scope="col">NickName</th>
							<th scope="col">Message</th>
							<th scope="col">Time</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="chatInHome" items="${chatItems}" varStatus="loopCounter">
							<tr id="resultTr">
								<td><c:out value="${chatInHome.userAccountName}" /></td>
								<td><c:out value="${chatInHome.message}" /></td>
								<td><fmt:formatDate pattern="hh:mm:ss" value="${chatInHome.created}" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<form:form id="ajax_form" method="POST" action="${contextPath}" modelAttribute="formChats">
				<form:input path="id" type="hidden" />
				<div class="form-group">
					<label for="message">Message</label>
					<form:input id="message" class="form-control " path="message" type="text" />
					<form:errors path="message" cssClass="red-text" />
				</div>
				<button id="chatbtn" class="btn btn-primary" type="button">Send</button>

			</form:form>

		</div>

	</div>
</div>

<script>
	var baseUrl = '${pageContext.request.contextPath}';
	var $message = $("#message").serialize();
	var chatId = '${UserAccount.id}';
	var $resultTr = $("#message").serialize();
	$('#chatbtn').click(
			function() {
				$.ajax({
					url : baseUrl + '/json?id=' + chatId + '&message='
							+ $("#message").val(),
					type : 'post',
					success : function(result) {

						var $resultTr = $('#resultTr').append(
								$('<td>').text(result.userAccountName),
								$('<td>').text(result.message),
								$('<td>').text(result.created));
					}
				});
			});
</script>


