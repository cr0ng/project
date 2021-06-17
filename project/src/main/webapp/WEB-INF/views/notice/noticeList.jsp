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
		
		// 페이징 처리
		$('.w3-button.pbtn').click(function(){
			var pno = $(this).html();
			
			if(pno == 'pre'){
				pno = '${PAGE.startCont - 1}';
			} else if(pno == 'next'){
				pno = '${PAGE.endCont + 1}';
			}
			
			$('#nowPage').val(pno);
			$('#frm').submit();
		});
		
		$('.list').click(function(){
			// 선택된 태그의 아이디값에서 두번째 자리에서부터 마지막까지 자르고
			var tno = $(this).attr('id').substring(1);
			// 추출한 글번호를 폼태그의 입력태그에 셋팅해주고
			$('#notice_no').val(tno);
			
			// 폼태그가 전송될 주소를 셋팅하고
			$('#frm').attr('action', '/project/notice/noticeDetail.proj');
			
			// 폼태그를 전송한다.
			$('#frm').submit();
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
                                    <h1 data-animation="bounceIn" data-delay="0.2s">NOTICE</h1>
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
    <form method="POST" action="/project/notice/noticeList.proj" id="frm" name="frm">
    	<input type="hidden" name="nowPage" id="nowPage" value="${PAGE.nowPage}">
    	<input type="hidden" name="notice_no" id="notice_no">
			<!-- 데이터 -->
	<div class="w3-col w3-margin-top w3-padding w3-card-4 datafr">
			<div class="w3-col w3-margin-top">
				<span class="w3-col w100 w3-center w3-green w3-border-right w3-border-sand">글번호</span>
				<span class="w3-col w100 w3-center w3-green w3-border-right w3-border-sand">작성자</span>
				<span class="w3-col w250 w3-center w3-green w3-border-right w3-border-sand">글제목</span>
				<span class="w3-col w100 w3-center w3-green w3-border-right w3-border-sand">조회수</span>
				<div class="w3-rest w3-center w3-green w3-border-right w3-border-sand">작성일</div>
			</div>
			<!-- 데이터 -->
	<c:forEach var="data" items="${LIST}">
			<div class="w3-col w3-border-left w3-border-right w3-border-bottom w3-hover-lime list" id="l${data.notice_no}">
				<span class="w3-col w100 w3-center w3-border-right">${data.notice_no}</span><!-- 여기에 글번호 추가하고 클릭될때 이 번호를 전송해서 데이터 가져오도록 질의명령 다시 작성하세요... -->
				<span class="w3-col w100 w3-center w3-border-right">${data.nickname}</span>
				<span class="w3-col w250 w3-center w3-border-right">${data.notice_title}</span>
				<span class="w3-col w100 w3-center w3-border-right">${data.hit}</span>
				<div class="w3-rest w3-center">${data.sdate}</div>
			</div>
	</c:forEach>
	<c:if test="${empty LIST}">
			<div class="w3-col w3-padding">
				<h2 class="w3-text-grey w3-center">입력된 데이터가 없습니다!</h2>
			</div>
	</c:if>
		</div>
			
	
	
        
        <!-- 페이징 처리 -->
        <div class="w3-center w3-margin-bottom">
        	<div class="W3-bar w3-border w3-round w3-margin-top">
	<c:if test="${PAGE.startPage ==1}">		
        		<span class="w3-bar-item">pre</span>
    </c:if>
    <c:if test="${PAGE.startPage != 1}">
    			<span class="w3-bar-item w3-button w3-hover-lime pbtn">pre</span>
    </c:if>
<c:forEach var="page" begin="${PAGE.startPage}" end="${PAGE.endPage}">
	<c:if test="${PAGE.nowPage == page}">
				<span class="w3-bar-item w3-button w3-hover-lime pbtn">${page}</span>
	</c:if>
	<c:if test="${PAGE.nowPage != page}">
				<span class="w3-bar-item w3-button w3-hover-lime pbtn">${page}</span>
	</c:if>
</c:forEach>
	<c:if test="${PAGE.endPage == PAGE.totalPage}">
				<span class="w3-bar-item w3-hover-lime">next</span>
	</c:if>
	<c:if test="${PAGE.endPage != PAGE.totalPage}">
				<span class="w3-bar-item w3-button w3-hover-lime pbtn">next</span>
	</c:if>    		
        	</div>
        </div>
        
        <div>            
            <a href='/project/notice/noticeWrite.proj' onClick='fn_write()' class="btn btn-success">글쓰기</a>            
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