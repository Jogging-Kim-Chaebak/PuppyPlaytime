function reservationDetail(c_no){
	$("#c_no").val(c_no);

	$("#dateCageForm").attr({
		"action" : "/client/reserve/reserveDetailForm",
		"method" : "post"
	});
	$("#dateCageForm").submit();
}