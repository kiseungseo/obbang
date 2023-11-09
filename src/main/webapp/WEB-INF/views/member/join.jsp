<!DOCTYPE html>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<title>아이디 찾기</title>
<html>
<head>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
<link rel="stylesheet" href="/resources/css/join.css">
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
	


<%-- <%@include file="../includes/header.jsp"%> --%>


	<!-- Register Section Begin -->
	<div class="register-login-section spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 offset-lg-3">
					<div class="register-form">
					<div class="container">
			<div class="inner-header">
				<a href="/store/home"><img src="/resources/img/obbang.png"></a>
			</div>
		</div>
					
						
						<form id="join_form" method="post">
							<div class="group-input">
								<label for="username">아이디*</label> <input type="text"
									id="user_id" name="user_id" placeholder="아이디를 입력해주세요">

								<span class="id_input_re_1">사용 가능한 아이디입니다.</span> <span
									class="id_input_re_2">아이디가 이미 존재합니다.</span> <span
									class="final_id_ck">아이디를 입력해주세요.</span>
							</div>
							<div class="group-input">
								<label for="pass">패스워드*</label> <input type="text" id="user_pw"
									name="user_pw" placeholder="패스워드를 입력해주세요">
									<span class="final_pw_ck">비밀번호를 입력해주세요.</span>
							</div>
							<div class="group-input">
								<label for="con-pass">패스워드 확인*</label> <input type="text"
									id="user_pw2" name="user_pw2" placeholder="한번 더 입력해주세요"> <span
									class="final_pwck_ck">비밀번호 확인을 입력해주세요.</span> <span
									class="pwck_input_re_1">비밀번호가 일치합니다.</span> <span
									class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
							</div>

							<div class="group-input">
								<label for="username">이름*</label> <input type="text"
									id="user_name" name="user_name" placeholder="이름을 입력해주세요">
									    <span class="final_name_ck">이름을 입력해주세요.</span>
							</div>


							<div class="row">
								<div class="col-md-7">
									<div class="group-input">
										<label for="emamil">이메일*</label> <input type="email"
											id="user_email" name="user_email"
											placeholder="you@example.com"> <span
											class="final_mail_ck">이메일을 입력해주세요.</span>
											<sapn class="mail_input_box_warn"></sapn>
									</div>
								</div>
								<div class="col-md-5">
									<label for="root">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</label>
									<button type="button" id="button"
										class="site-btn register-btn float-right">이메일 전송</button>
								</div>
							</div>

							<div class="group-input" id="mail_check_input_box" >
								<label for="email">인증번호*</label> 
								<input type="text" id="user_num" name="user_num" placeholder="인증번호"
									disabled="disabled"> 
								<span id="user_num2"></span>
							</div>

							<div class="group-input">
								<label for="root">성별</label> <select
									class="custom-select d-block w-100" id="user_sex"
									name="user_sex">
									<option selected>성별을 골라주세요*</option>
									<option value="남자">남자</option>
									<option value="여자">여자</option>
									<option value="선택안함">선택안함</option>
								</select>
							</div>
							<div class="group-input">
								<label for="text">전화번호</label> <input type="tel" id="telInput"
									name="user_phone" required
									pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" maxlength="13"
									placeholder="예) 010-1234-5678" class="form-control">
							</div>
							<div class="group-input">
							<div class="row">
								<div class="col-md-4">
									<label for="root">년도*</label> <select
										class="custom-select d-block w-100" id="user_year"
										name="user_year"></select>
								</div>
								<div class="col-md-4">
									<label for="root">월*</label> <select
										class="custom-select d-block w-100" id="user_month"
										name="user_month"></select>
								</div>
								<div class="col-md-4">
									<label for="root">일*</label> <select
										class="custom-select d-block w-100" id="user_day"
										name="user_day"></select>
								</div>
							</div>
								</div>
								
									<div class="row">
								<div class="col-md-7">
									<div class="group-input">
										<label for="emamil">주소*</label> 
										<input type="text" id="user_address1" name="user_address1" readonly="readonly">
								
									</div>
								</div>
								<div class="col-md-5">
									<label for="root">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</label>

									<button type="button" 
										class="site-btn register-btn float-right" onclick="execution_daum_address()">주소찾기</button>
								</div>
							</div>
							<div class="group-input">
								<input type="text"
									id="user_address2" name="user_address2">
							</div>
						<div class="group-input">
								 <input type="text"
									id="user_address3" name="user_address3" placeholder="주소를 입력해주세요">
									 <span class="final_addr_ck">주소를 입력해주세요.</span>
							</div>

						
						 <input type="button" class="site-btn register-btn" id="register" value="가입하기" >
						 
						<!-- 	<button type="submit" class="site-btn register-btn">가입하기</button> -->
						</form>
						<div class="switch-login">
							<a href="/member/login" class="or-login">로그인</a>
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
	$(document).ready(function(){            
	    var now = new Date();
	    var year = now.getFullYear();
	    var mon = (now.getMonth() + 1) > 9 ? ''+(now.getMonth() + 1) : '0'+(now.getMonth() + 1); 
	    var day = (now.getDate()) > 9 ? ''+(now.getDate()) : '0'+(now.getDate());           
	    //년도 selectbox만들기               
	    for(var i = 1900 ; i <= year ; i++) {
	        $('#user_year').append('<option value="' + i + '">' + i + '년</option>');    
	    }

	    // 월별 selectbox 만들기            
	    for(var i=1; i <= 12; i++) {
	        var mm = i > 9 ? i : "0"+i ;            
	        $('#user_month').append('<option value="' + mm + '">' + mm + '월</option>');    
	    }
	    
	    // 일별 selectbox 만들기
	    for(var i=1; i <= 31; i++) {
	        var dd = i > 9 ? i : "0"+i ;            
	        $('#user_day').append('<option value="' + dd + '">' + dd+ '일</option>');    
	    }
	    $("#user_year  > option[value="+year+"]").attr("selected", "true");        
	    $("#user_month  > option[value="+mon+"]").attr("selected", "true");    
	    $("#user_day  > option[value="+day+"]").attr("selected", "true");       
	  
	})
	

