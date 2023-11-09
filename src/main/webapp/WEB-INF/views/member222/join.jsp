<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/member/join.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

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
 </script>

<style>
/* 가는 css */
#userJoin {
	text-align: center;
}

#userSex {
	text-align: left;
}
</style>
<title>회원 가입</title>

</head>

<body>
	<%@ include file="../includes/header.jsp"%>
	<div class="container">
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<div id="userJoin">회원 가입</div>
	</div>
	<hr>

	<div class="container">
		<form id="join_form" method="post">
			<div class="wrap">

				<div class="form-group row">
					<label class="col-sm-2">ID</label>
					<div class="col-sm-3">
						<input type="text" id="user_id" name="user_id"
							class="form-control">
					</div>
					<!-- <div>
						<input type="button" class="btn btn-primary" value="ID 중복 확인"
							onclick="#">
					</div> -->
					<span class="id_input_re_1">사용 가능한 아이디입니다.</span> 
					<span class="id_input_re_2">아이디가 이미 존재합니다.</span> 
					<span class="final_id_ck">아이디를 입력해주세요.</span>
				</div>


				<div class="form-group row">
					<label class="col-sm-2">Password</label>
					<div class="col-sm-3">
						<input type="text" id="user_pw" name="user_pw"
							class="form-control">
					</div>
					<span class="final_pw_ck">비밀번호를 입력해주세요.</span>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">Password 확인</label>
					<div class="col-sm-3">
						<input type="text" id="user_pw2" name="user_pw2"
							class="form-control">
					</div>
					<span class="final_pwck_ck">비밀번호 확인을 입력해주세요.</span> <span
						class="pwck_input_re_1">비밀번호가 일치합니다.</span> <span
						class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
				</div>


				<div class="mail_wrap">
				<div class="mail_name">이메일</div> 
				<div class="mail_input_box">
					<input class="mail_input" id="user_email" name="user_email">
				</div>
				<span class="final_mail_ck">이메일을 입력해주세요.</span>
				<div class="mail_check_wrap">
					<div class="mail_check_input_box">
						<input class="mail_check_input">
					</div>
					<div class="mail_check_button">
						<span>인증번호 전송</span>
					</div>
					<div class="clearfix"></div>
					<span id="mail_check_input_box_warn"></span>
				</div>
			</div>


				<div class="form-group row">
					<label class="col-sm-2">성별</label>
					<div id="userSex" class="col-sm-5">
						<input type="radio" name="user_sex" value="man">남자 <input
							type="radio" name="user_sex" value="woman">여자
					</div>
				</div>

				<div class="form-group row">
					<label class="col-sm-2">전화번호</label>
					<div class="col-sm-3">
						<input type="tel" name="user_phone" id="telInput" required
							pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" maxlength="13"
							placeholder="예) 010-1234-5678" class="form-control">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">이름</label>
					<div class="col-sm-2">
						<input type="text" name="user_name" class="form-control">
					</div>
					<span class="final_name_ck">이름을 입력해주세요.</span>
				</div>

				<div class="form-group row">
					<label class="col-sm-2">생년월일</label> <select name="user_year"
						id="user_year"></select> <select name="user_month" id="user_month"></select>
					<select name="user_day" id="user_day"></select>
				</div>


				<div class="form-group row">
					<label class="col-sm-2">주소</label>
					<div class="col-sm-5">
						<input type="text" name="user_address1" id="user_address1"
							class="form-control" readonly="readonly"> <input
							type="text" name="user_address2" id="user_address2"
							class="form-control" readonly="readonly"> <input
							type="text" name="user_address3" id="user_address3"
							class="form-control" readonly="readonly">
					</div>
					<span class="final_addr_ck">주소를 입력해주세요.</span>
					<div>
						<input type="button" class="btn btn-primary" value="주소찾기"
							onclick="execution_daum_address()">
					</div>
				</div>

			</div>

			<div class="form-group row" style="text-align: center;">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input class="join_button" type="button" class="btn btn-primary" value="가입하기" > 
						<a href="/store/home" class="btn btn-primary">가입취소</a>
				</div>
			</div>
		</form>
	</div>
<%@include file="../includes/footer.jsp"%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
/* 유효성 검사 통과유무 변수 */
var idCheck = false;            // 아이디
var idckCheck = false;            // 아이디 중복 검사
var pwCheck = false;            // 비번
var pwckCheck = false;            // 비번 확인
var pwckcorCheck = false;        // 비번 확인 일치 확인
var nameCheck = false;            // 이름
var mailCheck = false;            // 이메일
var mailnumCheck = false;        // 이메일 인증번호 확인
var addressCheck = false         // 주소

var code = "";  //이메일전송 인증번호 저장위한 코드

$(document).ready(function(){
	//회원가입 버튼(회원가입 기능 작동)
	$(".join_button").click(function(){
	        
	        /* 입력값 변수 */
	        var id = $('.id_input').val();                 // id 입력란
	        var pw = $('.pw_input').val();                // 비밀번호 입력란
	        var pwck = $('.pwck_input').val();            // 비밀번호 확인 입력란
	        var name = $('.user_input').val();            // 이름 입력란
	        var mail = $('.mail_input').val();            // 이메일 입력란
	        var addr = $('.address_input_3').val();        // 주소 입력란
	        
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
				 
	        	$("#join_form").attr("action", "/member/join"); //
				$("#join_form").submit();
	        }    
	       
	        return false; 
	    });
		
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

/* 인증번호 이메일 전송 */
$(".mail_check_button").click(function(){
    
    var email = $(".mail_input").val();            // 입력한 이메일
    var cehckBox = $(".mail_check_input");         // 인증번호 입력란
    var boxWrap = $(".mail_check_input_box");      // 인증번호 입력란 박스
    var warnMsg = $(".mail_input_box_warn");       // 이메일 입력 경고글
    
    /* 이메일 형식 유효성 검사 */
    if(mailFormCheck(email)){
        warnMsg.html("이메일이 전송 되었습니다. 이메일을 확인해주세요.");
        warnMsg.css("display", "inline-block");
    } else {
        warnMsg.html("올바르지 못한 이메일 형식입니다.");
        warnMsg.css("display", "inline-block");
        return false;
    }    
    
    $.ajax({
        
        type:"GET",
        url:"mailCheck?email=" + email,
        success:function(data){
            
            //console.log("data : " + data);
             cehckBox.attr("disabled",false);
      		 boxWrap.attr("id", "mail_check_input_box_true");
      		 code = data;
            
        }
                
    });
});

    /* 인증번호 비교 */
    $(".mail_check_input").blur(function(){
    	
    	var inputCode = $(".mail_check_input").val();        // 입력코드    
        var checkResult = $("#mail_check_input_box_warn");    // 비교 결과
        
        if(inputCode == code){                            // 일치할 경우
            checkResult.html("인증번호가 일치합니다.");
            checkResult.attr("class", "correct");
            mailnumCheck = true;     // 일치할 경우
            
        } else {                                            // 일치하지 않을 경우
            checkResult.html("인증번호를 다시 확인해주세요.");
            checkResult.attr("class", "incorrect");
            mailnumCheck = false;    // 일치하지 않을 경우
        }    
        
    });



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

	<hr>
</body>
</html>