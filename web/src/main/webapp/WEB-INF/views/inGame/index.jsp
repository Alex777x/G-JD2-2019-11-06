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
		<i class="fas fa-piggy-bank"> 72.0</i>
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

	<div>
		<button id="btnFold" type="button" class="btn btn-success btn-lg btnFold">FOLD</button>
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
	<div style="color: honeydew;">
		Time to end of turn: <span id="time">30</span> sec!
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
jQuery(document).ready(function($){ 
	var baseUrl = '${pageContext.request.contextPath}';
	var $curentTime = $.now();
	setInterval(function() {
		$.ajax({
			url : baseUrl + '/inGame/gamestatus?gameid=' + ${game.id},
			type : 'get',
			success : function(result) {
				
				for (var i = 1; i < 11; i++) {
					$("#position" + i).attr("src", baseUrl + '/resources/img/sitTable.png');
					$("#shirt" + i).hide();
					$("#playerData" + i).hide();
					}
				
				result.forEach(function(player) {
					if (player.position == "ONE") {
						$("#position" + 1).attr("src", baseUrl + '/resources/img/avatars/position1.jpg');
						$("#shirt" + 1).show();
						$("#playerData" + 1).show();
						var $nickname = $('#player1Nick').text(player.nick);
						var $stack = $('#player1Balance').text(player.stack);
						if (player.active == true) {
							$("#position" + 1).addClass('activePlayer');
						} else {
							$("#position" + 1).removeClass('activePlayer');
						}
					} 
					if (player.position == "TWO") {
						$("#position" + 2).attr("src", baseUrl + '/resources/img/avatars/position2.jpg');
						$("#shirt" + 2).show();
						$("#playerData" + 2).show();
						var $nickname = $('#player2Nick').text(player.nick);
						var $stack = $('#player2Balance').text(player.stack);
						if (player.active == true) {
							$("#position" + 2).addClass('activePlayer');
						} else {
							$("#position" + 2).removeClass('activePlayer');
						}
					}
					if (player.position == "THREE") {
						$("#position" + 3).attr("src", baseUrl + '/resources/img/avatars/position3.jpg');
						$("#shirt" + 3).show();
						$("#playerData" + 3).show();
						var $nickname = $('#player3Nick').text(player.nick);
						var $stack = $('#player3Balance').text(player.stack);
						if (player.active == true) {
							$("#position" + 3).addClass('activePlayer');
						} else {
							$("#position" + 3).removeClass('activePlayer');
						}
					}
					if (player.position == "FOUR") {
						$("#position" + 4).attr("src", baseUrl + '/resources/img/avatars/position4.jpg');
						$("#shirt" + 4).show();
						$("#playerData" + 4).show();
						var $nickname = $('#player4Nick').text(player.nick);
						var $stack = $('#player4Balance').text(player.stack);
						if (player.active == true) {
							$("#position" + 4).addClass('activePlayer');
						} else {
							$("#position" + 4).removeClass('activePlayer');
						}
					} 
					if (player.position == "FIVE") {
						$("#position" + 5).attr("src", baseUrl + '/resources/img/avatars/position5.jpg');
						$("#shirt" + 5).show();
						$("#playerData" + 5).show();
						var $nickname = $('#player5Nick').text(player.nick);
						var $stack = $('#player5Balance').text(player.stack);
						if (player.active == true) {
							$("#position" + 5).addClass('activePlayer');
						} else {
							$("#position" + 5).removeClass('activePlayer');
						}
					}
					if (player.position == "SIX") {
						$("#position" + 6).attr("src", baseUrl + '/resources/img/avatars/position6.jpg');
						$("#shirt" + 6).show();
						$("#playerData" + 6).show();
						var $nickname = $('#player6Nick').text(player.nick);
						var $stack = $('#player6Balance').text(player.stack);
						if (player.active == true) {
							$("#position" + 6).addClass('activePlayer');
						} else {
							$("#position" + 6).removeClass('activePlayer');
						}
					} 
					if (player.position == "SEVEN") {
						$("#position" + 7).attr("src", baseUrl + '/resources/img/avatars/position7.jpg');
						$("#shirt" + 7).show();
						$("#playerData" + 7).show();
						var $nickname = $('#player7Nick').text(player.nick);
						var $stack = $('#player7Balance').text(player.stack);
						if (player.active == true) {
							$("#position" + 7).addClass('activePlayer');
						} else {
							$("#position" + 7).removeClass('activePlayer');
						}
					} 
					if (player.position == "EIGHT") {
						$("#position" + 8).attr("src", baseUrl + '/resources/img/avatars/position8.jpg');
						$("#shirt" + 8).show();
						$("#playerData" + 8).show();
						var $nickname = $('#player8Nick').text(player.nick);
						var $stack = $('#player8Balance').text(player.stack);
						if (player.active == true) {
							$("#position" + 8).addClass('activePlayer');
						} else {
							$("#position" + 8).removeClass('activePlayer');
						}
					} 
					if (player.position == "NINE") {
						$("#position" + 9).attr("src", baseUrl + '/resources/img/avatars/position9.jpg');
						$("#shirt" + 9).show();
						$("#playerData" + 9).show();
						var $nickname = $('#player9Nick').text(player.nick);
						var $stack = $('#player9Balance').text(player.stack);
						if (player.active == true) {
							$("#position" + 9).addClass('activePlayer');
						} else {
							$("#position" + 9).removeClass('activePlayer');
						}
					}
					if (player.position == "TEN") {
						$("#position" + 10).attr("src", baseUrl + '/resources/img/avatars/position10.jpg');
						$("#shirt" + 10).show();
						$("#playerData" + 10).show();
						var $nickname = $('#player10Nick').text(player.nick);
						var $stack = $('#player10Balance').text(player.stack);
						if (player.active == true) {
							$("#position" + 10).addClass('activePlayer');
						} else {
							$("#position" + 10).removeClass('activePlayer');
						}
					} 
				});
			}
		});
		
	}, 3 * 1000);
});



