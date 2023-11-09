<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">
<!-- Css Styles -->
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="../resources/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="../resources/css/themify-icons.css" type="text/css">
<link rel="stylesheet" href="../resources/css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="../resources/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="../resources/css/nice-select.css" type="text/css">
<link rel="stylesheet" href="../resources/css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="../resources/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="../resources/css/style.css" type="text/css">

<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"/></script>
<title>이벤트 상세정보</title>

</head>
<body>
<%@ include file="../includes/header.jsp" %>
<!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <a href="/"><i class="fa fa-home"></i> Home</a>
                        <span>Event</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section Begin -->
	<div class="container">
		<br>
		<h4>&nbsp;이벤트 상세정보 </h4>
		<br>
	</div>
	<hr>
	<div class="container">
        <img id="preview" src="/event/display?fileName=${pageInfo.event_image}" style="max-width: 100%;">
        <br>
        <br>
			<!-- 게시판번호 -->
			<div class="form-group row">
				<label class="col-sm-2 control-label">번호</label>
				<div class="col-sm-5">
					<input name="event_eno" readonly="readonly" class="form-control"
						value='<c:out value="${pageInfo.event_eno}"/>'>
				</div>
			</div>
			<!--제목-->
			<div class="form-group row">
				<label class="col-sm-2 control-label">제목</label>
				<div class="col-sm-5">
					<input name="event_title" class="form-control" readonly="readonly" value='<c:out value="${pageInfo.event_title}"/>'>
				</div>
			</div>

			<!--게시판내용 -->
			<div class="form-group row">
				<label class="col-sm-2 control-label">내용</label>
				<div class="col-sm-8" class="form-control" style="word-break: break-all;">
					<textarea rows="3" name="event_content" readonly="readonly" class="form-control" cols="50" rows="5"><c:out value="${pageInfo.event_content}" /></textarea>
				</div>
			</div>

			<!-- 등록일 -->
			<div class="form-group row">
				<label class="col-sm-2 control-label">등록일</label>
				<div class="col-sm-5">
					<input name="event_regdater" class="form-control" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.event_regdate}"/>'>
				</div>
			</div>
			
			<!-- 이미지 -->
<%-- 			<div class="form-group row">
				<label class="col-sm-2 control-label">이벤트 이미지</label>
				<div class="col-sm-5">
					<input class="form-control" readonly="readonly" id="event_image" name="event_image" value="${pageInfo.event_image}">
				</div>
			</div> --%>
			<br>
			<div class="form-group row" align="right">
				<div class="col-sm-offset-2 col-sm-10 ">
		        	<a href="/event/eventlist" id="list_btn" class="btn primary-btn" >목록</a> 
		        	<c:if test="${user.user_admin == 1 }">
		        	<a href="/event/eventmodify?event_eno=${pageInfo.event_eno}" id="modify_btn" class="btn primary-btn" >수정 하기</a>
		        	</c:if>
				</div> 
			</div>
			<br>
		</div>

	<form id="infoForm" action="/event/eventget" method="get">
		<input type="hidden" id="event_eno" name="event_eno" value='<c:out value="${pageInfo.event_eno}"/>'>
	</form>

<script>
	let form = $("#infoForm"); // 페이지 이동 form(리스트 페이지 이동, 조회 페이지 이동)
	let mForm = $("#modifyForm"); // 페이지 데이터 수정 from

	/* 목록 페이지 이동 버튼 */
	$("#list_btn").on("click", function(e) {
		form.find("#event_eno").remove();
		form.attr("action", "/event/eventlist");
		form.submit();
	});

	/* 수정 하기 버튼 */
	$("#modify_btn").on("click", function(e) {

		mForm.submit();
	});

	

	
	
	/* 이미지 업로드 */
	$("input[type='file']").on("change", function(e){
		let formData = new FormData();
		let fileInput = $('input[name="fileItem"]');
		let fileList = fileInput[0].files;
		let fileObj = fileList[0];
		
	 	if(!fileCheck(fileObj.name, fileObj.size)){
			return false;
		}
		formData.append("event_image", fileObj);
		alert("통과");
		$.ajax({
		    url: '/event/uploadAjaxAction',
		    processData : false,
		    contentType : false,
		    data : formData,
		    type : 'POST',
		    dataType : 'json',
		    success: function(result){
		        // 파일 업로드 결과를 input 요소에 넣어주는 부분
		        $("#event_image").val(result.fileName);

		        // 미리보기 생성
		        $("#preview").attr("src", "/event/display?fileName="+result.fileName);
		        alert("파일 업로드 완료!");
		    },

		    error : function(result){
		        alert("이미지 파일이 아닙니다.");
		    }
		}).always(function(){
		    // 파일 업로드가 끝난 후 input 요소에 값을 할당해주는 부분
		    $("input[type='file']").val("");
		});
	});


</script>
<jsp:include page="../includes/footer.jsp" />
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
</html>