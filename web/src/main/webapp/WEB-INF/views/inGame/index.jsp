<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="mytaglib" uri="my-custom-tags-uri"%>
<%@ taglib prefix="jspFragments" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<div class="container">
	<img src="${contextPath}/resources/img/fon-poker.png" alt="" class="rounded-pill tableIngame">
	<div>
		<img id="player1" class="img-thumbnail player1" src="${contextPath}/resources/img/sitTable.png" />
	</div>
	<div>
		<img id="player2" class="img-thumbnail player2" src="${contextPath}/resources/img/sitTable.png" />
	</div>
	<div>
		<img id="player3" class="img-thumbnail player3" src="${contextPath}/resources/img/sitTable.png" />
	</div>
	<div>
		<img id="player4" class="img-thumbnail player4" src="${contextPath}/resources/img/sitTable.png" />
	</div>
	<div>
		<img id="player5" class="img-thumbnail player5" src="${contextPath}/resources/img/sitTable.png" />
	</div>
	<div>
		<img id="player6" class="img-thumbnail player6" src="${contextPath}/resources/img/sitTable.png" />
	</div>
	<div>
		<img id="player7" class="img-thumbnail player7" src="${contextPath}/resources/img/sitTable.png" />
	</div>
	<div>
		<img id="player8" class="img-thumbnail player8" src="${contextPath}/resources/img/sitTable.png" />
	</div>
	<div>
		<img id="player9" class="img-thumbnail player9" src="${contextPath}/resources/img/sitTable.png" />
	</div>
	<div>
		<img id="player10" class="img-thumbnail player10" src="${contextPath}/resources/img/sitTable.png" />
	</div>
	<div>
		<button id="btnCheck" type="button" class="btn btn-success btn-lg btnCheck">CHECK</button>
	</div>
	<div>
		<button id="btnCall" type="button" class="btn btn-success btn-lg btnCall">CALL</button>
	</div>
	<div>
		<button id="btnRaise" type="button" class="btn btn-success btn-lg btnRaise">RAISE</button>
	</div>

	<div class="formForRaise input-group">
		<input id="inputRaise" type="number" class="form-control inputRaise" name="input_text1" id="input_text1" max="1000" value="0"
			onchange="rangeinput1.value = input_text1.value" style="margin-bottom: 5px; border-radius: 5px;" /> <input type="range"
			oninput="input_text1.value = rangeinput1.value" class="form-control-range slider" type="range" min="0" max="1000" value="0"
			id="rangeinput1" step="1" onchange="input_text1.value = rangeinput1.value">
	</div>
</div>

<script>
var baseUrl = '${pageContext.request.contextPath}';
var $curentTime = $.now();
	setInterval(function() {

		$.ajax({
			url : baseUrl + '/player/playerout',
			type : 'get',
			success : function(result) {

			}
		});
		
	}, 10 * 1000);
</script>