setInterval(function() {
	$.ajax({
		url : baseUrl + '/inGame/getPlayerCards?gameid=' + ${game.id},
		type : 'get',
		success : function(player) {
				if(player.card1 != null) {
					if (player.position == "ONE") {
						$("#shirt" + 1).show();
						$("#playerCard" + 1).attr("src", baseUrl + player.card1);
						$("#playerCard" + 11).attr("src", baseUrl + player.card2);
					}
					if (player.position == "TWO") {
						$("#shirt" + 2).show();
						$("#playerCard" + 2).attr("src", baseUrl + player.card1);
						$("#playerCard" + 22).attr("src", baseUrl + player.card2);
					}
					if (player.position == "THREE") {
						$("#shirt" + 3).show();
						$("#playerCard" + 3).attr("src", baseUrl + player.card1);
						$("#playerCard" + 33).attr("src", baseUrl + player.card2);
					}
					if (player.position == "FOUR") {
						$("#shirt" + 4).show();
						$("#playerCard" + 4).attr("src", baseUrl + player.card1);
						$("#playerCard" + 44).attr("src", baseUrl + player.card2);
					}
					if (player.position == "FIVE") {
						$("#shirt" + 5).show();
						$("#playerCard" + 5).attr("src", baseUrl + player.card1);
						$("#playerCard" + 55).attr("src", baseUrl + player.card2);
					}
					if (player.position == "SIX") {
						$("#shirt" + 6).show();
						$("#playerCard" + 6).attr("src", baseUrl + player.card1);
						$("#playerCard" + 66).attr("src", baseUrl + player.card2);
					}
					if (player.position == "SEVEN") {
						$("#shirt" + 7).show();
						$("#playerCard" + 7).attr("src", baseUrl + player.card1);
						$("#playerCard" + 77).attr("src", baseUrl + player.card2);
					}
					if (player.position == "EIGHT") {
						$("#shirt" + 8).show();
						$("#playerCard" + 8).attr("src", baseUrl + player.card1);
						$("#playerCard" + 88).attr("src", baseUrl + player.card2);
					}
					if (player.position == "NINE") {
						$("#shirt" + 9).show();
						$("#playerCard" + 9).attr("src", baseUrl + player.card1);
						$("#playerCard" + 99).attr("src", baseUrl + player.card2);
					}
					if (player.position == "TEN") {
						$("#shirt" + 10).show();
						$("#playerCard" + 10).attr("src", baseUrl + player.card1);
						$("#playerCard" + 101).attr("src", baseUrl + player.card2);
					}
				}
		}
	});
}, 3 * 1000);

setInterval(function() {
	$.ajax({
		url : baseUrl + '/inGame/getGameState?gameid=' + ${game.id},
		type : 'get',
		success : function(game) {
			if (game.state == "ACTIVE" && game.plaersCount > 1) {
				
				if (game.timestampEndStep < new Date().getTime() && game.timestampEndStep != null) {
					$.ajax({
						url : baseUrl + '/inGame/changeActivePlayer?gameid=' + ${game.id},
						type : 'get',
						success : function(game) {
							
						}
					});
				}
			}
		}
	});
	
}, 15 * 1000);


	
function startTimer(duration, display) {
    var timer = duration, minutes, seconds;
    setInterval(function () {
        minutes = parseInt(timer / 60, 10);
        seconds = parseInt(timer % 60, 10);

        minutes = minutes < 10 ? "0" + minutes : minutes;
        seconds = seconds < 10 ? "0" + seconds : seconds;

        display.text(minutes + ":" + seconds);

        if (--timer < 0) {
            timer = duration;
        }
    }, 1000);
}

</script>