var code = "";				//이메일전송 인증번호 저장위한 코드



$(document).ready(function(){
	//회원가입 버튼(회원가입 기능 작동)
	$("#register").click(function(){
		
		/* 입력값 변수 */
		var id = $("#user_id").val(); 				// id 입력란
		var pw = $("#user_pw").val();				// 비밀번호 입력란
		var pwck = $("#user_pw2").val();			// 비밀번호 확인 입력란
		var name = $("#user_name").val();			// 이름 입력란
		var mail = $("#user_email").val();			// 이메일 입력란
		var addr = $("#user_address3").val();		// 주소 입력란
		
		/* 아이디 유효성검사 */
		if(id == ""){
			$('.final_id_ck').css('display','block');
			idCheck = false;
		}else{
			$('.final_id_ck').css('display', 'none');
			idCheck = true;
		}
		
		/* 비밀번호 유효성 검사 */
		if(pw == ""){
			$('.final_pw_ck').css('display','block');
			pwCheck = false;
		}else{
			$('.final_pw_ck').css('display', 'none');
			pwCheck = true;
		}
		
		/* 비밀번호 확인 유효성 검사 */
		if(pwck == ""){
			$('.final_pwck_ck').css('display','block');
			pwckCheck = false;
		}else{
			$('.final_pwck_ck').css('display', 'none');
			pwckCheck = true;
		}
		
		/* 이름 유효성 검사 */
		if(name == ""){
			$('.final_name_ck').css('display','block');
			nameCheck = false;
		}else{
			$('.final_name_ck').css('display', 'none');
			nameCheck = true;
		}		
		
		/* 이메일 유효성 검사 */
		if(mail == ""){
			$('.final_mail_ck').css('display','block');
			mailCheck = false;
		}else{
			$('.final_mail_ck').css('display', 'none');
			mailCheck = true;
		}		
		
		/* 주소 유효성 검사 */
		if(addr == ""){
			$('.final_addr_ck').css('display','block');
			addressCheck = false;
		}else{
			$('.final_addr_ck').css('display', 'none');
			addressCheck = true;
		}		
		
		/* 최종 유효성 검사 */
		if(idCheck&&idckCheck&&pwCheck&&pwckCheck&&pwckcorCheck&&nameCheck&&mailCheck&&mailnumCheck&&addressCheck ){

			$("#join_form").attr("action", "/member/join");
			$("#join_form").submit();			
			
		}		
		
		return false;

	});
});




