<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="mytaglib" uri="my-custom-tags-uri"%>
<%@ taglib prefix="jspFragments" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<div class="container">
	<img src="${contextPath}/resources/img/fon-poker.png" alt="" class="rounded-pill tableIngame">

	<div id="tableCard1" style="display: show;">
		<img id="card1" class="card1" src="${contextPath}/resources/img/cards/shirt.png" />
	</div>
	<div id="tableCard2" style="display: show;">
		<img id="card2" class="card2" src="${contextPath}/resources/img/cards/shirt.png" />
	</div>
	<div id="tableCard3" style="display: show;">
		<img id="card3" class="card3" src="${contextPath}/resources/img/cards/shirt.png" />
	</div>
	<div id="tableCard4" style="display: show;">
		<img id="card4" class="card4" src="${contextPath}/resources/img/cards/shirt.png" />
	</div>
	<div id="tableCard5" style="display: show;">
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
		<p id="player1Nick" style="position: absolute; color: turquoise; left: 416px; top: 627px;"></p>
		<p id="player1Balance" style="position: absolute; color: turquoise; left: 416px; top: 721px;"></p>
	</div>
	<div>
		<img id="position1" onclick="f1(1)" class="img-thumbnail player1" src="${contextPath}/resources/img/sitTable.png" />
	</div>
	<div id="bet1" class="bet1" style="display: none;">
		<i id="bets1" class="fas fa-coins" style="color: gold; position: absolute; left: 419px; top: 605px;"></i>
	</div>
	<div class="notActiveX" id="notActive1" style="display: none; top: 663px; left: 436px;">
		<h1>X</h1>
	</div>

	<div id="shirt2" class="shirt2" style="display: none;">
		<img id="playerCard2" src="${contextPath}/resources/img/cards/shirt.png" style="width: 50px;" /> <img id="playerCard22"
			src="${contextPath}/resources/img/cards/shirt.png" style="width: 50px;" />
	</div>
	<div id="playerData2" style="display: none;">
		<p id="player2Nick" style="position: absolute; color: turquoise; left: 218px; top: 577px;"></p>
		<p id="player2Balance" style="position: absolute; color: turquoise; left: 217px; top: 671px;"></p>
	</div>
	<div>
		<img id="position2" onclick="f1(2)" class="img-thumbnail player2" src="${contextPath}/resources/img/sitTable.png" />
	</div>
	<div id="bet2" class="bet2" style="display: none;">
		<i id="bets2" class="fas fa-coins" style="color: gold; position: absolute; left: 220px; top: 560px;"></i>
	</div>
	<div class="notActiveX" id="notActive2" style="display: none; top: 614px; left: 241px;">X</div>

	<div id="shirt3" class="shirt3" style="display: none;">
		<img id="playerCard3" src="${contextPath}/resources/img/cards/shirt.png" style="width: 50px;" /> <img id="playerCard33"
			src="${contextPath}/resources/img/cards/shirt.png" style="width: 50px;" />
	</div>
	<div id="playerData3" style="display: none;">
		<p id="player3Nick" style="position: absolute; color: turquoise; left: 105px; top: 363px;"></p>
		<p id="player3Balance" style="position: absolute; color: turquoise; left: 105px; top: 456px;"></p>
	</div>
	<div>
		<img id="position3" onclick="f1(3)" class="img-thumbnail player3" src="${contextPath}/resources/img/sitTable.png" />
	</div>
	<div id="bet3" class="bet3" style="display: none;">
		<i id="bets3" class="fas fa-coins" style="color: gold; position: absolute; left: 190px; top: 346px;"></i>
	</div>
	<div class="notActiveX" id="notActive3" style="display: none; top: 397px; left: 127px;">X</div>

	<div id="shirt4" class="shirt4" style="display: none;">
		<img id="playerCard4" src="${contextPath}/resources/img/cards/shirt.png" style="width: 50px;" /> <img id="playerCard44"
			src="${contextPath}/resources/img/cards/shirt.png" style="width: 50px;" />
	</div>
	<div id="playerData4" style="display: none;">
		<p id="player4Nick" style="position: absolute; color: turquoise; left: 218px; top: 178px;"></p>
		<p id="player4Balance" style="position: absolute; color: turquoise; left: 218px; top: 271px;"></p>
	</div>
	<div>
		<img id="position4" onclick="f1(4)" class="img-thumbnail player4" src="${contextPath}/resources/img/sitTable.png" />
	</div>
	<div id="bet4" class="bet4" style="display: none;">
		<i id="bets4" class="fas fa-coins" style="color: gold; position: absolute; left: 299px; top: 274px;"></i>
	</div>
	<div class="notActiveX" id="notActive4" style="display: none; top: 210px; left: 242px;">X</div>

	<div id="shirt5" class="shirt5" style="display: none;">
		<img id="playerCard5" src="${contextPath}/resources/img/cards/shirt.png" style="width: 50px;" /> <img id="playerCard55"
			src="${contextPath}/resources/img/cards/shirt.png" style="width: 50px;" />
	</div>
	<div id="playerData5" style="display: none;">
		<p id="player5Nick" style="position: absolute; color: turquoise; left: 418px; top: 133px;"></p>
		<p id="player5Balance" style="position: absolute; color: turquoise; left: 418px; top: 226px;"></p>
	</div>
	<div>
		<img id="position5" onclick="f1(5)" class="img-thumbnail player5" src="${contextPath}/resources/img/sitTable.png" />
	</div>
	<div id="bet5" class="bet5" style="display: none;">
		<i id="bets5" class="fas fa-coins" style="color: gold; position: absolute; left: 500px; top: 233px;"></i>
	</div>
	<div class="notActiveX" id="notActive5" style="display: none; left: 438px; top: 166px;">X</div>

	<div id="shirt6" class="shirt6" style="display: none;">
		<img id="playerCard6" src="${contextPath}/resources/img/cards/shirt.png" style="width: 50px;" /> <img id="playerCard66"
			src="${contextPath}/resources/img/cards/shirt.png" style="width: 50px;" />
	</div>
	<div id="playerData6" style="display: none;">
		<p id="player6Nick" style="position: absolute; color: turquoise; left: 683px; top: 133px;"></p>
		<p id="player6Balance" style="position: absolute; color: turquoise; left: 683px; top: 226px;"></p>
	</div>
	<div>
		<img id="position6" onclick="f1(6)" class="img-thumbnail player6" src="${contextPath}/resources/img/sitTable.png" />
	</div>
	<div id="bet6" class="bet6" style="display: none;">
		<i id="bets6" class="fas fa-coins" style="color: gold; position: absolute; left: 765px; top: 233px;"></i>
	</div>
	<div class="notActiveX" id="notActive6" style="display: none; left: 705px; top: 167px;">X</div>

	<div id="shirt7" class="shirt7" style="display: none;">
		<img id="playerCard7" src="${contextPath}/resources/img/cards/shirt.png" style="width: 50px;" /> <img id="playerCard77"
			src="${contextPath}/resources/img/cards/shirt.png" style="width: 50px;" />
	</div>
	<div id="playerData7" style="display: none;">
		<p id="player7Nick" style="position: absolute; color: turquoise; left: 867px; top: 178px;"></p>
		<p id="player7Balance" style="position: absolute; color: turquoise; left: 867px; top: 271px;"></p>
	</div>
	<div>
		<img id="position7" onclick="f1(7)" class="img-thumbnail player7" src="${contextPath}/resources/img/sitTable.png" />
	</div>
	<div id="bet7" class="bet7" style="display: none;">
		<i id="bets7" class="fas fa-coins" style="color: gold; position: absolute; left: 910px; top: 293px;"></i>
	</div>
	<div class="notActiveX" id="notActive7" style="display: none; left: 888px; top: 212px;">X</div>

	<div id="shirt8" class="shirt8" style="display: none;">
		<img id="playerCard8" src="${contextPath}/resources/img/cards/shirt.png" style="width: 50px;" /> <img id="playerCard88"
			src="${contextPath}/resources/img/cards/shirt.png" style="width: 50px;" />
	</div>
	<div id="playerData8" style="display: none;">
		<p id="player8Nick" style="position: absolute; color: turquoise; left: 987px; top: 363px;"></p>
		<p id="player8Balance" style="position: absolute; color: turquoise; left: 987px; top: 456px;"></p>
	</div>
	<div>
		<img id="position8" onclick="f1(8)" class="img-thumbnail player8" src="${contextPath}/resources/img/sitTable.png" />
	</div>
	<div id="bet8" class="bet8" style="display: none;">
		<i id="bets8" class="fas fa-coins" style="color: gold; position: absolute; left: 950px; top: 405px;"></i>
	</div>
	<div class="notActiveX" id="notActive8" style="display: none; left: 1009px; top: 398px;">X</div>

	<div id="shirt9" class="shirt9" style="display: none;">
		<img id="playerCard9" src="${contextPath}/resources/img/cards/shirt.png" style="width: 50px;" /> <img id="playerCard99"
			src="${contextPath}/resources/img/cards/shirt.png" style="width: 50px;" />
	</div>
	<div id="playerData9" style="display: none;">
		<p id="player9Nick" style="position: absolute; color: turquoise; left: 868px; top: 577px;"></p>
		<p id="player9Balance" style="position: absolute; color: turquoise; left: 868px; top: 671px;"></p>
	</div>
	<div>
		<img id="position9" onclick="f1(9)" class="img-thumbnail player9" src="${contextPath}/resources/img/sitTable.png" />
	</div>
	<div id="bet9" class="bet9" style="display: none;">
		<i id="bets9" class="fas fa-coins" style="color: gold; position: absolute; left: 868px; top: 558px;"></i>
	</div>
	<div class="notActiveX" id="notActive9" style="display: none; left: 889px; top: 613px;">X</div>

	<div id="shirt10" class="shirt10" style="display: none;">
		<img id="playerCard10" src="${contextPath}/resources/img/cards/shirt.png" style="width: 50px;" /> <img id="playerCard101"
			src="${contextPath}/resources/img/cards/shirt.png" style="width: 50px;" />
	</div>
	<div id="playerData10" style="display: none;">
		<p id="player10Nick" style="position: absolute; color: turquoise; left: 683px; top: 627px;"></p>
		<p id="player10Balance" style="position: absolute; color: turquoise; left: 683px; top: 721px;"></p>
	</div>
	<div>
		<img id="position10" onclick="f1(10)" class="img-thumbnail player10" src="${contextPath}/resources/img/sitTable.png" />
	</div>
	<div id="bet10" class="bet10" style="display: none;">
		<i id="bets10" class="fas fa-coins" style="color: gold; position: absolute; left: 684px; top: 608px;"></i>
	</div>
	<div class="notActiveX" id="notActive10" style="display: none; left: 705px; top: 663px;">X</div>

	<div id="btnFold" style="display: none;">
		<button onclick="foldBtn()" id="btnFold" type="button" class="btn btn-success btn-lg btnFold">FOLD</button>
	</div>
	<div id="btnCheck" style="display: none;">
		<button onclick="checkBtn()" id="btnCheck" type="button" class="btn btn-success btn-lg btnCheck">CHECK</button>
	</div>
	<div id="btnCall" style="display: none;">
		<button onclick="callBtn()" id="callBtn" type="button" class="btn btn-success btn-lg btnCall">CALL</button>
	</div>
	<div id="btnRaise" style="display: none;">
		<button onclick="raiseBtn()" id="btnRaise" type="button" class="btn btn-success btn-lg btnRaise">RAISE</button>
	</div>
	<div id="inputRaise" class="formForRaise input-group" style="display: none;">
		<input id="inputRaise1" type="number" class="form-control inputRaise" name="input_text1" id="input_text1" max="1000" value="15"
			onchange="rangeinput1.value = input_text1.value" style="margin-bottom: 5px; border-radius: 5px" /> <input type="range"
			oninput="input_text1.value = rangeinput1.value" class="form-control-range slider" type="range" min="0" max="1000" value="15"
			id="rangeinput1" step="1" onchange="input_text1.value = rangeinput1.value" />
	</div>
	<div id="btnBet" style="display: none;">
		<button onclick="btnBet()" id="btnBet" type="button" class="btn btn-success btn-lg btnBet">BET</button>
	</div>

	<div id="startBtn" class="startBtn" style="display: none;">
		<button id="startBtn" type="button" class="btn btn-primary btn-lg">Start game</button>
		<div id="digital-clock" style="color: white;"></div>
	</div>
	<div id="firstDeal" style="color: white; display: none;">Первый этап. Нужно сделать минимальную ставку "BET" или сбросить карты
		"FOLD".</div>
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
					$("#startBtn").show();
				} 
			}
		});

	}
