var firstCheck = false;
var reCheck = false;
var first, last;

$(function() {
	// 예약하러가기 버튼 클릭
	$("#reservation").click(function() {
		// 시작 날짜 보내기
		if(first > 32){
			first -= 32;
		}
		if(last > 32){
			last -= 32;
		}
		
		var start = first + $("#startDate").val();
		$("#startDate").val(start);

		// 종료 날짜 보내기
		var end = last + $("#endDate").val();
		$("#endDate").val(end);

		$("#dateSend").attr({
			"method": "GET",
			"action": "/client/reserve/reserveRoom"
		});
		$("#dateSend").submit();
	});
});

// 이전 달 눌렀을 때
function monthPrevious(year, month) {
	$("#table1").css("display", "inline-block");
	$("#table2").css("display", "none");

	// input 값 맞추기
	$("#startDate").val("/" + month + "/" + year);
	$("#endDate").val("/" + month + "/" + year);
}

// 다음 달 눌렀을 때
function monthNext(year, month){
	$("#table1").css("display", "none");
	$("#table2").css("display", "inline-block");
	
	// input 값 맞추기
	if(firstCheck == true){
		$("#endDate").val("/" + month + "/" + year);
	}else{
		$("#startDate").val("/" + month + "/" + year);
		$("#endDate").val("/" + month + "/" + year);
	}
}

function dateClick(i, year, month) {
	if (reCheck == true) {
		// td 색깔 초기화
		$("td").css("background-color", "#F2F2F2");
		reCheck = false;

		// 다시 클릭시 초기화
		$("#startDate").val("/" + month + "/" + year);
		$("#endDate").val("/" + month + "/" + year);

		first = i;
		firstCheck = true;

		// 예약하러가기 disable
		$("#reservation").attr("disabled", true);
	}
	if (firstCheck == false) {
		// 선택자에 변수넣기
		$("#date" + i).css("background-color", "green");
		firstCheck = true;
		first = i;
	} else {
		if (first >= i) {
			$("#date" + first).css("background-color", "#F2F2F2");
			$("#date" + i).css("background-color", "green");
			first = i;
		} else {
			// 끝날짜 정해짐
			for (var j = first; j <= i; j++) {
				$("#date" + j).css("background-color", "green");
				reCheck = true;
			}

			last = i;

			// 예약하러가기 풀기
			$("#reservation").attr("disabled", false);
		}
	}
}