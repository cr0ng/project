<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title> ITCHA | modal</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- <link rel="manifest" href="site.webmanifest"> -->
    <link rel="shortcut icon" type="image/x-icon" href="/project/assets/img/favicon.ico">
	<script type="text/javascript" src="/project/assets/js/jquery-3.6.0.min.js"></script>
	
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
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style type="text/css">	
	/* The Modal (background) */
	.searchModal, .recoModal{
		position: fixed; /* Stay in place */
		z-index: 10; /* Sit on top */
		left: 0;
		top: 0;
		width: 100%; /* Full width */
		height: 200%; /* Full height */
		overflow: auto; /* Enable scroll if needed */
		background-color: rgb(0,0,0); /* Fallback color */
		background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
	}
	
	/* Modal Content/Box */
	.search-modal-content, .reco-modal-content {
		background-color: #fefefe;
		margin: 10% auto; /* 15% from the top and centered */
		padding: 20px;
		border: 1px solid #888;
		width: 70%; /* Could be more or less, depending on screen size */
	}	
	#mtitle{
		color: black;
	}
	#ediv {
		width : 100%;
		height : 150px;
		background-color: grey;
	}

	.emo {
		padding-top : 10px;
		float: left;
		width : 25%;
		height : 150px;
		font-size:100px;
		background-color: grey;
		border : 0px;
		
	}
	
	.emo:hover {
		background-color: #9400D3;
		color: black;
	}
	
	.pdiv {
		width : 270px;
		height : 450px;
		background-color: white;
		float : left;
		
	}

	#poster {
		float: left;
		width : 270px;
		height : 380px;
		font-size:80px;
		border : 2px solid white;
		
	}
	
	#rdiv {
		margin : 0 auto;
		width : 1080px;
		height : 450px;
	}
</style>

<script type="text/javascript">
	$(document).ready(function(){
		/* 
		$('.emo').click(function(){
			var tid = $(this).attr('id');
			alert(tid);
			$.ajax({
				url : "/project/movie/emoSelect.proj",
				type : "POST",
				dataType: 'json',
				data: {
					emo : tid
				},
				success : function(data){
					alert('data len : ' + data.length);
				},
				error: function(){
					alert('##### fail #####');
				}
			});
		});
		 */
		  $('.recoModal').hide();
		$('.emo').click(function(){
			var tid = $(this).attr('id');
			alert(tid);
			$.ajax({
				url : "/project/movie/emoSelect.proj",
				type : "POST",
				dataType: 'json',
				data: {
					emo : tid
				},
				success : function(data){
					$('.searchModal').hide();
						//$('#content').append('<h1 id="mtitle">선택한 감정 : '+ tid +' </h1>');
						
						switch($.trim(tid)){
						case '1': $('#content').append('<h1 id="mtitle">선택한 감정 : happy </h1>');
						break;
						case '2': $('#content').append('<h1 id="mtitle">선택한 감정 : angry </h1>');
						break;	
						case '3': $('#content').append('<h1 id="mtitle">선택한 감정 : depressed </h1>');
						break;	
						case '4': $('#content').append('<h1 id="mtitle">선택한 감정 : excited </h1>');
						break;	
						}
							
					    for(i = 0; i<data.length; i++){
				     	$('#cont').append('<div class="pdiv"><img src="/project/assets/img/poster/' + data[i].savename +'" id="poster"><h2 id=title>' + data[i].title + '</h2></div>');
					 };
					$('.recoModal').fadeIn(300);
				},
				error: function(){
					alert('##### fail #####');
				}
			});
		});
		
		$('.modalCloseBtn').click(function(){
			$(location).attr('href', '/project/main.proj');
		})
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
   
    <main>
        <!--? slider Area Start-->
        <section class="slider-area ">
            <div class="slider-active">
                <!-- Single Slider -->
                <div class="single-slider slider-height">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-xl-8 col-lg-11 col-md-12">
                                <div class="hero__caption text-center">
                                    <%-- 모달창 추가 --%>
                                   	<div id="modal" class="searchModal">
										<div class="search-modal-content">
											<div class="page-header">
												<h1 id="mtitle">감정 선택</h1>
											</div>
												<input type="hidden"  id="emo" name="emo">
												<div id ="ediv">
													<span id="1" class= "emo">😄</span>
													<span id="2" class= "emo">😡</span>
													<span id="3" class= "emo">😢</span>
													<span id="4" class= "emo">🤩</span>
												</div>
										</div>
									</div>
									
									 <%-- 모달창 추가 --%>
                                   	<div id="modal" class="recoModal">
										<div class="reco-modal-content">
											<div id="content">
												
											</div>
											<form class="form-default" action="#" method="POST" name="frm" id="frm">
											<div id ="rdiv">
								                <div id="cont">
								                </div>
												<div style="cursor:pointer;background-color:#9370DB; text-align: center; padding-bottom: 10px; padding-top: 10px; ">
													<span class="pop_bt modalCloseBtn" style="font-size: 20pt; color: white; margin:0 auto;" >닫기</span>
								                </div>         
								                      
											</div>
											</form>
										</div>
									</div>
                                </div>
                            </div>
                        </div>
                    </div>          
                </div>
        	</div>
        </section>
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