</script>

<script>

var baseUrl = '${pageContext.request.contextPath}';

function btnBet() {
	$.ajax({
		url : baseUrl + '/inGame/isActive?gameid=' + ${game.id},
		type : 'post',
		success : function(result) {
			if (result == true) {
				$.ajax({
					url : baseUrl + '/inGame/setFirstBet?gameid=' + ${game.id},
					type : 'post',
					success : function(result) {
						 
					}
				});
			} else {
				toastr.error('Another player is active now!');
			}
		}
	});
}

function foldBtn() {
	$.ajax({
		url : baseUrl + '/inGame/isActive?gameid=' + ${game.id},
		type : 'post',
		success : function(result) {
			if (result == true) {
				$.ajax({
					url : baseUrl + '/inGame/clickFold?gameid=' + ${game.id},
					type : 'post',
					success : function(result) {
						 
					}
				});
			} else {
				toastr.error('Another player is active now!');
			}
		}
	});
}

function checkBtn() {
	$.ajax({
		url : baseUrl + '/inGame/isActive?gameid=' + ${game.id},
		type : 'post',
		success : function(result) {
			if (result == true) {
				$.ajax({
					url : baseUrl + '/inGame/clickCheck?gameid=' + ${game.id},
					type : 'post',
					success : function(result) {
						 if (result == true) {
							
						} else {
							toastr.error('You must either call or raise your bet!');
						}
					}
				});
			} else {
				toastr.error('Another player is active now!');
			}
		}
	});
}

