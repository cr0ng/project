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
    <link rel="manifest" href="site.webmanifest">
    <link rel="shortcut icon" type="image/x-icon" href="/project/assets/img/favicon.ico">

    <!-- CSS here -->
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
		
		$('#user_id').focusout(function(){
			var reid = RegExp(/^[a-z0-9]{3,15}/);
			
			if(reid.test($('#nickname').val())){
				$('#error2').hide();
			} else {
				$('#error2').show();
			}
		});
		$('#user_name').focusout(function(){
			var rename = RegExp(/^[a-z0-9]{3,15}/);
			
			if(reName.test($('#nickname').val())){
				$('#error3').hide();
			} else {
				$('#error3').show();
			}
		});
		// 닉네임 정규식
		$('#nickname').focusout(function(){
			var regName = RegExp(/^[a-z0-9]{3,15}/);
			
			if(regName.test($('#nickname').val())){
				$('#error4').hide();
			} else {
				$('#error4').show();
			}
		});
		
		// 비번 정규식
		$('#user_pw').focusout(function(){
			var spw = RegExp(/^[a-zA-Z0-9!_+%*]{5,20}$/);
			
			if(spw.test($('#user_pw').val())){
				$('#error5').hide();
			} else
				$('#error5').show();
		});
		
		// 비번 일치 확인
		$('#repw').focusout(function(){
			if($('#repw').val() === $('#user_pw').val()){
				$('#error6').hide();
			} else
				$('#error6').show();
		});
		
		// 메일 정규식
		$('#email').focusout(function(){
			var smail = /^[a-zA-Z][a-zA-Z0-9#!*_]{1,14}\@[a-z]{2,15}\.[a-z]{2,3}([a-z]{2})?$/;
			
			if(smail.test($('#email').val())){
				$('#error7').hide();
			} else
				$('#error7').show();
		});

		$('#sbtn').click(function(){
			var result = confirm('수정작업을 진행할까요?');
			if(result){
				console.log('submit');
				$('#frm').submit();			
			}
		});
		
		$('#mbtn').click(function(){
			$(location).attr('href', 'http://localhost/project/member/myPage.proj');
		});
		
	})

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
                                            </ul>
                                        </nav>
                                    </div>
                                    <div class="header-right-btn d-none d-lg-block ml-65">
                                        <a href="/project/member/myPage.proj" class="border-btn">마이페이지</a>
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
                                    <h1 data-animation="bounceIn" data-delay="0.2s">내 정보 수정</h1>
                                </div>
                            </div>
                        </div>
                    </div>          
                </div>
            </div>
        </section>
        <div class ="container" id="con" style="margin-top :50px; margin-bottom: 50px " >
	        <form method="POST" action="/project/member/editInfoProc.proj" name="frm" id="frm">
				
				<div class="mt-10">
					<span id="title" >USER_id : </span>
					<input type="text" name="user_id" id="user_id" class="single-input">
					<div class="error" id="error2" style="display:none ">${DATA.user_id}</div>
				</div>
				<div class="mt-10">
				<span id="title" >USER_NAME : </span>
					<input type="text" name="user_name" id="user_name" class="single-input">
					<div class="error" id="error3" style="display:none ">${DATA.user_name}</div>
				</div>
				<div class="mt-10">
				<span id="title" >NICKNAME : </span>
					<input type="text" name="nickname" id="nickname" class="single-input">
					<div class="error" id="error4" style="display:none ">${DATA.nickname}</div>
				</div>
				<div class="mt-10">
				<span id="title" >PASSWORD : </span>
					<input type="password" name="user_pw" id = "user_pw" placeholder="비밀번호를 입력해주세요!"  class="single-input">
					<div class="error" id="error5" style="display:none ">대소문자,숫자,특수문자(!_+%*) 5~20글자</div>
				</div>
				<div class="mt-10">
					<span id="title" >PASSWORD CHECK: </span>
					<input type="password" name="repw" id="repw" placeholder="다시한번 비밀번호를 입력해주세요!" class="single-input">
					<div class="error" id="error6" style="display:none ">비밀번호가 일치하지 않습니다.</div>
				</div>
				<div class="mt-10">
					<span id="title" >EMAIL : </span>
					<input type="text" name="email" id="email" class="single-input">
					<div class="error" id="error7" style="display:none ">${DATA.email}</div>
				</div>
				<div class="mt-10">
					<input class="w3-radio" type="radio" name="gender" value="M" checked>
					<label>남성</label>
					
					<input class="w3-radio" type="radio" name="gender" value="F">
					<label>여성</label>
				</div>
				<div class="mt-10">
					<span id="title" >AGE : </span>
					<input type="text" name="age" id="age" class="single-input" value="${DATA.age}">
				</div>
				
				<div class="mt-10">
					<input type="button" class="button" id="mbtn" value="마이페이지">
					<input type="button" class="button" id="sbtn" value="수정하기">
				</div>
			</form>
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