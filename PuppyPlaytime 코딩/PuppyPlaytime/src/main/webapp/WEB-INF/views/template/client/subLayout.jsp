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
		<header class="navbar navbar-expand-lg navbar-light bg-light">
			<!-- Fixed navbar -->
			<!--<nav class="navbar navbar-default navbar-fixed-top"> -->
			<tiles:insertAttribute name="header"/>
		</header>
		
		
		
		<!-- Begin page content -->
		<div class="container">
			<div class="page-header">
				<div class="jumbotron">
					<h1> 노력은 배신 x</h1>
				</div>
			</div>
			<div class="bs-component">
				<div class="card border-dark mb-3">
					<h2>하하</h2>
					<p>이 편지는 영국에서 최초로 시작되어 일년에 한바퀴 돌면서 받는 사람에게 행운을 주었고</p>
					<p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
				</div>
				<div class="card border-dark mb-3">
					<h2>히히</h2>
					<p>지금은 당신에게로 옮겨진 이 편지는 4일 안에 당신 곁을 떠나야 합니다. </p>
					<p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
				</div>
				<div class="card border-dark mb-3">
					<h2>호호</h2>
					<p>. 이 편지를 포함해서 7통을 행운이 필요한 사람에게 보내 주셔야 합니다. 복사를 해</p>
					<p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
				</div>
			</div>
		</div>
		
		<footer class="footer">
			<tiles:insertAttribute name="footer" />
		</footer>
		
	</div>
	<script src="/resources/include/dist/js/bootstrap.min.js"></script>
</body>
</html>