function callBtn() {
	$.ajax({
		url : baseUrl + '/inGame/isActive?gameid=' + ${game.id},
		type : 'post',
		success : function(result) {
			if (result == true) {
				$.ajax({
					url : baseUrl + '/inGame/clickCall?gameid=' + ${game.id},
					type : 'post',
					success : function(result) {
						
					}
				});
			} else {
				toastr.error('Another player is active now!');
			}
		}
	});
}

function raiseBtn(value) {
	$.ajax({
		url : baseUrl + '/inGame/isActive?gameid=' + ${game.id},
		type : 'post',
		success : function(result) {
			if (result == true) {
				$.ajax({
					url : baseUrl + '/inGame/clickRaise?gameid=' + ${game.id} + '&value=' + $("#inputRaise1").val(),
					type : 'post',
					success : function(result) {
						if (result == false) {
							toastr.error('The bet cannot be less than the previous one!');
						} 
					}
				});
			} else {
				toastr.error('Another player is active now!');
			}
		}
	});
}

</script>

<script>
	var baseUrl = '${pageContext.request.contextPath}';

	function f2(arg, player) {
		$("#position" + arg).attr("src", baseUrl + '/resources/img/avatars/position' + arg + '.jpg');
		$("#shirt" + arg).show();
		$("#playerData" + arg).show();
		$("#bet" + arg).show();
		var $bet = $('#bets' + arg).text(player.curentBet);
		var $nickname = $('#player' + arg + 'Nick').text(player.nick);
		var $stack = $('#player' + arg + 'Balance').text(player.stack);
		if (player.active == true) {
			$("#position" + arg).addClass('activePlayer');
			
		} else {
			$("#position" + arg).removeClass('activePlayer');
			
		}
		if (player.state == "USUAL") {
			//setTimeout(fsetNextActivePlayer, 15000);
			//var fiveMinutes = 15,
			//display = $('#time');
			//startTimer(fiveMinutes, display);
		} else if (player.state == "FINISHED") {
			$("#notActive" + arg).show();
		}

	}

	function f3(arg, arg2, player) {
		$("#shirt" + arg).show();
		$("#playerCard" + arg).attr("src", baseUrl + player.card1);
		$("#playerCard" + arg2).attr("src", baseUrl + player.card2);
		
	}
	
	
		
		
		 $("#startBtn").click(function () {
					$.ajax({
							url : baseUrl + '/inGame/getCountPlayers?gameid=' + ${game.id},
							type : 'get',
		 					success : function(count) {
								if (count == 1) {
									toastr.success('Players must be 2 or more!');
								} else {
									$("#startBtn").hide();
									toastr.success('The game starts! Have a nice game!');
									$.ajax({
										url : baseUrl + '/inGame/changeGameToNew?gameid=' + ${game.id},
										type : 'post',
// 											success : function(game) {
												
// 											}
									});
									
								}
		 					}
						});
			});
		
	
	setInterval(function() {
		$.ajax({
			url : baseUrl + '/inGame/getPlayerData?gameid=' + ${game.id},
			type : 'get',
			success : function(result) {
			
				for (var i = 1; i < 11; i++) {
					$("#position" + i).attr("src", baseUrl + '/resources/img/sitTable.png');
					$("#shirt" + i).hide();
					$("#playerData" + i).hide();
					//$("#notActive" + i).hide();
					}
			
				result.forEach(function(player) { 
					if (player.position == "ONE") {
						f2(1, player);
						if(player.card1 != null && ${user.id} == player.userAccountId) {
							f3(1, 11, player);
						}
					} 
					if (player.position == "TWO") {
						f2(2, player);
						if(player.card1 != null && ${user.id} == player.userAccountId) {
							f3(2, 22, player);
						}
					}
					if (player.position == "THREE") {
						f2(3, player);
						if(player.card1 != null && ${user.id} == player.userAccountId) {
							f3(3, 33, player);
						}
					}
					if (player.position == "FOUR") {
						f2(4, player);
						if(player.card1 != null && ${user.id} == player.userAccountId) {
							f3(4, 44, player);
						}
					} 
					if (player.position == "FIVE") {
						f2(5, player);
						if(player.card1 != null && ${user.id} == player.userAccountId) {
							f3(5, 55, player);
						}
					}
					if (player.position == "SIX") {
						f2(6, player);
						if(player.card1 != null && ${user.id} == player.userAccountId) {
							f3(6, 66, player);
						}
					} 
					if (player.position == "SEVEN") {
						f2(7, player);
						if(player.card1 != null && ${user.id} == player.userAccountId) {
							f3(7, 77, player);
						}
					} 
					if (player.position == "EIGHT") {
						f2(8, player);
						if(player.card1 != null && ${user.id} == player.userAccountId) {
							f3(8, 88, player);
						}
					} 
					if (player.position == "NINE") {
						f2(9, player);
						if(player.card1 != null && ${user.id} == player.userAccountId) {
							f3(9, 99, player);
						}
					}
					if (player.position == "TEN") {
						f2(10, player);
						if(player.card1 != null && ${user.id} == player.userAccountId) {
							f3(10, 101, player);
						}
					} 
				});
			}
		});
	
	}, 2 * 1000);
	
