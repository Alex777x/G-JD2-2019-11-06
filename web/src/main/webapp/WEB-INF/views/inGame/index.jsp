<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="mytaglib" uri="my-custom-tags-uri"%>
<%@ taglib prefix="jspFragments" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<div class="container">
	<img src="${contextPath}/resources/img/fon-poker.png" alt="" class="rounded-pill tableIngame">

	<div id="tableCard1" style="display: none;">
		<img id="card1" class="card1" src="${contextPath}/resources/img/cards/shirt.png" />
	</div>
	<div id="tableCard2" style="display: none;">
		<img id="card2" class="card2" src="${contextPath}/resources/img/cards/shirt.png" />
	</div>
	<div id="tableCard3" style="display: none;">
		<img id="card3" class="card3" src="${contextPath}/resources/img/cards/shirt.png" />
	</div>
	<div id="tableCard4" style="display: none;">
		<img id="card4" class="card4" src="${contextPath}/resources/img/cards/shirt.png" />
	</div>
	<div id="tableCard5" style="display: none;">
		<img id="card5" class="card5" src="${contextPath}/resources/img/cards/shirt.png" />
	</div>
	<div>
		<i id="bank" class="fas fa-piggy-bank"></i>
	</div>

	<div id="shirt1" class="shirt1" style="display: none;">
		<img id="playerCard1" src="${contextPath}/resources/img/cards/shirt.png" style="width: 50px;" /> <img id="playerCard11"
			src="${contextPath}/resources/img/cards/shirt.png" style="width: 50px;" />
	</div>
	<div id="playerData1" style="display: none;">
		<p id="player1Nick" style="position: absolute; color: yellow; left: 416px; top: 627px;"></p>
		<p id="player1Balance" style="position: absolute; color: yellow; left: 416px; top: 721px;"></p>
	</div>
	<div>
		<img id="position1" onclick="f1(1)" class="img-thumbnail player1" src="${contextPath}/resources/img/sitTable.png" />
	</div>
	<div id="bet1" class="bet1" style="display: none;">
		<i id="bets1" class="fas fa-dollar-sign" style="color: gold; position: absolute; left: 419px; top: 605px;"></i>
	</div>

	<div id="shirt2" class="shirt2" style="display: none;">
		<img id="playerCard2" src="${contextPath}/resources/img/cards/shirt.png" style="width: 50px;" /> <img id="playerCard22"
			src="${contextPath}/resources/img/cards/shirt.png" style="width: 50px;" />
	</div>
	<div id="playerData2" style="display: none;">
		<p id="player2Nick" style="position: absolute; color: yellow; left: 218px; top: 577px;"></p>
		<p id="player2Balance" style="position: absolute; color: yellow; left: 217px; top: 671px;"></p>
	</div>
	<div>
		<img id="position2" onclick="f1(2)" class="img-thumbnail player2" src="${contextPath}/resources/img/sitTable.png" />
	</div>
	<div id="bet2" class="bet2" style="display: none;">
		<i id="bets2" class="fas fa-dollar-sign" style="color: gold; position: absolute; left: 220px; top: 560px;"></i>
	</div>

	<div id="shirt3" class="shirt3" style="display: none;">
		<img id="playerCard3" src="${contextPath}/resources/img/cards/shirt.png" style="width: 50px;" /> <img id="playerCard33"
			src="${contextPath}/resources/img/cards/shirt.png" style="width: 50px;" />
	</div>
	<div id="playerData3" style="display: none;">
		<p id="player3Nick" style="position: absolute; color: yellow; left: 105px; top: 363px;"></p>
		<p id="player3Balance" style="position: absolute; color: yellow; left: 105px; top: 456px;"></p>
	</div>
	<div>
		<img id="position3" onclick="f1(3)" class="img-thumbnail player3" src="${contextPath}/resources/img/sitTable.png" />
	</div>
	<div id="bet3" class="bet3" style="display: none;">
		<i id="bets3" class="fas fa-dollar-sign" style="color: gold; position: absolute; left: 190px; top: 346px;"></i>
	</div>

	<div id="shirt4" class="shirt4" style="display: none;">
		<img id="playerCard4" src="${contextPath}/resources/img/cards/shirt.png" style="width: 50px;" /> <img id="playerCard44"
			src="${contextPath}/resources/img/cards/shirt.png" style="width: 50px;" />
	</div>
	<div id="playerData4" style="display: none;">
		<p id="player4Nick" style="position: absolute; color: yellow; left: 218px; top: 178px;"></p>
		<p id="player4Balance" style="position: absolute; color: yellow; left: 218px; top: 271px;"></p>
	</div>
	<div>
		<img id="position4" onclick="f1(4)" class="img-thumbnail player4" src="${contextPath}/resources/img/sitTable.png" />
	</div>
	<div id="bet4" class="bet4" style="display: none;">
		<i id="bets4" class="fas fa-dollar-sign" style="color: gold; position: absolute; left: 299px; top: 274px;"></i>
	</div>

	<div id="shirt5" class="shirt5" style="display: none;">
		<img id="playerCard5" src="${contextPath}/resources/img/cards/shirt.png" style="width: 50px;" /> <img id="playerCard55"
			src="${contextPath}/resources/img/cards/shirt.png" style="width: 50px;" />
	</div>
	<div id="playerData5" style="display: none;">
		<p id="player5Nick" style="position: absolute; color: yellow; left: 418px; top: 133px;"></p>
		<p id="player5Balance" style="position: absolute; color: yellow; left: 418px; top: 226px;"></p>
	</div>
	<div>
		<img id="position5" onclick="f1(5)" class="img-thumbnail player5" src="${contextPath}/resources/img/sitTable.png" />
	</div>
	<div id="bet5" class="bet5" style="display: none;">
		<i id="bets5" class="fas fa-dollar-sign" style="color: gold; position: absolute; left: 500px; top: 233px;"></i>
	</div>

	<div id="shirt6" class="shirt6" style="display: none;">
		<img id="playerCard6" src="${contextPath}/resources/img/cards/shirt.png" style="width: 50px;" /> <img id="playerCard66"
			src="${contextPath}/resources/img/cards/shirt.png" style="width: 50px;" />
	</div>
	<div id="playerData6" style="display: none;">
		<p id="player6Nick" style="position: absolute; color: yellow; left: 683px; top: 133px;"></p>
		<p id="player6Balance" style="position: absolute; color: yellow; left: 683px; top: 226px;"></p>
	</div>
	<div>
		<img id="position6" onclick="f1(6)" class="img-thumbnail player6" src="${contextPath}/resources/img/sitTable.png" />
	</div>
	<div id="bet6" class="bet6" style="display: none;">
		<i id="bets6" class="fas fa-dollar-sign" style="color: gold; position: absolute; left: 765px; top: 233px;"></i>
	</div>

	<div id="shirt7" class="shirt7" style="display: none;">
		<img id="playerCard7" src="${contextPath}/resources/img/cards/shirt.png" style="width: 50px;" /> <img id="playerCard77"
			src="${contextPath}/resources/img/cards/shirt.png" style="width: 50px;" />
	</div>
	<div id="playerData7" style="display: none;">
		<p id="player7Nick" style="position: absolute; color: yellow; left: 867px; top: 178px;"></p>
		<p id="player7Balance" style="position: absolute; color: yellow; left: 867px; top: 271px;"></p>
	</div>
	<div>
		<img id="position7" onclick="f1(7)" class="img-thumbnail player7" src="${contextPath}/resources/img/sitTable.png" />
	</div>
	<div id="bet7" class="bet7" style="display: none;">
		<i id="bets7" class="fas fa-dollar-sign" style="color: gold; position: absolute; left: 910px; top: 293px;"></i>
	</div>

	<div id="shirt8" class="shirt8" style="display: none;">
		<img id="playerCard8" src="${contextPath}/resources/img/cards/shirt.png" style="width: 50px;" /> <img id="playerCard88"
			src="${contextPath}/resources/img/cards/shirt.png" style="width: 50px;" />
	</div>
	<div id="playerData8" style="display: none;">
		<p id="player8Nick" style="position: absolute; color: yellow; left: 987px; top: 363px;"></p>
		<p id="player8Balance" style="position: absolute; color: yellow; left: 987px; top: 456px;"></p>
	</div>
	<div>
		<img id="position8" onclick="f1(8)" class="img-thumbnail player8" src="${contextPath}/resources/img/sitTable.png" />
	</div>
	<div id="bet8" class="bet8" style="display: none;">
		<i id="bets8" class="fas fa-dollar-sign" style="color: gold; position: absolute; left: 950px; top: 405px;"></i>
	</div>

	<div id="shirt9" class="shirt9" style="display: none;">
		<img id="playerCard9" src="${contextPath}/resources/img/cards/shirt.png" style="width: 50px;" /> <img id="playerCard99"
			src="${contextPath}/resources/img/cards/shirt.png" style="width: 50px;" />
	</div>
	<div id="playerData9" style="display: none;">
		<p id="player9Nick" style="position: absolute; color: yellow; left: 868px; top: 577px;"></p>
		<p id="player9Balance" style="position: absolute; color: yellow; left: 868px; top: 671px;"></p>
	</div>
	<div>
		<img id="position9" onclick="f1(9)" class="img-thumbnail player9" src="${contextPath}/resources/img/sitTable.png" />
	</div>
	<div id="bet9" class="bet9" style="display: none;">
		<i id="bets9" class="fas fa-dollar-sign" style="color: gold; position: absolute; left: 868px; top: 558px;"></i>
	</div>

	<div id="shirt10" class="shirt10" style="display: none;">
		<img id="playerCard10" src="${contextPath}/resources/img/cards/shirt.png" style="width: 50px;" /> <img id="playerCard101"
			src="${contextPath}/resources/img/cards/shirt.png" style="width: 50px;" />
	</div>
	<div id="playerData10" style="display: none;">
		<p id="player10Nick" style="position: absolute; color: yellow; left: 683px; top: 627px;"></p>
		<p id="player10Balance" style="position: absolute; color: yellow; left: 683px; top: 721px;"></p>
	</div>
	<div>
		<img id="position10" onclick="f1(10)" class="img-thumbnail player10" src="${contextPath}/resources/img/sitTable.png" />
	</div>
	<div id="bet10" class="bet10" style="display: none;">
		<i id="bets10" class="fas fa-dollar-sign" style="color: gold; position: absolute; left: 684px; top: 608px;"></i>
	</div>

	<div id="btnFold" style="display: none;">
		<button id="btnFold" type="button" class="btn btn-success btn-lg btnFold">FOLD</button>
	</div>
	<div id="btnCheck" style="display: none;">
		<button id="btnCheck" type="button" class="btn btn-success btn-lg btnCheck">CHECK</button>
	</div>
	<div id="btnCall" style="display: none;">
		<button id="btnCall" type="button" class="btn btn-success btn-lg btnCall">CALL</button>
	</div>
	<div id="btnRaise" style="display: none;">
		<button id="btnRaise" type="button" class="btn btn-success btn-lg btnRaise">RAISE</button>
	</div>
	<div id="inputRaise" class="formForRaise input-group" style="display: none;">
		<input type="number" class="form-control inputRaise" name="input_text1" id="input_text1" max="1000" value="0"
			onchange="rangeinput1.value = input_text1.value" style="margin-bottom: 5px; border-radius: 5px" /> <input type="range"
			oninput="input_text1.value = rangeinput1.value" class="form-control-range slider" type="range" min="0" max="1000" value="0"
			id="rangeinput1" step="1" onchange="input_text1.value = rangeinput1.value" />
	</div>
	<div id="btnBet" style="display: none;">
		<button id="btnBet" type="button" class="btn btn-success btn-lg btnBet">BET</button>
	</div>

	<div id="timer" style="color: honeydew; display: show;" >
		The game will start in: <div class="seconds">30</div> sec!
	</div>
