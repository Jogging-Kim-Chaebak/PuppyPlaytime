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
		
		var firstDate = first;
		var lastDate = last;
		
		if(first < 10){
			firstDate = "0" + first;
		}
		
		if(end < 10){
			lastDate = "0" + last;
		}
		
		var start =$("#startDate").val() + firstDate;
		$("#startDate").val(start);

		// 종료 날짜 보내기
		var end = $("#endDate").val() + lastDate;
		$("#endDate").val(end);

		$("#dateSend").attr({
			"method": "POST",
			"action": "/client/reserve/reservePetRegisterForm"
		});
		$("#dateSend").submit();
	});
});

// 이전 달 눌렀을 때
function monthPrevious(year, month) {
	$("#table1").css("display", "inline-block");
	$("#table2").css("display", "none");
	
	var monthDate = monthChange(month);
	
	// input 값 맞추기
	$("#startDate").val(year + "-" + monthDate + "-");
	$("#endDate").val(year + "-" + monthDate + "-");
}

// 다음 달 눌렀을 때
function monthNext(year, month){
	$("#table1").css("display", "none");
	$("#table2").css("display", "inline-block");
	
	var monthDate = monthChange(month);
	
	// input 값 맞추기
	if(firstCheck == true){
		$("#endDate").val(year + "-" + monthDate + "-");
	}else{
		$("#startDate").val(year + "-" + monthDate + "-");
		$("#endDate").val(year + "-" + monthDate + "-");
	}
}

// 날짜 클릭 했을 때
function dateClick(i, year, month) {
	if (reCheck == true) {
		
		// td 색깔 초기화
		$("td").css("background-color", "#F2F2F2");
		reCheck = false;
		
		var monthDate = monthChange(month);
		
		// 다시 클릭시 초기화
		$("#startDate").val(year + "-" + monthDate + "-");
		$("#endDate").val(year + "-" + monthDate + "-");

		first = i;
		// 처음 클릭
		firstCheck = false;

		// 예약하러가기 disable
		$("#reservation").attr("disabled", true);

	}
	
	// 처음 날짜 선택할 때
	if (firstCheck == false) {
		// 선택자에 변수넣기
		$("#date" + i).css("background-color", "green");
		firstCheck = true;
		first = i;
	} else {
		// 전 날짜 클릭 했을 때
		if (first >= i) {
			$("#date" + first).css("background-color", "#F2F2F2");
			$("#date" + i).css("background-color", "green");
			first = i;
			
		} else {
			// 끝날짜 정해짐
			for (var j = first; j <= i; j++) {
				$("#date" + j).css("background-color", "green");
			}
			
			reCheck = true;
			last = i;

			// 예약하러가기 풀기
			$("#reservation").attr("disabled", false);
		}
	}
}

// 10월 달 이전 변환
function monthChange(month){
	var monthStr = month
	if(month < 10){
		monthStr = "0" + month;
	}
	
	return monthStr;
}