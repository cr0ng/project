<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>ITCHA</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon" href="/project/assets/img/favicon.ico">
<link rel="stylesheet" type="text/css" href="/project/css/w3.css">
<link rel="stylesheet" type="text/css" href="/project/css/user.css">


<!-- CSS here -->
<link rel="stylesheet" href="/project/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="/project/assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="/project/assets/css/slicknav.css">
<link rel="stylesheet" href="/project/assets/css/animate.min.css">
<link rel="stylesheet" href="/project/assets/css/hamburgers.min.css">
<link rel="stylesheet" href="/project/assets/css/magnific-popup.css">
<link rel="stylesheet" href="/project/assets/css/fontawesome-all.min.css">
<link rel="stylesheet" href="/project/assets/css/themify-icons.css">
<link rel="stylesheet" href="/project/assets/css/slick.css">
<link rel="stylesheet" href="/project/assets/css/nice-select.css">
<link rel="stylesheet" href="/project/assets/css/style.css">

<script type="text/javascript" src="/project/assets/js/jquery-3.6.0.min.js"></script>
<style type="text/css">
	#img{
		width: 100%;
		height: auto;
	}
	.dir {
		font-weight: bolder;
	}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$('#outbtn').click(function(){
			$(location).attr('href','http://localhost/project/member/logout.proj');
		});
		
		$('#wbtn').click(function(){
			// 입력된 데이터 읽고 
			var content = $('#content').val();
			if(!(content)){
				// 입력할 태그가 비어있는 경우 
				alert('# 내용을 입력하세요!');
				return;
			}
			$('#wfrm').submit();
		});
		
		$('.gbtn').click(function(){
			var gno = $(this).attr('id').substring(3);
			alert('############ ' + gno);
			$('#gno').val(gno);
			$('#gnum').val(gno);
			$('#frm').attr('action', '/project/movie/genreList.proj');
			$('#frm').submit();
		});
		
		$('.modalModBtn').click(function(){
			
			var review_text = $('#review_text').val();
			
			if(!review_text){
				alert('내용을 입력하세요');
				return;
			}
			
			$('#efrm').submit();
		});
	
	});
</script>
</head>

