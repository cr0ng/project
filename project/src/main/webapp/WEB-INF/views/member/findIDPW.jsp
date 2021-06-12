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
   <!--  <link rel="manifest" href="site.webmanifest"> -->
    <link rel="shortcut icon" type="image/x-icon" href="/project/assets/img/favicon.ico">
	<link rel="stylesheet" type="text/css" href="/project/css/w3.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
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
    <script type="text/javascript" src="/project/assets/js/jquery-3.6.0.min.js"></script>
    
    <style type="text/css">
		.single-input{
			margin-bottom : 10px;
		}
		
		.button{
		  background-color: white;
 		  color: black;
  		  border: 2px solid #E6E6FA;
  		  width: 250px;
  		  font-weight : bold;
  		  font-size : 15pt;
  		  color : grey;
		}
		
		.button:hover {
			background-color: #E6E6FA;
		}
		
		.tell{
			margin-top : 30px;
			font-size:20pt;
			font-weight : bold;
			<%--display:none--%>
		}
	</style>
	
	<script type="text/javascript">
	$(document).ready(function(){
		$('#findID').click(function(){
			var sname = $(document.frm1.name).val();
			var smail1 = $(document.frm1.mail1).val();
			
			if(!(sname && smail1)){
				alert('모두 입력해주세요!');
				return;
			}
			$(location).attr('href','/project/member/findID.proj');

			$('#frm1').submit();
			
		});
		
		$('#findPW').click(function(){
			
			var sid = $(document.frm2.id).val();
			var smail2 = $(document.frm2.mail2).val();
			
			if(!(sid && smail2)){
				alert('모두 입력해주세요!');
				return;
			}
			$(location).attr('href','/project/member/findPW.proj');
			
			$('#frm2').submit(); 
			
			
			/*
			$.ajax({
					url : "/member/findPW",
					type : "POST",
					data : {
							sid : $('#id').val(),
							smail : $('#mail').val()
					},
					success : function(result){
						alert(result);
					},
			})
			*/
			
		});
		
		$('#lbtn').click(function(){
			$(location).attr('href','/project/member/login.proj');
			
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
                                    <a href="main.project">itcha</a>
                                </div>
                            </div>
                            <div class="col-xl-10 col-lg-10">
                                <div class="menu-wrapper  d-flex align-items-center justify-content-end">
                                    <!-- Main-menu -->
                                    <div class="main-menu d-none d-lg-block">
                                        <nav>
                                            <ul id="navigation">                                                                                          
                                                <li><a href="movielist.project">모든 영화</a></li>
                                                <li><a href="main.project">검색</a></li>
                                            </ul>
                                        </nav>
                                    </div>
                                    <!-- Header-btn -->
                                    <div class="header-right-btn d-none d-lg-block ml-65">
                                        <a href="myPage.project" class="border-btn">마이페이지</a>
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
									<h1 data-animation="bounceIn" data-delay="0.2s">회원계정 찾기</h1>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!--? Our Services Start -->


		<main class="login-body" data-vide-bg="/project/assets/img/login-bg.mp4">
			<!-- Login Admin -->
			<div class="section-top-border">
				<div class="row">
					<div class="col-md-3"></div>
					<div class="col-md-6">
						<div class="row">

							<div class="col-md-6">
								<form class="form-default" action="/project/member/findIDProc.proj" method="POST" name="frm1" id="frm1">
									<div class="col text-center">
										<h2>아이디찾기</h2>
										<div class="mt-10">
												<input type="text" name="user_name" id="name" placeholder="이름을 입력하세요" class="single-input">
												<input type="text" name="email" id="mail1" placeholder="메일을 입력하세요" class="single-input">
											</div>
										 <input	type="button" class="button" id="findID" value="확인">
			                        </div>
								</form>
							</div>
							<div class="col-md-6">
								<form class="form-default" action="/project/member/updatePWProc.proj" method="POST" name="frm2" id="frm2">

									<div class="container">
										<div class="col text-center">
											<h2>비밀번호찾기</h2>
											<div class="mt-10">
												<input type="text" name="user_id" id="id" placeholder="아이디를 입력하세요" class="single-input">
												<input type="text" name="email" id="mail2" placeholder="메일을 입력하세요" class="single-input">
											</div>
											<input type="button" class="button" id="findPW" value="확인">
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
						<div class="w3-col w3-margin-top w3-center">
							<input type="button" class="button" id="lbtn" value="로그인하기">
						</div>
			</div>
			<!-- /end login form -->
		</main>
        
    </main>
  <!-- Scroll Up -->
  <div id="back-top" >
    <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
</div>
 
    <footer>
     <div class="footer-wrappper section-bg" data-background="/project/assets/img/gallery/footer-bg.png">
        <!-- footer-bottom area -->
        <div class="footer-bottom-area">
            <div class="container">
                <div class="footer-border">
                    <div class="row d-flex align-items-center">
                        <div class="col-xl-12 ">
                            <div class="footer-copy-right text-center">
                                <p>3조 곽채원 김유진 최태현 윤건우 신현식</p>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
              
          </div>
          <!-- Footer End-->
      </div>
  </footer>
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