<!DOCTYPE html>                                                                                                             
<%@ page contentType="text/html; charset=utf-8"%>                                  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>                                                            
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>                                                           
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>                                    
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

 <!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <a href="/store/home"><i class="fa fa-home"></i> Home</a>
                        <span>Login</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Form Section Begin -->

    <!-- Register Section Begin -->
    <div class="register-login-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3">
                    <div class="login-form">
                        <h2>아이디 찾기</h2>
                         <form name="searchVO" id="createForm" action="${path}/member/search_result_id" method="post">
                            <div class="group-input">
                                <label for="username">이름</label>
                                <input type="text" id="user_name" name="user_name" placeholder="이름을 입력하세요..." >
                            </div>
                            <div class="group-input">
                                <label for="pass">전화번호</label>
                                <input type="tel" id="telInput" name="user_phone" required
  								pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}"
  								maxlength="13"
  								placeholder="예) 010-1234-5678" class="form-control">
                           	 </div>
                       
                           	 <br/>
                       
                      <input type="button" href="javascript:void(0)"
								onclick="fnSubmit(); return false;" class="site-btn login-btn" value="아이디 찾기">
                       
                            </form>
                        <div class="switch-login">
                            <a href="/member/join" class="or-login">회원가입</a>
                        </div>
                        <div class="switch-login">
                            <a href="/member/login" class="or-login">로그인 하러가기</a>
                        </div>
                        <div class="switch-login">
                            <a href="/member/search_pw" class="or-login">비밀번호 찾기</a>
                        </div>
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
	// 전화번호
	function autoHypenTel(str) {
		  str = str.replace(/[^0-9]/g, '');
		  var tmp = '';

		  if (str.substring(0, 2) == 02) {
		    // 서울 전화번호일 경우 10자리까지만 나타나고 그 이상의 자리수는 자동삭제
		    if (str.length < 3) {
		      return str;
		    } else if (str.length < 6) {
		      tmp += str.substr(0, 2);
		      tmp += '-';
		      tmp += str.substr(2);
		      return tmp;
		    } else if (str.length < 10) {
		      tmp += str.substr(0, 2);
		      tmp += '-';
		      tmp += str.substr(2, 3);
		      tmp += '-';
		      tmp += str.substr(5);
		      return tmp;
		    } else {
		      tmp += str.substr(0, 2);
		      tmp += '-';
		      tmp += str.substr(2, 4);
		      tmp += '-';
		      tmp += str.substr(6, 4);
		      return tmp;
		    }
		  } else {
		    // 핸드폰 및 다른 지역 전화번호 일 경우
		    if (str.length < 4) {
		      return str;
		    } else if (str.length < 7) {
		      tmp += str.substr(0, 3);
		      tmp += '-';
		      tmp += str.substr(3);
		      return tmp;
		    } else if (str.length < 11) {
		      tmp += str.substr(0, 3);
		      tmp += '-';
		      tmp += str.substr(3, 3);
		      tmp += '-';
		      tmp += str.substr(6);
		      return tmp;
		    } else {
		      tmp += str.substr(0, 3);
		      tmp += '-';
		      tmp += str.substr(3, 4);
		      tmp += '-';
		      tmp += str.substr(7);
		      return tmp;
		    }
		  }

		  return str;
		}
	
	
$('#telInput').keyup(function (event) {
	  event = event || window.event;
	  var _val = this.value.trim();
	  this.value = autoHypenTel(_val);
	});
	
	
var path = "${pageContext.request.contextPath }";

$(document).ready(function() {
	var msg = "${msg}";
	if (msg != "") {
		alert(msg);
	}
});


function fnSubmit() {

	var email_rule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var tel_rule = /^\d{2,3}-\d{3,4}-\d{4}$/;

	if ($("#user_name").val() == null || $("#user_name").val() == "") {
		alert("이름을 입력해주세요.");
		$("#user_name").focus();

		return false;
	}

	if ($("#telInput").val() == null || $("#telInput").val() == "") {
		alert("전화번호를 입력해주세요.");
		$("#telInput").focus();

		return false;
	}

	if (!tel_rule.test($("#telInput").val())) {
		alert("전화번호 형식에 맞게 입력해주세요.");
		return false;
	}

	if (confirm("아이디를 찾으시겠습니까?")) {

		$("#createForm").submit();

		return false;
	}
}
	
</script>

<%@include file="../includes/footer.jsp"%>
</body>
</html>