<body>

	<form method="POST" action="/project/movie/movieList.proj" id="frm" name="frm">
		<input type="hidden" name="nowPage" id="nowPage" value="${nowPage}">
		<input type="hidden" name="mno" id="mno" value="${DATA.mno}">
		<input type="hidden" name="gno" id="gno" value="0"> <!-- 글번호 전송용태그 -->
		<input type="hidden" name="gnum" id="gnum" value="0"> <!-- 글번호 전송용태그 -->
	</form>

	<!--? Preloader Start -->
	<div id="preloader-active">
		<div
			class="preloader d-flex align-items-center justify-content-center">
			<div class="preloader-inner position-relative">
				<div class="preloader-circle"></div>
				<div class="preloader-img pere-text">
					<img src="/project/assets/img/logo/loder.png" alt="">
				</div>
			</div>
		</div>
	</div>
	<!-- Preloader Start -->
	<header>
		<!-- Header Start -->
		<div class="header-area header-transparent">
			<div class="main-header ">
				<div class="header-bottom  header-sticky">
					<div class="container-fluid">
						<div class="row align-items-center">
							<!-- Logo -->
							<div class="col-xl-2 col-lg-2">
								<div class="logo">
									<a href="/project/main.proj">itcha</a>
								</div>
							</div>
							<div class="col-xl-10 col-lg-10">
								<div class="menu-wrapper  d-flex align-items-center justify-content-end">
									<!-- Main-menu -->
									<div class="main-menu d-none d-lg-block">
										<nav>
											<ul id="navigation">
												 <li><a href="movieList.proj">모든 영화</a></li>
                                                <li><a href="/project/main.proj">검색</a></li>
                                                <li><a href="#">공지사항</a></li>
											</ul>
										</nav>
									</div>
									<!-- Header-btn -->
									 <div class="header-right-btn d-none d-lg-block ml-65">
                                        <a href="/project/member/myPage.proj" class="border-btn">마이페이지</a>
                                    </div>
                                     <div class="header-right-btn d-none d-lg-block ml-65">
                                        <div class="border-btn" id="outbtn" >로그아웃</div>
                                    </div>
								</div>
							</div>
							<!-- Mobile Menu -->
							<div class="col-12">
								<div class="mobile_menu d-block d-lg-none"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Header End -->
	</header>
	<main>
		<!--? slider Area Start-->
		<section class="slider-area slider-area2">
			<div class="slider-active">
				<!-- Single Slider -->
				<div class="single-slider slider-height2">
					<div class="container">
						<div class="row justify-content-center">
							<div class="col-xl-8 col-lg-11 col-md-12">
								<div class="hero__caption hero__caption2 text-center">
									<h1 data-animation="bounceIn" data-delay="0.2s">Movie Information</h1>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!--? Blog Area Start -->
		<section class="blog_area single-post-area section-padding">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 posts-list">
						<div class="single-post">
							<div class="feature-img" id="${DATA.mno}">
								<img class="img-fluid" src="/project/assets/img/poster/poster${DATA.posno}.jpg" id="img" alt="">
							</div>
							<div class="blog_details">
								<h2 style="color: #2d2d2d;">${DATA.title}</h2>
								<ul class="blog-info-link mt-3 mb-4">
									<li><a href="#"><i class="fa fa-user"></i>개봉년도-${DATA.year}</a></li>
									<li><a href="#"><i class="fa fa-user"></i>장르-${DATA.genre}</a></li>
									<li><a href="#"><i class="fa fa-user"></i>러닝타임-${DATA.hour}</a></li>
									<li><a href="#"><i class="fa fa-comments"></i> 03 Comments</a></li>
								</ul>
									<c:if test="${ user_no == null }">
										추천 기능은 <button type="button" id="newLogin">
											<b class="w3-text-blue">로그인</b>
										</button> 후 사용 가능합니다.<br />
								 <a href="#"><i class="fa fa-heart"></i> 찜하기</a>
										<span class="rec_count"></span>
									</c:if>
									<c:if test="${ user_no != null }">
										<button class="w3-button w3-black w3-round" id="rec_update">
											<i class="fa fa-heart" style="font-size: 16px; color: red"></i>
											&nbsp;<span class="rec_count"></span>
										</button>
									</c:if>
							</div>
						</div>
						<div class="navigation-top">
							<div class="d-sm-flex justify-content-between text-center">
								<p class="like-info">
									<span class="align-middle"></span> 플랫폼
								</p>
								<div class="col-sm-4 text-center my-2 my-sm-0">
									<!-- <p class="comment-count"><span class="align-middle"><i class="fa fa-comment"></i></span> 06 Comments</p> -->
								</div>
								<ul class="social-icons">
									<li><a href="https://movie.naver.com/"><i class="fab fa-facebook-f"></i></a></li>
									<li><a href="https://www.netflix.com/"><i class="fab fa-twitter"></i></a></li>
									<li><a href="https://watcha.com/"><i class="fab fa-dribbble"></i></a></li>
									<li><a href="#"><i class="fab fa-behance"></i></a></li>
								</ul>
							</div>
							
							<div class="comments-area">
								<h4>줄거리</h4>
								<div class="comment-list">
									<div class="single-comment justify-content-between d-flex">
										<div class="user justify-content-between d-flex">
											<div class="desc">
												<p class="comment">${DATA.plot}</p>
											</div>
										</div>
									</div>
								</div>
							</div>

						</div>
						
						<div class="blog-author">
							<div class="media align-items-center">
								<div class="media-body">
									<h3 id="dir">감독 </h3> 
									<a href="#">
										<p>${DATA.director}</p>
									</a>
								</div>
							</div>
							<div class="media align-items-center" id="actor1">
								<div class="media-body">
										<h3>주연1 </h3> 
									<a href="#">
										<p>${DATA.actor1}</p>
									</a>
								</div>
							</div>
							<div class="media align-items-center" id="actor2">
								<div class="media-body">
										<h3>주연2 </h3> 
									<a href="#">
										<p>${DATA.actor2}</p>
									</a>
								</div>
							</div>
							<div class="media align-items-center" id="actor2">
								<div class="media-body">
										<h3>주연3 </h3> 
									<a href="#">
										<p>${DATA.actor3}</p>
									</a>
								</div>
							</div>
						</div>
						<table class="table table-stripped" id="reviews">
							<thead>
								<tr>
									<th>영화번호</th>
									<th>회원번호</th>
									<th>리뷰</th>
									<th>날짜</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="data" items="${RLIST}">
									<tr>
										<td>${data.movie_num}</td>
										<td>${data.member_num}</td>
										<td><span id="">${data.content}</span></td>
										<td>${data.write_date}</td>
								<td>
								<!--<c:if test="${SID eq data.user_id}">
								</c:if> -->
									<button type='button' class='btn btn-xs btn-success' data-toggle='modal' data-target='#modifyModal'>수정하기</button>
								</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

						<div class="comment-form">
							<h4>
								한 줄평 <a href="#"><i class="fa fa-heart"></i> 찜하기</a>
							</h4>
								<div class="form-contact comment_form" action="#" id="commentForm">
									<div class="row">
										<form method="POST" action="/project/movie/reviewWriteProc.proj" name="wfrm" id="wfrm"
												class="w3-col w3-round-large w3-card-4 w3-margin-bottom w3-padding">
											<input type="hidden" name="mno" value="${DATA.mno}">
												<div class="col-12">
													<textarea class="w3-input w3-border noresize" id="content"
														name="content" placeholder="남기고싶은 글을 작성하세요."></textarea>
												</div>
										</form>
									</div>
								</div>
							<div class="form-group">
								<button type="submit" class="button button-contactForm btn_1 boxed-btn" id="wbtn">입력</button>
							</div>
						</div>
				</div>
		
						<div class="col-lg-4">
							<div class="blog_right_sidebar">
								<aside class="single_sidebar_widget search_widget">
									<form action="#">
										<div class="form-group">
											<div class="input-group mb-3">
												<input type="text" class="form-control"
													placeholder='Search Keyword'
													onfocus="this.placeholder = ''"
													onblur="this.placeholder = 'Search Keyword'">
												<div class="input-group-append">
													<button class="btns" type="button">
														<i class="ti-search"></i>
													</button>
												</div>
											</div>
										</div>
										<button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn" id="btn-movies-find" type="submit">Search</button>
									</form>
								</aside>
								<aside class="single_sidebar_widget post_category_widget">
									<h4 class="widget_title" style="color: #2d2d2d;">장르</h4>
									<ul class="list cat-list">
										<c:forEach var="data" items="${GLIST}">
											<li><a href="#" class="inblock w150 w3-text-grey gbtn"
												id="gno${data.gno}"> <span>${data.name} [${data.cnt} ]</span>
											</a></li>
										</c:forEach>

									</ul>
								</aside>
								<aside class="single_sidebar_widget popular_post_widget">
									<h3 class="widget_title" style="color: #2d2d2d;">OST</h3>
									<div class="media post_item">
										<img src="/project/assets/img/post/post_1.png" alt="post">
										<div class="media-body">
											<a
												href="https://music.youtube.com/watch?v=FbCYcE_4VlQ&feature=share">
												<h3 style="color: #2d2d2d;">I Am Better Off</h3>
											</a>
											<p>Wildson</p>
										</div>
									</div>
									<div class="media post_item">
										<img src="/project/assets/img/post/post_2.png" alt="post">
										<div class="media-body">
											<a href="blog_details.jsp">
												<h3 style="color: #2d2d2d;">The Amazing Hubble</h3>
											</a>
											<p>02 Hours ago</p>
										</div>
									</div>
								</aside>

								<aside class="single_sidebar_widget instagram_feeds">
									<h4 class="widget_title" style="color: #2d2d2d;">Instagram
										Feeds</h4>
									<ul class="instagram_row flex-wrap">
										<li><a href="#"> <img class="img-fluid"
												src="/project/assets/img/post/post_5.png" alt="">
										</a></li>
										<li><a href="#"> <img class="img-fluid"
												src="/project/assets/img/post/post_6.png" alt="">
										</a></li>
										<li><a href="#"> <img class="img-fluid"
												src="/project/assets/img/post/post_7.png" alt="">
										</a></li>
										<li><a href="#"> <img class="img-fluid"
												src="/project/assets/img/post/post_8.png" alt="">
										</a></li>
										<li><a href="#"> <img class="img-fluid"
												src="/project/assets/img/post/post_9.png" alt="">
										</a></li>
										<li><a href="#"> <img class="img-fluid"
												src="/project/assets/img/post/post_10.png" alt="">
										</a></li>
									</ul>
								</aside>

							</div>
						</div>


					</div>
				</div>
		</section>
					<!-- modal -->
					<div class="modal fade" id="modifyModal" role="dialog">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title">리뷰 수정창</h4>
								</div>
								<div class="modal-body">
				<c:forEach var="data" items="${RLIST}">
		<form method="POST" action="/project/movie/reviewEditProc.proj" name="efrm" id="efrm"
										class="w3-col w3-round-large w3-card-4 w3-margin-bottom w3-padding">
								<div class="form-group">
									<label for="movie_no">영화 번호 </label>
									<input class="form-control" id="movie_no" name="movie_no" value="${data.movie_num}" readonly>
								</div>
								<div class="form-group">
									<label for="review_text">리뷰 내용</label> 
									<input class="form-control" id="review_text" name="review_text" value="${data.content}"
										placeholder="댓글 내용을 입력해주세요">
								</div>
								<div class="form-group">
									<label for="review_writer">리뷰 작성자</label> 
									<input class="form-control" id="review_writer" name="review_writer"  value="${data.movie_num}" readonly>
								</div>
		</form>
				</c:forEach>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default pull-left" data-dismiss="modal">닫기</button>
								<button type="submit" class="btn btn-success modalModBtn">수정</button>
								<button type="button" class="btn btn-danger modalDelBtn">삭제</button>
							</div>
						</div>
					</div>
	</main>
	
	<div id="back-top">
		<a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
	</div>

	<!-- JS here -->

	<script src="/project/assets/js/vendor/modernizr-3.5.0.min.js"></script>
	<!-- Jquery, Popper, Bootstrap -->
	<script src="/project/assets/js/vendor/jquery-1.12.4.min.js"></script>
	<script src="/project/assets/js/popper.min.js"></script>
	<script src="/project/assets/js/bootstrap.min.js"></script>
	<!-- Jquery Mobile Menu -->
	<script src="/project/assets/js/jquery.slicknav.min.js"></script>

	<!-- Jquery Slick , Owl-Carousel Plugins -->
	<script src="/project/assets/js/owl.carousel.min.js"></script>
	<script src="/project/assets/js/slick.min.js"></script>
	<!-- One Page, Animated-HeadLin -->
	<script src="/project/assets/js/wow.min.js"></script>
	<script src="/project/assets/js/animated.headline.js"></script>
	<script src="/project/assets/js/jquery.magnific-popup.js"></script>

	<!-- Date Picker -->
	<script src="/project/assets/js/gijgo.min.js"></script>
	<!-- Nice-select, sticky -->
	<script src="/project/assets/js/jquery.nice-select.min.js"></script>
	<script src="/project/assets/js/jquery.sticky.js"></script>

	<!-- counter , waypoint,Hover Direction -->
	<script src="/project/assets/js/jquery.counterup.min.js"></script>
	<script src="/project/assets/js/waypoints.min.js"></script>
	<script src="/project/assets/js/jquery.countdown.min.js"></script>
	<script src="/project/assets/js/hover-direction-snake.min.js"></script>

	<!-- contact js -->
	<script src="/project/assets/js/contact.js"></script>
	<script src="/project/assets/js/jquery.form.js"></script>
	<script src="/project/assets/js/jquery.validate.min.js"></script>
	<script src="/project/assets/js/mail-script.js"></script>
	<script src="/project/assets/js/jquery.ajaxchimp.min.js"></script>

	<!-- Jquery Plugins, main Jquery -->
	<script src="/project/assets/js/plugins.js"></script>
	<script src="/project/assets/js/main.js"></script>

</body>
</html>