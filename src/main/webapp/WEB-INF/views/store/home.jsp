 <%@ page contentType="text/html; charset=utf-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Fashi Template">
<meta name="keywords" content="Fashi, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="/resources/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/themify-icons.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/nice-select.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/style.css" type="text/css">


</head>

<body>
	<%@ include file="../includes/header.jsp" %>
	<!-- Header End -->

	<!-- Hero Section Begin -->
	<section class="hero-section">
		<div class="hero-items owl-carousel">
			<div class="single-hero-items set-bg" data-setbg="/resources/img/HI1.jpeg">
				<div class="container">
					<div class="row">
						<div class="col-lg-5">
							<span>4월의 행사</span>
							<h1>스타벅스</h1>
							<h2>머핀</h2>
							<p>이번달에 새로 출시한 블루베리 머핀부터 치즈큐브가 박힌 치즈머핀까지, 스타벅스만의 특별한 11종류의 머핀을 이번달에 만나보세요!</p>
							<a href="#" class="primary-btn">주문하기</a>
						</div>
					</div>
					<div class="off-card">
						<h2>
							Event <span>2+1</span>
						</h2>
					</div>
				</div>
			</div>
			<div class="single-hero-items set-bg" data-setbg="/resources/img/HI2.jpeg">
				<div class="container">
					<div class="row">
						<div class="col-lg-5">
							<span>4월의 행사</span>
							<h1>뚜레쥬르</h1>
							<h2>카스테라</h2>
							
							<p>2022년 스테디 셀러인 뚜레쥬르만의 카스테라 고급버터를 사용해 부드러운 식감과, 풍성한 고소함을 한번에 선물해 드립니다.</p>
							<a href="#" class="primary-btn">주문하기</a>
						</div>
					</div>
					<div class="off-card">
						<h2>
							Sale <span>15%</span>
						</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Hero Section End -->

	<!-- Banner Section Begin -->
	<div class="banner-section spad">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-3">
					<div class="single-banner">
						<img style="width:280px; height:180px;" src="/resources/img/bread.jpg" alt="">
						<div class="inner-text">
				<a href="/store/list_bread?store_category=bread">
							<h4>Bread</h4>
					</a>
						</div>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="single-banner">
						<img style="width:280px; height:180px;" src="/resources/img/coffee.jpg" alt="">
						<div class="inner-text">
						<a href="/store/list_coffee?store_category=coffee">
							<h4>Coffee</h4>
							</a>
						</div>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="single-banner">
						<img style="width:280px; height:180px;" src="/resources/img/desert.jpeg" alt="">
						<div class="inner-text">
						<a href="/store/list_desert?store_category=desert">
							<h4>Desert</h4>
							</a>
						</div>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="single-banner">
						<img style="width:280px; height:180px;" src="/resources/img/sandwich.png" alt="">
						<div class="inner-text">
						<a href="/store/list_sandwich?store_category=sandwich">
							<h4>Sandwich</h4>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Banner Section End -->

	<!-- Women Banner Section Begin -->
	
	<!-- Women Banner Section End -->

	<!-- Deal Of The Week Section Begin-->
	<section class="deal-of-week set-bg spad" data-setbg="/resources/img/bluebottle.png">
		<div class="container">
			<div class="col-lg-12 text-center">
				<div class="section-title">
					<h2>BLUE BOTTLE Of The Week</h2>
					<p>
						
						<br />
						블루보틀 전 지점에서 오빵 회원 인증시 <br />
						원두를 15% 할인해 드립니다.
						<br />
						<br />
					</p>
					<div class="product-price">
						-15% <span>/BLUE BOTTLE</span>
					</div>
				</div>
				<div class="countdown-timer" id="countdown">
					<div class="cd-item">
						<span>56</span>
						<p>Days</p>
					</div>
					<div class="cd-item">
						<span>12</span>
						<p>Hrs</p>
					</div>
					<div class="cd-item">
						<span>40</span>
						<p>Mins</p>
					</div>
					<div class="cd-item">
						<span>52</span>
						<p>Secs</p>
					</div>
				</div>
				<a href="#" class="primary-btn">회원 인증하기</a>
			</div>
		</div>
	</section>
	<!-- Deal Of The Week Section End -->

	<!-- Man Banner Section Begin -->
	
	<!-- Man Banner Section End -->

	<!-- Instagram Section Begin -->
	
	<!-- Instagram Section End -->

	<!-- Latest Blog Section Begin -->

	<!-- Latest Blog Section End -->

	

	<%@ include file="../includes/footer.jsp" %>

	<!-- Js Plugins -->
	<script src="/resources/js/jquery-3.3.1.min.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/jquery-ui.min.js"></script>
	<script src="/resources/js/jquery.countdown.min.js"></script>
	<script src="/resources/js/jquery.nice-select.min.js"></script>
	<script src="/resources/js/jquery.zoom.min.js"></script>
	<script src="/resources/js/jquery.dd.min.js"></script>
	<script src="/resources/js/jquery.slicknav.js"></script>
	<script src="/resources/js/owl.carousel.min.js"></script>
	<script src="/resources/js/main.js"></script>
</body>

</html>