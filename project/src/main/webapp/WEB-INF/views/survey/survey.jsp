<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title> App landing | Template</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="/project/assets/assets/img/favicon.ico">

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
    <script type="text/javascript" src="/project/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="/project/js/w3color.js"></script>
    
	<script type="text/javascript">
	$(document).ready(function() {
		$('#hbtn').click(function(){
			$(location).attr('href', '/project/main.proj');
		});
		
		$('#lbtn').click(function(){
			$(location).attr('href', '/project/survey/surveyList.proj');
		})
		
		$('#rbtn').click(function(){
			document.frm.reset();
		});
		
		$('#sbtn').click(function(){
			// 만들어진 문제의 갯수 꺼내고
			var len = ${LEN};
			
			// 선택한 라디오버튼의 갯수꺼내고
			var el = $('[type="radio"]:checked');
			if(len != el.length){
				// 선택하지 않은 문항있는경우
				alert('*** 선택하지 않은 문항이 있습니다. ***');
				return;
			}
			// 제출 버튼 클릭 순간 선택된 태그들만 checkbox로 변경
			// name 값을 qnolist로 변경
			$('[type="radio"]:checked').attr('type', 'checkbox').attr('name', 'qnolist');
			
			$('#frm').submit();
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
                                                <li><a href="/project/features.proj">모든 영화</a></li>
                                                <li><a href="/project/main.proj">검색</a></li>
                                            </ul>
                                        </nav>
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
                                    <h1 data-animation="bounceIn" data-delay="0.2s">설문조사</h1>
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
			<!-- 데이터 -->
    <form method="POST" action="/project/survey/surveyProc.proj" id="frm" name="frm">
		<input type="hidden" name="user_id" value="${SID}">
		
		<div class="w3-content mxw750 w3-margin-top">
			<h1 class="w3-blue w3-padding w3-center w3-margin-top">${TITLE}</h1>
			<div class="w3-col w3-margin-top w3-padding">
	<c:forEach var="data" items="${LIST}" varStatus="st">
				<div class="w3-margin-top w3-padding">
					<h3 class="" id="${data.qno}">${st.count}. ${data.body}</h3>
					<div class="pdl50">
			<c:forEach var="sub" items="${data.list}">
						<h5 class="">
							${sub.exno}) 
							<span>
								<input type="radio" name="${data.qno}" value="${sub.qno}">
							</span> 
							${sub.ex}
						</h5>
			</c:forEach>
					</div>
				</div>
	</c:forEach>
	
			</div>
			
			<!-- 버튼 만들기 -->
			<div class="w3-col w3-margin-top w3-margin-bottom w3-card-4">
				<div class="w3-quarter w3-button w3-green" id="hbtn">home</div>
				<div class="w3-quarter w3-button w3-blue" id="lbtn">설문조사</div>
				<div class="w3-quarter w3-button w3-purple" id="rbtn">reset</div>
				<div class="w3-quarter w3-button w3-orange" id="sbtn">제출</div>
			</div>
		</div>
    </form>
	
	
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