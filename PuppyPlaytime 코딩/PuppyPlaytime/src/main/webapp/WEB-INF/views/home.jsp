<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
 
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
	      <img src="/resources/images/poppy.jpg" alt="Los Angeles" class="d-block" style="width:100%">
	      <div class="carousel-caption">
	        <h1>Puppy Playtime</h1>
	        <p>We had such a great time in premium hotel</p>
	      </div>
	    </div>
	    <div class="carousel-item">
	      <img src="/resources/images/puppy1.jpg" alt="Chicago" class="d-block" style="width:100%">
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
			<div class="col-sm-4">
				<h2>About Me</h2>
				<h5>Photo of me:</h5>
				<div class="fakeimg">Fake Image</div>
				<p>Some text about me in culpa qui officia deserunt mollit
					anim..</p>
				<h3 class="mt-4">Some Links</h3>
				<p>Lorem ipsum dolor sit ame.</p>
				<ul class="nav nav-pills flex-column">
					<li class="nav-item"><a class="nav-link active" href="client/notice/noticeList">공지사항</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">이용안내</a></li>
					<li class="nav-item"><a class="nav-link" href="#">문의게시판</a></li>
					<li class="nav-item"><a class="nav-link" href="#">예약하기</a>
					</li>
				</ul>
				<hr class="d-sm-none">
			</div>
			<div class="col-sm-8">
				<h2>TITLE HEADING</h2>
				<h5>Title description, Dec 7, 2020</h5>
				<div class="fakeimg">Fake Image</div>
				<p>Some text..</p>
				<p>Sunt in culpa qui officia deserunt mollit anim id est laborum
					consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
					labore et dolore magna aliqua. Ut enim ad minim veniam, quis
					nostrud exercitation ullamco.</p>

				<h2 class="mt-5">TITLE HEADING</h2>
				<h5>Title description, Sep 2, 2020</h5>
				<div class="fakeimg">Fake Image</div>
				<p>Some text..</p>
				<p>Sunt in culpa qui officia deserunt mollit anim id est laborum
					consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
					labore et dolore magna aliqua. Ut enim ad minim veniam, quis
					nostrud exercitation ullamco.</p>
			</div>
		</div>
	</div>

