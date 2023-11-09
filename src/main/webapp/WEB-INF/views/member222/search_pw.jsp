<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>    
 
<script>
var path = "${pageContext.request.contextPath }";
 
$(document).ready(function() {
var msg = "${msg}";
if(msg != ""){
alert(msg);    
}
});
 
 
function fnSubmit() {
 
var email_rule =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
var tel_rule = /^\d{2,3}-\d{3,4}-\d{4}$/;


if ($("#user_id").val() == null || $("#user_id").val() == "") {
	alert("아이디를 입력해주세요.");
	$("#user_id").focus();
	 
	return false;
	}
 
if ($("#user_name").val() == null || $("#user_name").val() == "") {
alert("이름을 입력해주세요.");
$("#user_name").focus();
 
return false;
}
 
if ($("#user_phone").val() == null || $("#user_phone").val() == "") {
alert("전화번호를 입력해주세요.");
$("#user_phone").focus();
 
return false;
}
 
if(!tel_rule.test($("#user_phone").val())){
alert("전화번호 형식에 맞게 입력해주세요.");
return false;
}
 
 
if (confirm("비밀번호를 찾으시겠습니까?")) {
 
$("#createForm").submit();
 
return false;
}
}
 
</script>
 
<head>
<title>비밀번호 찾기</title>
</head>
 
<form name="searchVO" id="createForm" action="${path}/member/search_result_pw" method="post">
 
<body class="bg-gradient-primary">
<div class="container">
<!-- Outer Row -->
<div class="row justify-content-center">
 
<div class="col-xl-10 col-lg-12 col-md-9">
 
<div class="card o-hidden border-0 shadow-lg my-5">
<div class="card-body p-0">
<!-- Nested Row within Card Body -->
<div class="row">
<div class="col-lg-6 d-none d-lg-block bg-password-image"></div>
<div class="col-lg-6">
<div class="p-5">
  <div class="text-center">
      <h1 class="h4 text-gray-900 mb-2">비밀번호 찾기</h1>
      <p class="mb-4">당신의 아이디,이름, 핸드폰 번호를 정확히 입력해주세요.</p>
  </div>
      <div class="form-group">
          <input type="text" class="form-control form-control-user"
              id="user_id" name="user_id"
              placeholder="아이디를 입력하세요...">
      </div>
      <div class="form-group">
          <input type="text" class="form-control form-control-user"
              id="user_name" name="user_name"
              placeholder="이름을 입력하세요...">
      </div>
      <div class="form-group">
          <input type="email" class="form-control form-control-user"
              id="user_phone" name="user_phone"
              placeholder="핸드폰번호를 입력하세요...">
      </div>
      <a href="javascript:void(0)" onclick="fnSubmit(); return false;" class="btn btn-primary btn-user btn-block">
          비밀번호 찾기
      </a>
  <hr>
     <div class="text-center">
      <a class="small" href="/member/join">회원가입을 하시겠습니까?</a>
  </div>
  <div class="text-center">
      <a class="small" href="/member/login">다시 로그인을 하시겠습니까?</a>
  </div>
</div>
</div>
</div>
</div>
</div>
 
</div>
 
</div>
 
</div>
 
 
</body>
 
 
</form>
</html>
