<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true"%>
<style>
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);

nav .navbar-nav li a {
	font-family: 'Hanna', sans-serif;
	font-size: 20px;
}
</style>

<div class="container">
	<a class="navbar-brand" href="/"> <img
		src="/resources/images/logo.png" width=100px height=55px>
	</a>
	<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
		data-bs-target="#navbarColor03" aria-controls="navbarColor03"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div
		class="collapse navbar-collapse justify-content-end align-self-end"
		id="navbarColor03">
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="/client/login/login">로그인&nbsp;&nbsp;</a>
			</li>
			<li class="nav-item"><a class="nav-link" href="#">마이페이지&nbsp;&nbsp;</a>
			</li>
			<li class="nav-item"><a class="nav-link" href="#">이용안내&nbsp;&nbsp;</a>
			</li>
			<li class="nav-item"><a class="nav-link" href="/client/reserve/reserveCalendar">예약하기&nbsp;&nbsp;</a>
			</li>
			<li class="nav-item"><a class="nav-link" href="#">고객센터&nbsp;&nbsp;</a>
			</li>
		</ul>
	</div>
</div>