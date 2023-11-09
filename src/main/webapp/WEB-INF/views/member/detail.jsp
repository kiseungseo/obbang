<!DOCTYPE html>                                                                                                             
<%@ page contentType="text/html; charset=utf-8"%>                                  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>                                                            
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>                                                           
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>                                    
<title>회원정보 수정</title>
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
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/themify-icons.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/style.css" type="text/css">
 
 
</head>
<body>

<%@include file="../includes/header.jsp"%>

    <div class="register-login-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3">
                    <div class="login-form">
                        <h2>회원 정보</h2>
                         <form id="login_form">
                            <div class="group-input">
                                <label>회원ID</label>
                                <input type="text" name="user_bno" readonly="readonly" value='<c:out value="${pageInfo.user_id}"/>' >
                            </div>
                            <div class="group-input">
                                <label>회원PW</label>
		<input name="user_pw" readonly="readonly" value='<c:out value="${pageInfo.user_pw}"/>' >
	</div>
                            <div class="group-input">
                                <label>이메일</label>
		<input name="user_email" readonly="readonly" value='<c:out value="${pageInfo.user_email}"/>' >
	</div>
                            <div class="group-input">
                               <label>성별</label>
		<input name="user_sex" readonly="readonly" value='<c:out value="${pageInfo.user_sex}"/>' >
	</div>
                            <div class="group-input">
                                <label>핸드폰번호</label>
		<input name="user_phone" readonly="readonly" value='<c:out value="${pageInfo.user_phone}"/>' >
	</div>
                            <div class="group-input">
                               <label>이름</label>
		<input name="user_name" readonly="readonly" value='<c:out value="${pageInfo.user_name}"/>' >
	</div>
                        
                            
	<div class="group-input">

	 <c:if test="${user.user_admin == 1 }"> 
		<button type="button" id="list_btn" class="site-btn register-btn">목록페이지</button>
		
<!-- 		<a class="btn" id="list_btn" >목록 페이지</a>  -->
		</c:if>
		
		<button type="button" id="modify_btn" class="site-btn register-btn">수정하기</button>
	<!-- 	<a class="btn" id="modify_btn">수정 하기</a> -->
	</div>
<!-- 	<button type="button" id="list_btn" class="site-btn register-btn">목록페이지</button> -->
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
 
	
	<form id="infoForm" action="/member/modify" method="get">
		<input type="hidden" id="user_bno" name="user_bno" value='<c:out value="${pageInfo.user_bno}"/>'>
	</form>


	
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
	
<script>
	let form = $("#infoForm");
	
	$("#list_btn").on("click", function(e){
		form.find("#user_bno").remove();
		form.attr("action", "/member/list");
		form.submit();
	});
	
	$("#modify_btn").on("click", function(e){
		form.attr("action", "/member/modify");
		form.submit();
	});	
</script>	

<%@include file="../includes/footer.jsp"%>
</body>
</html>