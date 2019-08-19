<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="mytaglib" uri="my-custom-tags-uri"%>
<%@ taglib prefix="jspFragments" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<div class="container">
	<div class="row">

		<div class="col-sm">
			<div class="personAreaSet">
				<img src="${contextPath}/resources/img/spades.png" alt="">
			</div>
			<div class="personalAreadata">
				<p>Никнейм:</p>
				<p>Дата регистрации:</p>
				<p>Игр сыграно:</p>
				<p>Игр выиграно:</p>
			</div>

			

		</div>


		<div class="col-sm personAreaSet">
			<p class="ptext">Change Name</p>
			<div class="form-group">
				<input class="form-control" type="text" placeholder="Set a new Nickname">
			</div>
			<button class="btn btn-primary" type="submit">Save</button>
			<br>
			<hr>
			<br>
			<p class="ptext">Change Foto</p>
			<div class="custom-file">
				<input type="file" class="custom-file-input" id="customFile"> <label class="custom-file-label" for="customFile">Choose
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
			<div class="form-group">
				<input class="form-control" type="text" placeholder="Enter amount">
			</div>
			<button class="btn btn-primary" type="submit">Add</button>
			<br>
			<hr>
			<br>
			<p class="ptext">If you want to delete your account, click the button below.</p>
			<button class="btn btn-danger" type="submit">Delete Account</button>
		</div>


	</div>
</div>