/* 인증번호 이메일 전송 */
$("#button").click(function(){
	alert("인증번호가 발송되었습니다.");  
    var email = $("#user_email").val();        // 입력한 이메일
    var cehckBox = $("#user_num");        // 인증번호 입력란
    var boxWrap = $("#mail_check_input_box");    // 인증번호 입력란 박스
 
    $.ajax({
        
        type:"GET",
        url:"mailCheck?email=" + email,
        success:function(data){
        	
        	 //console.log("data : " + data);
            cehckBox.attr("disabled",false);
            boxWrap.attr("id", "mail_check_input_box__true");
            code = data;
        }
                
    });
    
});
/* 인증번호 비교 */
$("#user_num").blur(function(){
	
	var inputCode = $("#user_num").val();		// 입력코드	
	var checkResult = $("#user_num2");	// 비교 결과 	
	
	if(inputCode == code){							// 일치할 경우
		checkResult.html("인증번호가 일치합니다.");
		checkResult.attr("class", "correct");		
		mailnumCheck = true;
	} else {											// 일치하지 않을 경우
		checkResult.html("인증번호를 다시 확인해주세요.");
		checkResult.attr("class", "incorrect");
		mailnumCheck = false;
	}	
	
	
	
}); 
          







//아이디 중복검사
$("#user_id").on("propertychange change keyup paste input", function(){

	/* console.log("keyup 테스트"); */
	
	var user_id = $("#user_id").val();			// .id_input에 입력되는 값
	var data = {user_id : user_id}				// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
	
	$.ajax({
		type : "post",
		url : "/member/memberIdChk",
		data : data,
		success : function(result){
			// console.log("성공 여부" + result);
			if(result != 'fail'){
				$('.id_input_re_1').css("display","inline-block");
				$('.id_input_re_2').css("display", "none");	
				idckCheck = true;
			} else {
				$('.id_input_re_2').css("display","inline-block");
				$('.id_input_re_1').css("display", "none");
				idckCheck = false;
			}	
		}// success 종료
	}); // ajax 종료	

});// function 종료



/* 다음 주소 연동 */
function execution_daum_address(){
	
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            
            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 주소변수 문자열과 참고항목 문자열 합치기
      			addr += extraAddr;
            
            } else {
                addr += ' ';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            $("#user_address1").val(data.zonecode);
            //$("[name=memberAddr1]").val(data.zonecode);	// 대체가능
            $("#user_address2").val(addr);
            //$("[name=memberAddr2]").val(addr);			// 대체가능
            // 상세주소 입력란 disabled 속성 변경 및 커서를 상세주소 필드로 이동한다.
            $("#user_address3").attr("readonly",false);
            $("#user_address3").focus();
            
        }
    }).open();   
    
}

/* 비밀번호 확인 일치 유효성 검사 */

$("#user_pw2").on("propertychange change keyup paste input", function(){
	
	var pw = $("#user_pw").val();
	var pwck = $("#user_pw2").val();
	$('.final_pwck_ck').css('display', 'none');
	
	if(pw == pwck){
		$('.pwck_input_re_1').css('display','block');
		$('.pwck_input_re_2').css('display','none');
		pwckcorCheck = true;
	}else{
		$('.pwck_input_re_1').css('display','none');
		$('.pwck_input_re_2').css('display','block');
		pwckcorCheck = false;
	}
	
	
});



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
	
	
	
  
  
  

</script>


</body>
</html>
