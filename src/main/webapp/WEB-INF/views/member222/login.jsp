<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
 <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
  />
</head>
<body>

<section class="vh-100" style="background-color:#263A29;">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col col-xl-10">
        <div class="card" style="border-radius: 1rem;">
          <div class="row g-0">
            <div class="col-md-6 col-lg-5 d-none d-md-block">
              <img src="https://img.freepik.com/free-photo/vertical-shot-delicious-chocolate-naked-cake-with-choco-balls-cream-white-table_181624-59077.jpg?w=740&t=st=1681443053~exp=1681443653~hmac=6d6415600a64bf263068d9995943ea28962e7c17b8142c1bb403403b6c204e0f"
                alt="login form" class="img-fluid" style="border-radius: 1rem 0 0 1rem;" />
            </div>
            <div class="col-md-6 col-lg-7 d-flex align-items-center">
              <div class="card-body p-4 p-lg-5 text-black">

                <form id="login_form" method="post" onsubmit="return frm_check();">

                  <div class="d-flex align-items-center mb-4 pb-1">
                   <!--  <i class="fas fa-cubes fa-2x me-3" style="color: #ff6219;"></i> -->
                   <h1 class="animate__animated animate__animate__heartBeat">로그인하기</h1>
                   <!--  <span class="h1 fw-bold mb-0">로그인</span> -->
                  </div>

                  <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">아이디와 비밀번호를 입력해주세요.</h5>

                  <div class="form-outline mb-4">
                    <input type="text" class="form-control form-control-lg" id="user_id"  name="user_id" placeholder="아이디를 입력해주세요." />
                   
                  </div>

                  <div class="form-outline mb-2">
                    <input type="password"  class="form-control form-control-lg" name="user_pw" placeholder="비밀번호를 입력해주세요."/>
                  
                  </div>
                  <div>
    				<input type="checkbox" class="save_id" name="checkId" id="save_id" >
   					 <label for="saveId">아이디 저장</label>
					</div>
						
						<c:if test="${result == 0 }">
						<div class="high text-muted" style="color: red;" >아이디 또는 비밀번호를 잘못 입력하셨습니다.</div>
						</c:if>
					<br>
					<hr>
                 <div>
						<input type="button" class="btn btn-dark btn-lg btn-block" id="login" value="로그인">
					</div>
					<br>
					

                  <a class="middle text-muted" href="/member/search_id">아이디 찾기</a>
                  <br>
                  <a class="middle text-muted" href="/member/search_pw">비밀번호 찾기</a>
                  <br>
                  <br>
                  <p class="mb-5 pb-lg-2" style="color: #41644A;">회원가입 페이지로 <a href="/member/join"
                      style="color: #393f81;">GOGO!!</a></p>
                  
                </form>

              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

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
         $("input:checkbox[user_id='save_id']").prop("checked", true);
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
     if ($("#save_id").is(":checked")){
         expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 30);
         setCookie("saveid", $("#user_id").val(), expdate);
         }else{
        expdate.setTime(expdate.getTime() - 1000 * 3600 * 24 * 30);
         setCookie("saveid", $("#user_id").val(), expdate);
          
     }
 }


    
    
 
</script>



</body>
</html>