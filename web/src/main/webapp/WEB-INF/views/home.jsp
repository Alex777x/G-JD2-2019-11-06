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

			<table class="table table-striped table-sm table-dark">
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
			<jspFragments:paging />

		</div>

		<div class="col-sm">


			<table class="table table-borderless table-sm table-dark chat">
				<thead>
					<tr>
						<th scope="col">NickName</th>
						<th scope="col">Message</th>
						<th scope="col">Time</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="chatInHome" items="${chatItems}" varStatus="loopCounter">
						<tr>
							<td><c:out value="${chatInHome.userAccountName}" /></td>
							<td><c:out value="${chatInHome.message}" /></td>
							<td><fmt:formatDate pattern="hh:mm:ss" value="${chatInHome.created}" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<form:form method="POST" action="${contextPath}" modelAttribute="formChats">
				<form:input path="id" type="hidden" />

				<div class="form-group">
					<label for="message">Message</label>
					<form:input class="form-control input" path="message" type="text" />
					<form:errors path="message" cssClass="red-text" />
				</div>
					<button class="btn btn-primary chatBtn" type="button">Send</button>
			</form:form>

		</div>

	</div>
</div>

<script>
	const sendBtn = document.querySelector('.chatBtn');
	const chat = document.querySelector('.chat');
	const input = document.querySelector('.input');

	sendBtn.addEventListener('click', send);

	input.addEventListener('keyup', function() {
		if (event.keyCode === 13) {
			send();
		}
	})

	function send() {
		if (!input.value)
			return;
		let msg = document.createElement('div');
		msg.textContent = input.value;
		input.value = '';
		msg.classList.add('msg');
		chat.appendChild(msg);
		chat.scrollTop = chat.scrollHeight;
	}
</script>


