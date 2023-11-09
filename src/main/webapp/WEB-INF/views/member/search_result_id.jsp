<!DOCTYPE html>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>아이디 찾기</title>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
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

<%@include file="../includes/header.jsp"%>
	

	<!-- Breadcrumb Section Begin -->
	<div class="breacrumb-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb-text">
						<a href="/store/home"><i class="fa fa-home"></i> Home</a> <span>Search_id</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb Form Section Begin -->

	<!-- Register Section Begin -->
	<!-- Outer Row -->
	<div class="row justify-content-center">

		<div class="col-xl-5 col-lg-12 col-md-5">

			<div class="card o-hidden border-0 shadow-lg my-5">
				<div class="card-body p-0">
					<!-- Nested Row within Card Body -->
					<div class="row">
						<div class="col-lg-12">
							<div class="p-5">

								<div class="text-center">
									<h1 class="h4 text-gray-900 mb-2">아이디를 찾았습니다!!!!</h1>
									<br> <br>
									<c:choose>
										<c:when test="${empty searchVO}">
											<p class="mb-4">아이디 조회결과가 없습니다.</p>
										</c:when>

										<c:otherwise>
											<p class="mb-4">${searchVO.user_id}</p>
										</c:otherwise>
									</c:choose>
									<hr>
								</div>
								<br />
								<div class="text-center">
									<a class="small" href="/member/search_pw">비밀번호를 찾으시겠습니까?</a>
								</div>

								<div class="text-center">
									<a class="small" href="/member/join">회원가입 페이지로 가시겠습니까?</a>
								</div>

								<div class="text-center">
									<a class="small" href="/member/login">로그인 페이지로 가시겠습니까?</a>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>





	<script>                                                                                                                    
var path = "${pageContext.request.contextPath }";                                                                           
                                                                                            
$(document).ready(function() {                                                                                            
                                                                                            
});                                                                                                                       
                                                                                            
</script>


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

<%@include file="../includes/footer.jsp"%>


</html>
