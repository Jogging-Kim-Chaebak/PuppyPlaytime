<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통계</title>
</head>
<body>
<div class="tab-content">
	<div id="adminJoinStatistics" class="container tab-pane active">
		<img src="/graph/barJoinChart.jpg" class="img-thumbnail" />
	</div>	
	<div id="adminReservationStatistics" class="container tab-pane fade">
		<img src="/graph/barReservationChart.jpg" class="img-thumbnail" />
	</div>
	<div id="adminSalesStatistics" class="container tab-pane fade">
		<img src="/graph/barSalesChart.jpg" class="img-thumbnail" />
	</div>
</div>
</body>
</html>