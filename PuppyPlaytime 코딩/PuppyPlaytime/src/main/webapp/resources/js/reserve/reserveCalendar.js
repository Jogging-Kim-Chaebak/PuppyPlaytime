var firstCheck = false;
var reCheck = false;
var first, last;

$(function() {
	// 예약하러가기 버튼 클릭
	$("#reservation").click(function() {
		// 시작 날짜 보내기
		var start = $("#startDate").val() + first + "일";
		$("#startDate").val(start);

		// 종료 날짜 보내기
		var end = $("#endDate").val() + last + "일";
		$("#endDate").val(end);

		$("#dateSend").attr({
			"method": "GET",
			"action": "/client/reserve/reserveRoom"
		});
		$("#dateSend").submit();
	});
});

function monthPrevious(year, month) {
	$("#table1").css("display", "inline-block");
	$("#table2").css("display", "none");
}

function monthNext(year, month){
	$("#table1").css("display", "none");
	$("#table2").css("display", "inline-block");
}

function dateClick(i, inityear, initmonth) {
	if (reCheck == true) {
		// td 색깔 초기화
		$("td").css("background-color", "#F2F2F2");
		reCheck = false;

		$("#startDate").val(inityear + "년" + initmonth + "월");
		$("#endDate").val(inityear + "년" + initmonth + "월");

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