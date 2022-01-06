function reservationDetail(c_no){
	$("#c_no").val(c_no);

	$("#dateCageForm").attr({
		"action" : "/client/reserve/reserveDetailForm",
		"method" : "post"
	});
	$("#dateCageForm").submit();
}

function reservationRoom(idx){
	$("#page").val(idx);
	
	$("#dateCageForm").attr({
		"action" : "/client/reserve/reserveRoom",
		"method" : "post"
	});
	$("#dateCageForm").submit();
}