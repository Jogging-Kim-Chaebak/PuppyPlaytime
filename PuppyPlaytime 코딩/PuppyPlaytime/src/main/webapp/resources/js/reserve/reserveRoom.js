function lik(c_no){
	$("#c_no").val(c_no);
	
	$("#dateForm").attr({
		"action" : "/client/reserve/reserveDetail",
		"method" : "get"
	});
	$("#dateForm").submit();
}