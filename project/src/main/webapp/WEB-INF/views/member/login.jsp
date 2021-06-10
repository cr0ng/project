<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title> ITCHA</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<!--     <link rel="manifest" href="site.webmanifest"> -->
    <link rel="shortcut icon" type="image/x-icon" href="/project/assets/img/favicon.ico">
	<link rel="stylesheet" type="text/css" href="/project/css/w3.css">
	<link rel="stylesheet" type="text/css" href="/project/css/user.css">
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
	
	<style>
		
		
	</style>
	
	<script type="text/javascript">
	$(document).ready(function(){
		$('#lbtn').click(function(){
			var sid = $(document.frm.id).val();
			var spw = $(document.frm.pw).val();
			
			if(!(sid && spw)){
				alert('아이디와 비밀번호를 입력하세요!');
				return;
			}
			
			//alert("sid : " + sid);
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
    <!-- Preloader Start-->


<main class="login-body" data-vide-bg="/project/assets/img/login-bg.mp4">
    <!-- Login Admin -->
    <form class="form-default" action="/project/member/loginProc.proj" method="POST" name ="frm" id="frm">
        
        <div class="login-form">
            <!-- logo-login -->
            <div class="logo-login">
                <a href="main.project"><img src="/project/assets/img/logo/loder.png" alt=""></a>
            </div>
            <h2>로그인</h2>
            <div class="form-input">
                <label for="name">아이디</label>
                <input  type="text" name="user_id" id="id" placeholder="아이디">
            </div>
            <div class="form-input">
                <label for="name">비밀번호</label>
                <input type="password" name="user_pw" id="pw" placeholder="비밀번호">
            </div>
           	<div class="w3-padding w3-blue w3-round-xlarge w3-hover-white w3-center" id="lbtn">로그인</div>
            
            <a href="findIDPW.proj" class="forget w3-half">ID/PW 찾기</a>
            <a href="join.proj" class="forget w3-half ">회원가입</a>
            
            <!-- 네이버 로그인 창으로 이동 -->
            
			<div id="naver_id_login" style="text-align:center;"><a href="${url}">
			<img style=" margin-top: 10px;" width="223" src="/project/img/naver/btnW_완성형.png"/></a></div>	
			 
			 
        </div>
    </form>
    <!-- /end login form -->
</main>

    <script src="/project/assets/js/vendor/modernizr-3.5.0.min.js"></script>
    <!-- Jquery, Popper, Bootstrap -->
    <script src="/project/assets/js/vendor/jquery-1.12.4.min.js"></script>
    <script src="/project/assets/js/popper.min.js"></script>
    <script src="/project/assets/js/bootstrap.min.js"></script>
    <!-- Jquery Mobile Menu -->
    <script src="/project/assets/js/jquery.slicknav.min.js"></script>

    <!-- Video bg -->
    <script src="/project/assets/js/jquery.vide.js"></script>

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