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
		<img id="card1" class="card1" src="${contextPath}/resources/img/cards/shirt.png" />
	</div>
	<div>
		<img id="card2" class="card2" src="${contextPath}/resources/img/cards/shirt.png" />
	</div>
	<div>
		<img id="card3" class="card3" src="${contextPath}/resources/img/cards/shirt.png" />
	</div>
	<div>
		<img id="card4" class="card4" src="${contextPath}/resources/img/cards/shirt.png" />
	</div>
	<div>
		<img id="card5" class="card5" src="${contextPath}/resources/img/cards/shirt.png" />
	</div>
	<div>
		<i class="fas fa-piggy-bank"> 0.0</i>
	</div>

	<div class="shirt1">
		<img id="card1" src="${contextPath}/resources/img/cards/shirt.png" style="width: 45px;"/>
		<img id="card1" src="${contextPath}/resources/img/cards/shirt.png" style="width: 45px;"/>
	</div>
	<div>
		<img id="position1" onclick="f1(1)" class="img-thumbnail player1" src="${contextPath}/resources/img/sitTable.png" />
	</div>
	
	<div class="shirt2">
		<img id="card2" src="${contextPath}/resources/img/cards/shirt.png" style="width: 45px;"/>
		<img id="card2" src="${contextPath}/resources/img/cards/shirt.png" style="width: 45px;"/>
	</div>
	<div>
		<img id="position2" onclick="f1(2)" class="img-thumbnail player2" src="${contextPath}/resources/img/sitTable.png" />
	</div>
	
	<div class="shirt3" style="visibility: hidden;">
		<img id="card3" src="${contextPath}/resources/img/cards/shirt.png" style="width: 45px;"/>
		<img id="card3" src="${contextPath}/resources/img/cards/shirt.png" style="width: 45px;"/>
	</div>
	<div>
		<img id="position3" onclick="f1(3)" class="img-thumbnail player3" src="${contextPath}/resources/img/sitTable.png" />
	</div>
	
	<div class="shirt4">
		<img id="card4" src="${contextPath}/resources/img/cards/shirt.png" style="width: 45px;"/>
		<img id="card4" src="${contextPath}/resources/img/cards/shirt.png" style="width: 45px;"/>
	</div>
	<div>
		<img id="position4" onclick="f1(4)" class="img-thumbnail player4" src="${contextPath}/resources/img/sitTable.png" />
	</div>
	
	<div class="shirt5">
		<img id="card5" src="${contextPath}/resources/img/cards/shirt.png" style="width: 45px;"/>
		<img id="card5" src="${contextPath}/resources/img/cards/shirt.png" style="width: 45px;"/>
	</div>
	<div>
		<img id="position5" onclick="f1(5)" class="img-thumbnail player5" src="${contextPath}/resources/img/sitTable.png" />
	</div>
	
	<div class="shirt6" style="visibility: hidden;">
		<img id="card6" src="${contextPath}/resources/img/cards/shirt.png" style="width: 45px;"/>
		<img id="card6" src="${contextPath}/resources/img/cards/shirt.png" style="width: 45px;"/>
	</div>
	<div>
		<img id="position6" onclick="f1(6)" class="img-thumbnail player6" src="${contextPath}/resources/img/sitTable.png" />
	</div>
	
	<div class="shirt7">
		<img id="card7" src="${contextPath}/resources/img/cards/shirt.png" style="width: 45px;"/>
		<img id="card7" src="${contextPath}/resources/img/cards/shirt.png" style="width: 45px;"/>
	</div>
	<div>
		<img id="position7" onclick="f1(7)" class="img-thumbnail player7" src="${contextPath}/resources/img/sitTable.png" />
	</div>
	
	<div class="shirt8">
		<img id="card8" src="${contextPath}/resources/img/cards/shirt.png" style="width: 45px;"/>
		<img id="card8" src="${contextPath}/resources/img/cards/shirt.png" style="width: 45px;"/>
	</div>
	<div>
		<img id="position8" onclick="f1(8)" class="img-thumbnail player8" src="${contextPath}/resources/img/sitTable.png" />
	</div>
	
	<div class="shirt9">
		<img id="card9" src="${contextPath}/resources/img/cards/shirt.png" style="width: 45px;"/>
		<img id="card9" src="${contextPath}/resources/img/cards/shirt.png" style="width: 45px;"/>
	</div>
	<div>
		<img id="position9" onclick="f1(9)" class="img-thumbnail player9" src="${contextPath}/resources/img/sitTable.png" />
	</div>
	
	<div class="shirt10" style="visibility: hidden;">
		<img id="card10" src="${contextPath}/resources/img/cards/shirt.png" style="width: 45px;"/>
		<img id="card10" src="${contextPath}/resources/img/cards/shirt.png" style="width: 45px;"/>
	</div>
	<div>
		<img id="position10" onclick="f1(10)" class="img-thumbnail player10" src="${contextPath}/resources/img/sitTable.png" />
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
		<input type="number" class="form-control inputRaise" name="input_text1" id="input_text1" max="1000" value="0"
			onchange="rangeinput1.value = input_text1.value" style="margin-bottom: 5px; border-radius: 5px" /> <input type="range"
			oninput="input_text1.value = rangeinput1.value" class="form-control-range slider" type="range" min="0" max="1000" value="0"
			id="rangeinput1" step="1" onchange="input_text1.value = rangeinput1.value" />
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
<script>
	var fotoUrl = '${contextPath}/<sec:authentication property="foto" />';
	function f1(arg) {

		$.ajax({
			url : baseUrl + '/inGame/setposition?id=' + arg,
			type : 'post',
			success : function(result) {
				if (result == false) {
					toastr.success('Is this seat taken!');
				} else {
					toastr.success('Have a nice game!');
					//document.getElementById("position" + arg).src = fotoUrl;
					$("#position" + arg).attr("src", "fotoUrl");
				}

			}
		});

	}
</script>



