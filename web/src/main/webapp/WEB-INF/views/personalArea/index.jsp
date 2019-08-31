<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="mytaglib" uri="my-custom-tags-uri"%>
<%@ taglib prefix="jspFragments" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<div class="container">
	<div class="row">

		<div class="col-sm">
			<div class="personAreaSet">
				<img src="${contextPath}/resources/img/spades.png" alt="">
			</div>
			<div class="personalAreadata">
				<p>Никнейм: ${userAccount.nickname}</p>
				<p>
					Дата регистрации:
					<fmt:formatDate pattern="dd-MMMM" value="${userAccount.created}" />
				</p>
				<p>Игр сыграно: ${userAccount.sumGames}</p>
				<p>Игр выиграно: ${userAccount.wonGames}</p>
			</div>

			<div class="dopInfo">
				<p>If you find a mistake or have</p>
				<p>questions about the site,</p>
				<p>please write a ticket to us.</p>
			</div>

		</div>


		<div class="col-sm personAreaSet">
			<p class="ptext">Change Name</p>
			<div class="form-group">
				<input id="newNickName" class="form-control" type="text"
					placeholder="Set a new Nickname">
			</div>
			<button id="setNickName" class="btn btn-primary" type="submit">Save</button>
			<br>
			<hr>
			<br>
			<p class="ptext">Change Foto</p>
			<div class="custom-file">
				<input type="file" class="custom-file-input" id="customFile">
				<label class="custom-file-label" for="customFile">Choose
					foto</label>
			</div>
			<div>
				<br>
			</div>
			<button class="btn btn-primary" type="submit">Change</button>
			<br>
			<hr>
			<br>
			<p class="ptext">Add Money</p>
			<form action="${pagesPersonalArea}/upload" method="post" enctype="multipart/form-data">
				<input id="newBalance" class="form-control" type="text"
					placeholder="Enter amount">
				<button id="addBalance" class="btn btn-primary" type="submit">Add</button>
			</form>
			<br>
			<hr>
			<br>
			<p class="ptext">If you want to delete your account, click the
				button below.</p>
			<button class="btn btn-danger" type="submit">Delete Account</button>
		</div>


	</div>
</div>

<script>
	var baseUrl = '${pageContext.request.contextPath}';
	var $message = $("#newNickName").serialize();
	var userId = $
	{
		userAccount.id
	};
	$('#setNickName').click(
			function() {
				$.ajax({
					url : baseUrl + '/personalArea/updateNickname?id=' + userId
							+ '&message=' + $("#newNickName").val(),
					type : 'post',
					success : function(result) {
						toastr.success('Nickname successfully updated!')
					}
				});
			});
</script>

<script>
	var baseUrl = '${pageContext.request.contextPath}';
	var $addBalance = $("#addBalance").serialize();
	var userId = $
	{
		userAccount.id
	};
	$('#addBalance').click(
			function() {
				$.ajax({
					url : baseUrl + '/personalArea/updateBalance?summ='
							+ $("#newBalance").val(),
					type : 'post',
					success : function(result) {
						toastr.success('Balance successfully updated!')
					}
				});
			});
</script>


