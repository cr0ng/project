<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<style type="text/css">
		#ment{
			margin-top : 20px;
			color : white;
		}
		.error{
			color:white;
		}
	</style>
<head>
 <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title> Itcha</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="manifest" href="site.webmanifest">
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
	
	<script type ="text/javascript">
	$(document).ready(function(){
		
		// 이름 정규식
		$('#name').focusout(function(){
			var regName = RegExp(/^[가-힣0-9]{2,}$/);
			
			if(regName.test($('#name').val())){
				$('#error1').hide();		
			}else
				$('#error1').show();
		});
	
		// 아이디 정규식
		$('#id').focusout(function(){
			var regName = RegExp(/^[a-z]+[a-z0-9]{2,14}$/);
			
			if(regName.test($('#id').val())){
				$('#error2').hide();		
			}else
				$('#error2').show();
		});
		
		// 비번 정규식
		$('#pw').focusout(function(){
			var regName = RegExp(/^[a-zA-Z0-9!_+%*]{5,20}$/);
			
			if(regName.test($('#pw').val())){
				$('#error3').hide();		
			}else
				$('#error3').show();
		});
		
		// 비번 일치 확인
		$('#repw').focusout(function(){
					
			if($('#repw').val() === $('#pw').val()){
				$('#error4').hide();
			}else
				$('#error4').show();
		});
		
		// 메일 정규식
		$('#email').focusout(function(){
			var regName = RegExp(/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i);

			if(regName.test($('#email').val())){
				$('#error5').hide();		
			}else
				$('#error5').show();
		});
		
		// 닉네임 정규식
		$('#nickname').focusout(function(){
			var regName = RegExp(/^[a-z0-9]{3,15}/);
			
			if(regName.test($('#nickname').val())){
				$('#error6').hide();		
			}else
				$('#error6').show();
		});
		
		$('#jbtn').click(function(){
			var sname = $('#name').val();
			var sid = $('#id').val();
			var spw = $('#pw').val();
			var smail = $('#email').val();
			var snickname = $('#nickname').val();
			var sgen = $('[name="gen"]:selected').val();
			var sage = $('#age').val();
			
			// 유효성 검사
			if(!(sname && sid && spw && smail && snickname && sage)){
				alert('입력되지 않은 곳이 있습니다.');
				return;
			}
		
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


<!-- Register -->

<main class="login-body" data-vide-bg="/project/assets/img/login-bg.mp4">
    <!-- Login Admin -->
    <form class="form-default" action="/project/member/joinProc.proj" method="POST" id="frm" name="frm">
        
        <div class="login-form">
            <!-- logo-login -->
            <div class="logo-login">
                <a href="login.proj"><img src="/project/assets/img/logo/loder.png" alt=""></a>
            </div>
            <h2>회원가입</h2>

            <div class="form-input">
                <label for="name">이름</label>
                <input  type="text" name="user_name" id="name" placeholder="이름">
           		<div class="error" id ="error1" style= "display:none ">한글과 숫자 2글자 이상</div>
            </div>
            <div class="form-input">
                <label for="name">아이디</label>
                <input  type="text" name="user_id" id="id" placeholder="아이디">
               	<div class="error"  id ="error2" style= "display:none ">영소문자로 시작하는 3~15자 영소문자 또는 숫자</div>
            </div>
            <div class="form-input">
                <label for="name">비밀번호</label>
                <input  type="password" name="user_pw" id="pw" placeholder="비밀번호">
                <div class="error"  id ="error3" style= "display:none ">대소문자,숫자,특수문자(!_+%*) 5~20자</div>
            </div>
            <div class="form-input">
                <label for="name">비밀번호 확인</label>
                <input type="password" name="repw" id="repw" placeholder="비밀번호 확인">
                <div class="error"  id ="error4" style= "display:none ">비밀번호가 일치하지 않습니다.</div>
                
            </div>
            <div class="form-input">
                <label for="name">E-mail</label>
                <input type="email" name="email" id ="email" placeholder="E-mail">
                 <div class="error"  id ="error5" style= "display:none ">이메일 형식으로 입력하세요</div>
            </div>
            <div class="form-input">
                <label for="name">닉네임</label>
                <input type="text" name="nickname" id="nickname" placeholder="닉네임">
                 <div class="error"  id ="error6" style= "display:none ">소문자,숫자 3~15</div>
            </div>
            <div class ="form-input">
            	<label for="name">성별</label><br>
                <select name="gender"> 
                	<option value="">성별</option>
	                <option value="M">남성</option>
	                <option value="F">여성</option>
                </select>
                <hr style="padding-top : 25px">
            </div>
            <div class="form-input" >
                <label for="name">나이</label>
                <input type="text" name="age" id="age" placeholder="나이">
            </div>
           
            <div class="w3-padding w3-blue w3-round-xlarge w3-hover-white w3-center" id="jbtn">가입하기</div>
            <!-- Forget Password -->
            <div id="ment">계정이 있다면? </div>
            <a href="login.proj" class="registration">로그인</a>
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