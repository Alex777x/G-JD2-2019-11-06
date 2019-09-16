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
			<p class="ptext"><spring:message code="page.home.listGame" /></p>
			<div class="overflow-auto gamesOver">
				<table class="table table-striped table-bordered table-sm table-dark listGames">
					<thead>
						<tr>
							<th scope="col">Id</th>
							<th scope="col"><spring:message code="page.home.playersGame" /></th>
							<th scope="col"><spring:message code="page.home.currentBank" /></th>
							<th scope="col"><spring:message code="page.home.created" /></th>
							<th scope="col"><spring:message code="page.home.action" /></th>
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
									<td><a href="${contextPath}/inGame?id=${game.id}"><button type="button" class="btn btn-secondary btn-sm"><spring:message code="page.home.inGame" /></button></a></td>
								</sec:authorize>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<br>
			<sec:authorize access="!isAnonymous()">
				<div>
					<button id="btnNewGame" type="button" class="btn btn-danger btn-lg"><spring:message code="page.home.newtable" /></button>
				</div>
			</sec:authorize>
			<br>
			<hr>
			<br>
			<jspFragments:paging />

		</div>

		<div class="col-sm">
			<p class="ptext"><spring:message code="page.home.chat" /></p>
			<div id="block" class="overflow-auto chatOver">
				<table class="table listChat">
					<thead>
						<tr>
							<th scope="col" width="150"><spring:message code="page.registration.nickname" /></th>
							<th scope="col"><spring:message code="page.home.message" /></th>
							<th scope="col"><spring:message code="page.home.time" /></th>
						</tr>
					</thead>
					<tbody id="resultTr">
						<c:forEach var="chatInHome" items="${chatItems}" varStatus="loopCounter">
							<tr>
								<td><c:out value="${chatInHome.userAccountName}" />:</td>
								<td><c:out value="${chatInHome.message}" /></td>
								<td><fmt:formatDate pattern="HH:mm:ss" value="${chatInHome.created}" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<sec:authorize access="!isAnonymous()">
				<form:form id="ajax_form" method="POST" action="${contextPath}" modelAttribute="formChats">
					<form:input path="id" type="hidden" />
					<div class="form-group">
						<label for="message" class="ptext"><spring:message code="page.home.message" /></label>
						<form:input id="message" class="form-control" path="message" type="text" />
						<form:errors path="message" cssClass="red-text" />
					</div>
					<button id="chatbtn" class="btn btn-primary" type="button"><spring:message code="page.home.send" /></button>

				</form:form>
			</sec:authorize>
			<div class="rollspades">
				<p class="proll"><spring:message code="page.home.roll" /></p>
				<sec:authorize access="!isAnonymous()">
					<button id="rollbtn" class="btn btn-warning btnroll" type="button">
						<spring:message code="page.home.spin" /><i class="fas fa-dice"></i>
					</button>
				</sec:authorize>
				<div id="odometer" class="odometer">123</div>
			</div>
		</div>

	</div>
</div>

<script>
	var baseUrl = '${pageContext.request.contextPath}';
	var $message = $("#message").serialize();
	var chatId = '${UserAccount.id}';
	var $resultTr = $("#message").serialize();
	var block = document.getElementById("block");
	block.scrollTop = block.scrollHeight;
	$('#chatbtn').click(
			function() {
				$.ajax({
					url : baseUrl + '/json?id=' + chatId + '&message='
							+ $("#message").val(),
					type : 'post',
					success : function(result) {

					}
				});
				document.getElementById("message").value = "";
				var block = document.getElementById("block");
				block.scrollTop = block.scrollHeight;
			});

	$('#rollbtn').click(function() {
		$('#odometer').innerHTML = Math.floor(Math.random() * 999);
		setTimeout(function() {
			odometer.innerHTML = Math.floor(Math.random() * 999);
		}, 1000);
	});
</script>
<script>
	var baseUrl = '${pageContext.request.contextPath}';
	$('#btnNewGame').click(function() {
		$.ajax({
			url : baseUrl + '/newGame',
			type : 'post',
			success : function(result) {
				toastr.success('Game successfully created!')
				window.location.href = baseUrl + '/inGame?id=' + result.id;
			}
		});
	});
</script>

<script>
	var baseUrl = '${pageContext.request.contextPath}';
	var latestId = '${newestMessage}';
	setInterval(function() {
 		$.get("${contextPath}/lastId", function(lastIdFromServer) {
 			if (latestId < lastIdFromServer) {

				success: 
					$.ajax({
					url : baseUrl + '/getfromserver?id=' + latestId,
					type : 'get',
					success : function(result) {
						result.forEach(function(row) {
							var $resultTr = $('#resultTr').append(
									$('<td>').text(row.userAccountName),
									$('<td>').text(row.message),
									$('<td>').text(
											new Date(row.created)
													.toLocaleTimeString()),
									$('<tr>'));
						});
					}
				});

				latestId = lastIdFromServer;
 			}
 		})
	}, 3 * 1000);
</script>
<script>
	setInterval(function() {
		$.get("${contextPath}/updateAllPlayers", function(lastIdFromServer) {

		})
	}, 3 * 1000);
</script>
<script>
	setInterval(function() {
		$.get("${contextPath}/updateAllGames", function(lastIdFromServer) {

		})
	}, 3 * 1000);
</script>