// 	function fsetNextActivePlayer() {
// 		$.ajax({
// 				url : baseUrl + '/inGame/changeActivePlayer?gameid=' + ${game.id},
// 				type : 'get',
// 				success : function(game) {
				
// 				}
// 			});
// 		}
	
	function getDateTime() {
        var now     = new Date(); 
        var day     = now.getDate();
        var hour    = now.getHours();
        var minute  = now.getMinutes();
        var second  = now.getSeconds(); 
        if(hour.toString().length == 1) {
             hour = '0'+hour;
        }
        if(minute.toString().length == 1) {
             minute = '0'+minute;
        }
        if(second.toString().length == 1) {
             second = '0'+second;
        }   
        var dateTime = hour+':'+minute+':'+second;   
         return dateTime;
    }
	
	setInterval(function(){
        currentTime = getDateTime();
        document.getElementById("digital-clock").innerHTML = currentTime;
    }, 1000);
	
	setInterval(function(){
		$.ajax({
			url : baseUrl + '/inGame/getGameState?gameid=' + ${game.id},
			type : 'get',
				success : function(game) {
					if (game.state == "ACTIVE") {
						$("#startBtn").hide();
						var $bank = $('#bank').text(game.bank);
						$("#btnFold").show();
						$("#btnBet").show();
						$("#firstDeal").show();
						
					} else if (game.state == "ACTIVE2") {
						$("#startBtn").hide();
						var $bank = $('#bank').text(game.bank);
						$("#btnFold").show();
						$("#btnBet").hide();
						$("#firstDeal").hide();
						$("#btnCheck").show();
						$("#btnCall").show();
						$("#btnRaise").show();
						$("#inputRaise").show();
						$.ajax({
							url : baseUrl + '/inGame/getThreeCards?gameid=' + ${game.id},
							type : 'get',
							success : function(threeCards) {
								var i = 1;
								threeCards.forEach(function(card) {
									$("#card" + i).attr("src", baseUrl + card.filename);
									i++;
								});
							}
						});
					} else if (game.state == "ACTIVE3") {
						$("#startBtn").hide();
						var $bank = $('#bank').text(game.bank);
						$("#btnFold").show();
						$("#btnBet").hide();
						$("#firstDeal").hide();
						$("#btnCheck").show();
						$("#btnCall").show();
						$("#btnRaise").show();
						$("#inputRaise").show();
						$.ajax({
							url : baseUrl + '/inGame/getFourCards?gameid=' + ${game.id},
							type : 'get',
							success : function(threeCards) {
								var i = 1;
								threeCards.forEach(function(card) {
									$("#card" + i).attr("src", baseUrl + card.filename);
									i++;
								});
							}
						});
					} else if (game.state == "ACTIVE4") {
						$("#startBtn").hide();
						var $bank = $('#bank').text(game.bank);
						$("#btnFold").show();
						$("#btnBet").hide();
						$("#firstDeal").hide();
						$("#btnCheck").show();
						$("#btnCall").show();
						$("#btnRaise").show();
						$("#inputRaise").show();
						$.ajax({
							url : baseUrl + '/inGame/getFiveCards?gameid=' + ${game.id},
							type : 'get',
							success : function(threeCards) {
								var i = 1;
								threeCards.forEach(function(card) {
									$("#card" + i).attr("src", baseUrl + card.filename);
									i++;
								});
							}
						});
					} else if (game.state == "CHECKHAND") {
						$.ajax({
							url : baseUrl + '/inGame/getFiveCards?gameid=' + ${game.id},
							type : 'get',
							success : function(threeCards) {
								var i = 1;
								threeCards.forEach(function(card) {
									$("#card" + i).attr("src", baseUrl + card.filename);
									i++;
								});
							}
						});
						
						$("#btnFold").hide();
						$("#btnBet").hide();
						$("#btnCheck").hide();
						$("#btnCall").hide();
						$("#btnRaise").hide();
						$("#inputRaise").hide();
					}
				}
		});
    }, 2 * 1000);
	
	setInterval(function(){
		$.ajax({
			url : baseUrl + '/inGame/getGameState?gameid=' + ${game.id},
			type : 'get',
			success : function(game) {
				if (game.state == "CHECKHAND") {
					$.ajax({
						url : baseUrl + '/inGame/getWinner?gameid=' + ${game.id},
						type : 'get',
						success : function(game) {
							
						}
					});
				}
			}
		});
    },3 * 1000);
	
	function startTimer(duration, display) {
	    var timer = duration, seconds;
	    setInterval(function () {
	       
	        seconds = parseInt(timer % 60, 10);
	        
	        seconds = seconds < 10 ? "0" + seconds : seconds;

	        display.text( seconds);

	        if (--timer < 0) {
	            timer = duration;
	        }
	    }, 1000);
	}

</script>



