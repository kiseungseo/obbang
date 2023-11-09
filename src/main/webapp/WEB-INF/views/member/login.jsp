<%@ page contentType="text/html; charset=utf-8"%>     
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>로그인</title>
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
                        <a href="#"><i class="fa fa-home"></i> Home</a>
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
                        <h2>로그인</h2>
                         <form id="login_form" method="post" onsubmit="return frm_check();">
                            <div class="group-input">
                                <label for="username">아이디</label>
                                <input type="text" id="user_id" name="user_id" placeholder="아이디를 입력해주세요." >
                            </div>
                            <div class="group-input">
                                <label for="pass">패스워드</label>
                                <input type="password" id="user_pw"name="user_pw" placeholder="비밀번호를 입력해주세요.">
                            </div>
                               <c:if test="${result == 0 }">
                               
						<div class="high text-muted" style="color: red;" >아이디 또는 비밀번호를 잘못 입력하셨습니다.</div>
						
						</c:if>
                            <div class="group-input gi-check">
                                <div class="gi-more">
                                    <label for="save-pass">
                                        아이디 저장
                                        <input type="checkbox"  name="checkId" id="save-pass">
                                        <span class="checkmark"></span>
                                    </label>
                                 
                                  
                                    <a href="/member/search_id" class="forget-pass">아이디 찾기</a> 
                                    <br/>
                                    <a href="/member/search_pw" class="forget-pass">비밀번호 찾기</a>
                                    <br/>
                                </div>
                              </div>
                              <input type="button" class="site-btn login-btn" id="login" value="로그인">
                            
                        </form>
                        <div class="switch-login">
                            <a href="/member/join" class="or-login">회원가입</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Register Form Section End -->

    <!-- Partner Logo Section Begin -->
    <div class="partner-logo">
        <div class="container">
            <div class="logo-carousel owl-carousel">
                <div class="logo-item">
                    <div class="tablecell-inner">
                        <img src="img/logo-carousel/logo-1.png" alt="">
                    </div>
                </div>
                <div class="logo-item">
                    <div class="tablecell-inner">
                        <img src="img/logo-carousel/logo-2.png" alt="">
                    </div>
                </div>
                <div class="logo-item">
                    <div class="tablecell-inner">
                        <img src="img/logo-carousel/logo-3.png" alt="">
                    </div>
                </div>
                <div class="logo-item">
                    <div class="tablecell-inner">
                        <img src="img/logo-carousel/logo-4.png" alt="">
                    </div>
                </div>
                <div class="logo-item">
                    <div class="tablecell-inner">
                        <img src="img/logo-carousel/logo-5.png" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Partner Logo Section End -->

    

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
    /* 로그인 버튼 클릭 메서드 */
    $("#login").click(function(){
        
        //alert("로그인 버튼 작동");
      
        
        /* 로그인 메서드 서버 요청 */
        $("#login_form").attr("action", "/member/login");
        $("#login_form").submit();
        
    });
   
    $(function() {
        
        fnInit();
      
  });
  
  function frm_check(){
      saveid();
  }

 function fnInit(){
     var cookieid = getCookie("saveid");
     console.log(cookieid);
     if(cookieid !=""){
         $("input:checkbox[user_id='save-pass']").prop("checked", true);
         $('#user_id').val(cookieid);
     }
     
 }    

 function setCookie(name, value, expiredays) {
     var todayDate = new Date();
     todayDate.setTime(todayDate.getTime() + 0);
     if(todayDate > expiredays){
         document.cookie = name + "=" + escape(value) + "; path=/; expires=" + expiredays + ";";
     }else if(todayDate < expiredays){
         todayDate.setDate(todayDate.getDate() + expiredays);
         document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";";
     }
     
     
     console.log(document.cookie);
 }

 function getCookie(Name) {
     var search = Name + "=";
     console.log("search : " + search);
     
     if (document.cookie.length > 0) { // 쿠키가 설정되어 있다면 
         offset = document.cookie.indexOf(search);
         console.log("offset : " + offset);
         if (offset != -1) { // 쿠키가 존재하면 
             offset += search.length;
             // set index of beginning of value
             end = document.cookie.indexOf(";", offset);
             console.log("end : " + end);
             // 쿠키 값의 마지막 위치 인덱스 번호 설정 
             if (end == -1)
                 end = document.cookie.length;
             console.log("end위치  : " + end);
             
             return unescape(document.cookie.substring(offset, end));
         }
     }
     return "";
 }

 function saveid() {
     var expdate = new Date();
     if ($("#save-pass").is(":checked")){
         expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 30);
         setCookie("saveid", $("#user_id").val(), expdate);
         }else{
        expdate.setTime(expdate.getTime() - 1000 * 3600 * 24 * 30);
         setCookie("saveid", $("#user_id").val(), expdate);
          
     }
 }
    </script>
    
    <%@include file="../includes/footer.jsp"%>
</body>

</html>