</div>


<script>
var baseUrl = '${pageContext.request.contextPath}';
	function f1(arg) {
		$.ajax({
			url : baseUrl + '/inGame/setposition?id=' + arg + '&gameid=' + ${game.id},
			type : 'post',
			success : function(result) {
				if (result == false) {
					toastr.success('Now the action is not available!');
				} else {
					toastr.success('Have a nice game!');
					$("#position" + arg).attr("src", baseUrl + '/resources/img/avatars/position' + arg + '.jpg');
					$("#shirt" + arg).show();
					$("#playerData" + arg).show();
				} 
			}
		});

	}
</script>

<script>
setInterval(function() {
	
	$.ajax({
		  url: baseUrl + '/inGame/getGameState?gameid=' + ${game.id},
		  type : 'get',
		  success: function(game){
		    if (game.state == "END") {
				
		    	$.ajax({
		  		  url: baseUrl + '/inGame/getCountPlayers?gameid=' + ${game.id},
		  		  type : 'get',
		  		  success: function(count){
		  		    if (count >= 2) {
		  				
		  		    var _Seconds = $('.seconds').text(),
		  		    int;
		  		    int = setInterval(function() { 
		  		      if (_Seconds > 0) {
		  		        _Seconds--; 
		  		        $('.seconds').text(_Seconds); 
		  		      } else {
		  		        clearInterval(int); 
		  		      $("#timer").hide(); // тут нужно сделать запрос на изменение статуса игры и старта.
		  		      }
		  		    }, 1000);
		  		    	
		  			}
		  		  }
		  		});
		    	
			}
		  }
		});
	
}, 2 * 1000);
</script>





