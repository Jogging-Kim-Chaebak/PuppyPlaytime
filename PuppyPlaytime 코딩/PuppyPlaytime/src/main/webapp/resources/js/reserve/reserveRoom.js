function reservationDetail(c_no, weight, kind){
	var weightNum;
	var kindNum;
	
	switch(weight){
		case 'small':
		weightNum = 1;
		break;
		case 'middle':
		weightNum = 2;
		break;
		case 'big':
		weightNum = 3;
		break;
	}
	
	switch(kind){
		case 'small':
		kindNum = 1;
		break;
		case 'middle':
		kindNum = 2;
		break;
		case 'big':
		kindNum = 3;
		break;
	}
	
	if(weightNum > kindNum){
		switch(weight){
			case 'small':
			weight = '소형';
			break;
			case 'middle':
			weight = '중형';
			break;
			case 'big':
			weight = '대형';
			break;
		}
		
		switch(kind){
			case 'small':
			kind = '소형';
			break;
			case 'middle':
			kind = '중형';
			break;
			case 'big':
			kind = '대형';
			break;
		}
		
		alert(kind+"방은 " + weight + " 체급이 이용하실 수 없습니다.");
	}else{
		$("#c_no").val(c_no);
	
		$("#dateCageForm").attr({
		"action" : "/client/reserve/reserveDetailForm",
		"method" : "post"
		});
		$("#dateCageForm").submit();
	}
}

function reservationRoom(idx){
	$("#page").val(idx);
	
	$("#dateCageForm").attr({
		"action" : "/client/reserve/reserveRoom",
		"method" : "post"
	});
	$("#dateCageForm").submit();
}