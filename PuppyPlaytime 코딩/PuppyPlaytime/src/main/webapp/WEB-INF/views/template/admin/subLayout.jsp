<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><tiles:getAsString name="title"/></title>
<!-- Bootstrap core CSS -->
<link href="/resources/include/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/resources/include/dist/css/sticky-footer-navbar.css" rel="stylesheet"> 
<link href="/resources/css/main.css" rel="stylesheet">

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>

</head>
<body>
	<div class="wrapper">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<!-- Fixed navbar -->
			<!--<nav class="navbar navbar-default navbar-fixed-top"> -->
			<tiles:insertAttribute name="header"/>
		</nav>
		
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<!-- Fixed navbar -->
			<!--<nav class="navbar navbar-default navbar-fixed-top"> -->
			<tiles:insertAttribute name="menu"/>
		</nav>
		
		<!-- Begin page content -->
		<div class="container">
			<div class="page-header">
				<h1><tiles:getAsString name="title"/></h1>
			</div>
			<tiles:insertAttribute name="body" />
		</div>
		
		
	</div>
	<script src="/resources/include/dist/js/bootstrap.min.js"></script>
</body>
</html>