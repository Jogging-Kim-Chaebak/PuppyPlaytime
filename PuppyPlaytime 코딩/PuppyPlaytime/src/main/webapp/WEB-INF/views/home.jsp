<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!-- Carousel -->
<div id="demo" class="carousel slide" data-bs-ride="carousel">
	<!-- Indicators/dots -->
	<div class="carousel-indicators">
		<button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
	 	<button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>  
	</div>
	  
	  <!-- The slideshow/carousel -->
	  <div class="carousel-inner">
	    <div class="carousel-item active">
	      <img src="/resources/images/poppy.jpg" alt="Pet Hotel" class="d-block" style="width:100%; height: 720px">
	      <div class="carousel-caption">
	        <h1>Puppy Playtime</h1>
	        <p>We had such a great time in premium hotel</p>
	      </div>
	    </div>
	    <div class="carousel-item">
	      <img src="/resources/images/puppy1.jpg" alt="Pet" class="d-block" style="width:100%; height: 720px">
	      <div class="carousel-caption">
	        <h3>Relaxing Hotel</h3>
	        <p>Always we are together with your important pets</p>
	      </div> 
	    </div>
	  
	  </div>
	  
	  <!-- Left and right controls/icons -->
	  <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
	    <span class="carousel-control-prev-icon"></span>
	  </button>
	  <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
	    <span class="carousel-control-next-icon"></span>
	  </button>
	</div>
	
	<div class="container mt-5">
		<div class="row">
			<div class="col-sm-6 col-md-6">
				<c:if test="${!empty notice1}">
					<h2>공지사항 #1</h2>
					<h5>${notice1.n_regdate}</h5>
					<p>${notice1.n_title }</p>
					<p>${notice1.n_content }</p>
				</c:if>
			</div>
			<div class="col-sm-6 offset-sm-2 col-md-6 offset-md-0">
				<c:if test="${!empty notice2}">
					<h2>공지사항 #2</h2>
					<h5>${notice2.n_regdate}</h5>
					<p>${notice2.n_title }</p>
					<p>${notice2.n_content }</p>
				</c:if>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-6 col-md-5 col-lg-6">
				<h2>룸사진 #1</h2>
				<c:if test="${!empty cageroom1}">
					<c:choose>
						<c:when test="${cageroom1.c_kind eq 'small' }">
							<h4>소형&nbsp;${cageroom1.c_type }</h4>
						</c:when>
						<c:when test="${cageroom1.c_kind eq 'middle' }">
							<h4>중형&nbsp;${cageroom1.c_type }</h4>
						</c:when>
						<c:when test="${cageroom1.c_kind eq 'big' }">
							<h4>대형&nbsp;${cageroom1.c_type }</h4>
						</c:when>
					</c:choose>
					
					<c:if test="${empty cageroom1.c_picture}">
						<td colspan="3" align="center">등록된 사진 정보가 존재하지 않습니다.</td>
					</c:if>
					<td colspan="3"><img src="/image/roomImages/${cageroom1.c_picture}" width="520" height="250"/></td>
				</c:if>
			</div>

			<div class="col-sm-6 col-md-5 offset-md-2 col-lg-6 offset-lg-0">
				<h2>룸사진 #2</h2>
				<c:if test="${!empty cageroom2}">
					<c:choose>
						<c:when test="${cageroom2.c_kind eq 'small' }">
							<h4>소형&nbsp;${cageroom2.c_type }</h4>
						</c:when>
						<c:when test="${cageroom2.c_kind eq 'middle' }">
							<h4>중형&nbsp;${cageroom2.c_type }</h4>
						</c:when>
						<c:when test="${cageroom2.c_kind eq 'big' }">
							<h4>대형&nbsp;${cageroom2.c_type }</h4>
						</c:when>
					</c:choose>
						
					<c:if test="${empty cageroom2.c_picture}">
						<td colspan="3" align="center">등록된 사진 정보가 존재하지 않습니다.</td>
					</c:if>
					<td colspan="3"><img src="/image/roomImages/${cageroom2.c_picture}" width="520" height="250"/></td>
				</c:if>
			</div>
		</div>
		<br>
		<br>
		<br>
		<br>
		<div>
			<ul class="nav nav-pills justify-content-center">
				<li class="nav-item"><a class="nav-link active" href="client/notice/noticeList">아아아</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="#">이용안내</a></li>
				<li class="nav-item"><a class="nav-link" href="#">문의게시판</a></li>
				<li class="nav-item"><a class="nav-link" href="#">예약하기</a>
				</li>
			</ul>
			<hr class="d-sm-none">
		</div>
	</div>

