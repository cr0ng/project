<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title> itcha</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="/project/assets/img/favicon.ico">

    <!-- CSS here -->
    <link rel="stylesheet" type="text/css" href="/project/css/w3.css">
	<link rel="stylesheet" type="text/css" href="/project/css/user.css">
    <link rel="stylesheet" href="/project/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/project/assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/project/assets/css/slicknav.css">
    <link rel="stylesheet" href="/project/assets/css/flaticon.css">
    <link rel="stylesheet" href="/project/assets/css/progressbar_barfiller.css">
    <link rel="stylesheet" href="/project/assets/css/gijgo.css">
    <link rel="stylesheet" href="/project/assets/css/animate.min.css">
    <link rel="stylesheet" href="/project/assets/css/animated-headline.css">
    <link rel="stylesheet" href="/project/assets/css/magnific-popup.css">
    <link rel="stylesheet" href="/project/assets/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="/project/assets/css/themify-icons.css">
    <link rel="stylesheet" href="/project/assets/css/slick.css">
    <link rel="stylesheet" href="/project/assets/css/nice-select.css">
    <link rel="stylesheet" href="/project/assets/css/style.css">
    <link rel="stylesheet" type="text/css" href="/project/css/w3.css">
    <script type="text/javascript" src="/project/assets/js/jquery-3.6.0.min.js"></script>

<style type="text/css">	
	.single-input{
		margin-top : 10px;
		margin-bottom : 20px;
	}
	
	.profile{
		display:inline-block;
		background-color ::#23a3a7;
		color : white;
		cursor:pointer;
		
	}
	#title{
		margin-left: 10px;
	}
	
	.button{
		  background-color: white;
 		  color: black;
  		  border: 2px solid #E6E6FA;
  		  width: 33%;
  		  font-weight : bold;
  		  font-size : 15pt;
  		  color : grey;
	}
	
	.button:hover {
		background-color: #E6E6FA;
	}
	
	input:nth-child(2){
		float:right;
	}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$('#dbtn').click(function(){
			$('#lfrm').attr('action', '/project/notice/noticeDel.proj');
			$('#lfrm').submit();
		});
		
		$('#nbtn').click(function(){
			$(location).attr('href', '/project/notice/noticeList.proj');
		});
		
		$('#rbtn').click(function(){
			document.efrm.reset();
		});
		
		
		$('#sbtn').click(function(){
			// 데이터 유효성 검사
			var notice_title = $('#notice_title').val();
			var content = $('#content').val();
			content = content.replace('\r\n', '<br>');
			if(notice_title == '${DATA.notice_title}'){
				// 타이틀 수정이 안된경우
				$('#notice_title').prop('disabled', true);
			}
			if(content == '${DATA.content}'){
				// 본문 수정이 안된 경우
				$('#content').prop('disabled', true);
			}
			
			var result = confirm('공지사항을 등록할까요?');
			if(result){
				$('#efrm').submit();
			}
		});
		
		$('#outbtn').click(function(){
			$(location).attr('href','/project/member/logout.proj');
		});
	});

</script>
</head>
<body>
 <!-- ? Preloader Start -->
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
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
                                                <li><a href="/project/movielist.proj">모든 영화</a></li>
                                                <li><a href="/project/main.proj">검색</a></li>
                                                <li><a href="/project/survey/surveyList.proj">설문조사</a></li>
                                            </ul>
                                        </nav>
                                    </div>
                                    <!-- Header-btn -->
                                      <div class="header-right-btn d-none d-lg-block ml-65">
                                        <a href="/project/member/myPage.proj" class="border-btn" id="mbtn" >마이페이지</a>
                                    </div>
                                    <div class="header-right-btn d-none d-lg-block ml-65">
                                        <div class="border-btn" id="outbtn" >로그아웃</div>
                                    </div>
                                  </div>
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
                                    <h1 data-animation="bounceIn" data-delay="0.2s">게시글 수정</h1>
                                </div>
                            </div>
                        </div>
                    </div>          
                </div>
            </div>
        </section>
        <div class="faq-section section-padding40" >
            <div class="container">

                <div class="row justify-content-center">
                    <div class="col-lg-8">
                       
                        <div class="container">
        <form method="POST" action="/project/notice/noticeList.proj" name="lfrm" id="lfrm" >
        	<input type="hidden" name="nowPage" id="nowPage" value="${param.nowPage}">
        	<input type="hidden" name="notice_no" value="${DATA.notice_no}">
        	<input type="hidden" name="mno" value="${DATA.mno}">
        </form>
			
		<div class="w3-content mxw700 w3-margin-top w3-padding">
			<!-- form 태그 -->
			<form method="POST" action="/project/notice/noticeEditProc.proj" name="efrm" id="efrm"
				class="w3-col w3-padding w3-margin-bottom w3-card-4">
			
	        	<input type="hidden" name="nowPage" value="${param.nowPage}">
	        	<input type="hidden" name="notice_no" id="notice_no" value="${DATA.notice_no}">
	        	<input type="hidden" name="mno" id="mno" value="${DATA.mno}">
				
				<div class="w3-col w3-margin-top pdb10 w3-border-bottom w3-border-light-grey">
					<label for="title" class="w3-col w150 w3-center w3-text-grey ft14">글제목</label>
					<div class="w3-rest pdr30">
						<input type="text" name="notice_title" id="notice_title" class="w3-rest w3-input w3-round w3-border"
																placeholder="글제목 입력!" value="${DATA.notice_title}">
					</div>
				</div>
				<div class="w3-col w3-margin-top w3-margin-bottom pdb10 w3-bordder-bottom w3-border-light-grey">
					<label for="body" class="w3-col w150 w3-center w3-text-grey ft14">글내용</label>
					<div class="w3-rest pdr30">
						<textarea name="content" id="content" rows="7"
								class="w3-col w3-input w3-round w3-border noresize" placeholder="글내용 입력!">${DATA.content}</textarea>
					</div>
				</div>
			</form>
			
			<!-- 버튼 태그 -->
			<div class="w3-col w3-margin-top w3-card-4">
				<div class="w3-quarter w3-red w3-hover-pink w3-button" id="dbtn">delete</div>
				<div class="w3-quarter w3-blue w3-hover-pink w3-button" id="nbtn">Notice</div>
				<div class="w3-quarter w3-deep-purple w3-hover-pink w3-button" id="rbrn">reset</div>
				<div class="w3-quarter w3-orange w3-hover-red w3-button" id="sbtn">submit</div>
			</div>
		</div>
			
</div>
                        
                    </div>
                </div>
            </div>
        </div>		
		
			
    </main>
    
    <footer>
     <div class="footer-wrappper section-bg" data-background="/project/assets/img/gallery/footer-bg.png">
        <!-- footer-bottom area -->
        <div class="footer-bottom-area">
            <div class="container">
                <div class="footer-border">
                    <div class="row d-flex align-items-center">
                        <div class="col-xl-12 ">
                            <div class="footer-copy-right text-center">
                                <p>3조 곽채원 김유진 최태현 윤건우</p>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
          <!-- Footer End-->
      </div>
  </footer>

  <!-- Scroll Up -->
  <div id="back-top" >
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
<!-- Progress -->
<script src="/project/assets/js/jquery.barfiller.js"></script>

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