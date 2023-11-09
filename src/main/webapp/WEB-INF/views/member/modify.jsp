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
                        <h2>회원 수정</h2>
					<form id="modifyForm" action="/member/modify" method="post">
 					<form id="login_form">
                            <div class="group-input">
                                <label></label>
                                <input type="hidden" name="user_bno" readonly="disabled" value='<c:out value="${pageInfo.user_bno}"/>' >
                            </div>
							 <div class="group-input">
                                <label>회원ID</label>
                                <input type="text" name="user_bno" readonly="readonly" value='<c:out value="${pageInfo.user_id}"/>' >
                            </div>
						<div class="group-input">
                                <label>회원PW</label>
					<input name="user_pw" value='<c:out value="${pageInfo.user_pw}"/>' >
						</div>
		 <div class="group-input">
                                <label>이메일</label>
		<input name="user_email" value='<c:out value="${pageInfo.user_email}"/>' >
	</div>
	<div class="group-input">
                               <label></label>
		<input type="hidden" name="user_sex" readonly="readonly" value='<c:out value="${pageInfo.user_sex}"/>' >
	</div>
	  <div class="group-input">
                                <label>핸드폰번호</label>
		<input name="user_phone"  value='<c:out value="${pageInfo.user_phone}"/>' >
	</div>
	<div class="group-input">
                               <label>이름</label>
		<input name="user_name"  value='<c:out value="${pageInfo.user_name}"/>' >
	</div>

	<%-- <div class="input_wrap">
		<label>회원고유번호</label>
		<input name="user_bno" readonly="disabled" value='<c:out value="${pageInfo.user_bno}"/>' >
	</div>
	<div class="input_wrap">
		<label>회원ID</label>
		<input name="user_id" readonly="readonly" value='<c:out value="${pageInfo.user_id}"/>' >
	</div>
	<div class="input_wrap">
		<label>회원PW</label>
		<input name="user_pw"  value='<c:out value="${pageInfo.user_pw}"/>' >
	</div>
	<div class="input_wrap">
		<label>이메일</label>
		<input name="user_email"  value='<c:out value="${pageInfo.user_email}"/>' >
	</div>
	<div class="input_wrap">
		<label>성별</label>
		<input name="user_sex" readonly="readonly" value='<c:out value="${pageInfo.user_sex}"/>' >
	</div>
	<div class="input_wrap">
		<label>핸드폰번호</label>
		<input name="user_phone"  value='<c:out value="${pageInfo.user_phone}"/>' >
	</div>
	<div class="input_wrap">
		<label>이름</label>
		<input name="user_name"  value='<c:out value="${pageInfo.user_name}"/>' >
	</div> --%>
	</form>
	
	
	<div class="btn_wrap text-center">
    <c:if test="${user.user_admin == 1 }">
        <a class="btn" id="list_btn">목록 페이지</a> 
    </c:if>
    <br/>
    <button type="button" id="modify_btn" class="site-btn register-btn">수정하기</button>
    <button type="button" id="cancel_btn" class="site-btn register-btn">수정취소</button>
    <button type="button" id="delete_btn" class="site-btn register-btn">회원탈퇴</button>
</div>

     <!--    <a class="btn" id="modify_btn">수정 완료</a>
            <a class="btn" id="cancel_btn">수정 취소</a>
         <a class="btn" id="delete_btn">회원 탈퇴</a> -->
	
	</form>
	<form id="infoForm" action="/member/modify" method="get">
		<input type="hidden" id="user_bno" name="user_bno" value='<c:out value="${pageInfo.user_bno}"/>'>
	</form>
	</div>
	</div>
	</div>
	</div>
	</div>
	
	
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
	let mForm = $("#modifyForm"); 
	  
	$("#list_btn").on("click", function(e){
		form.find("#user_bno").remove();
		form.attr("action", "/member/list");
		form.submit();
	});
	
	 /* 수정 하기 버튼 */
    $("#modify_btn").on("click", function(e){
    	alert("수정이 완료됐습니다.");
        mForm.submit();
    });
	
	/* 취소 버튼 */
    $("#cancel_btn").on("click", function(e){
        form.attr("action", "/member/detail");
        form.submit();
    });    
    /* 삭제 버튼 */
    $("#delete_btn").on("click", function(e){
        form.attr("action", "/member/delete");
        form.attr("method", "post");
        form.submit();
    });
    
</script>	

<%@include file="../includes/footer.jsp"%>
</body>
</html>