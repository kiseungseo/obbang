	<%@ page contentType="text/html; charset=utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
  <style>
<style type="text/css">
.input_wrap{
	padding: 5px 20px;
}
label{
    display: block;
    margin: 10px 0;
    font-size: 20px;	
}
input{
	padding: 5px;
    font-size: 17px;
}
textarea{
	width: 800px;
    height: 200px;
    font-size: 15px;
    padding: 10px;
}
.btn{
  	display: inline-block;
    font-size: 22px;
    padding: 6px 12px;
    background-color: #fff;
    border: 1px solid #ddd;
    font-weight: 600;
    width: 140px;
    height: 41px;
    line-height: 39px;
    text-align : center;
    margin-left : 30px;
    cursor : pointer;
}
.btn_wrap{
	padding-left : 80px;
	margin-top : 50px;
}
#delete_btn{
    background-color: #f3e3e7;
}
 
</style>
</head>
<body>
<%@ include file="../includes/header.jsp"%>
	<div class="container">
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<h1>회원 정보 수정</h1>
	</div>
	<hr>
<form id="modifyForm" action="/member/modify" method="post">


	<div class="input_wrap">
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
	</div>
	
	<div class="btn_wrap">
		<c:if test="${user.user_admin == 1 }">
		 <a class="btn" id="list_btn">목록 페이지</a> 
		</c:if>
        <a class="btn" id="modify_btn">수정 완료</a>
        <a class="btn" id="cancel_btn">수정 취소</a>
         <a class="btn" id="delete_btn">회원 탈퇴</a>
	</div>
	</form>
	<form id="infoForm" action="/member/modify" method="get">
		<input type="hidden" id="user_bno" name="user_bno" value='<c:out value="${pageInfo.user_bno}"/>'>
	</form>
	
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

	<hr>
	<%@ include file="../includes/footer.jsp"%>
</body>
</html>