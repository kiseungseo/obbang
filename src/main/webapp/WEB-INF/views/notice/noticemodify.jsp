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
<title>공지사항</title>

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
                        <span>Notice</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section Begin -->
	<div class="container">
		<br>
		<h4>공지사항</h4>
		<br>
		<form id="modifyForm" action="/notice/noticemodify" method="post">

			<!-- 게시판번호 -->
			<div class="form-group row">
				<label class="col-sm-2 control-label">번호</label>
				<div class="col-sm-5">
					<input name="notice_nno" readonly="readonly" class="form-control"
						value='<c:out value="${pageInfo.notice_nno}"/>'>
				</div>
			</div>

			<!--제목-->
			<div class="form-group row">
				<label class="col-sm-2 control-label">제목</label>
				<div class="col-sm-5">
					<input name="notice_title" class="form-control"
						value='<c:out value="${pageInfo.notice_title}"/>'>
				</div>
			</div>

			<!--게시판내용 -->
			<div class="form-group row">
				<label class="col-sm-2 control-label">내용</label>
				<div class="col-sm-8" class="form-control"style="word-break: break-all;">
				<!-- 이미지노출 -->
				<%-- <img id="preview" src="/notice/display?fileName=${pageInfo.notice_image}" style="max-width: 100%;"> --%>
				<img id="preview" src="/notice/display?fileName=${pageInfo.notice_image}" onerror="this.onerror=null;this.src='/notice/display?fileName=no-image.png';" style="max-width: 100%;">
					<textarea rows="3" name="notice_content" class="form-control" cols="50" rows="5">
					<c:out value="${pageInfo.notice_content}" /></textarea>
				</div>
			</div>


			<!--작성자  -->
			<div class="form-group row">
				<label class="col-sm-2 control-label">작성자</label>
				<div class="col-sm-5">
					<input name="notice_writer" readonly="readonly" class="form-control"
						value='<c:out value="${pageInfo.notice_writer}"/>'>
				</div>
			</div>

			<!-- 등록일 -->
			<div class="form-group row">
				<label class="col-sm-2 control-label">등록일</label>
				<div class="col-sm-5">
					<input name="notice_regdater" class="form-control"
						readonly="readonly"
						value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.notice_regdate}"/>'>
				</div>
			</div>
		    <div class="form-group row">
				<label class="col-sm-2 control-label" >이미지</label>
				<div class="col-sm-5">
		           <div class="form_section_content">
		           	<input class="btn btn-outline-dark" type="file" id="fileItem" name="fileItem" value="${pageInfo.notice_content}">
	           </div>
           </div>
           </div>
			<!-- 이벤트 이미지이름 -->
			<div class="form-group row">
				<label class="col-sm-2 control-label">이벤트 이미지</label>
				<div class="col-sm-5">
					<input class="form-control" readonly="readonly" id="notice_image" name="notice_image" value="${pageInfo.notice_image}">
				</div>
			</div>
			<br>

			<div class="form-group row" align="right">
				<div class="col-sm-offset-2 col-sm-10 text-white">
					<a class="btn primary-btn" href="/notice/noticelist"> 목록 페이지</a>
					<a class="btn primary-btn" id="modify_btn" href="#">수정 완료</a> 
					<a class="btn primary-btn" id="cancel_btn" href="#">수정 취소</a>
					<a class="btn danger-btn" id="confirmDelete" href="#">삭제</a> 
				</div>
			</div>
		</form>
		</div>
		<br>
		<br>
			<form id="infoForm" action="/notice/noticemodify" method="get">
				<input type="hidden" id="notice_nno" name="notice_nno" value='<c:out value="${pageInfo.notice_nno}"/>'>
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount }">  
				<input type="hidden" name="type" value="${cri.type }">
				<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
			</form>

			<script>
				let form = $("#infoForm"); // 페이지 이동 form(리스트 페이지 이동, 조회 페이지 이동)
				let mForm = $("#modifyForm"); // 페이지 데이터 수정 from

				/* 목록 페이지 이동 버튼 */
				$("#list_btn").on("click", function(e) {
					form.find("#notice_nno").remove();
					form.attr("action", "/notice/noticelist");
					form.submit();
				});

				/* 수정 하기 버튼 */
				$("#modify_btn").on("click", function(e) {

					mForm.submit();
				});

				/* 취소 버튼 */
				$("#cancel_btn").on("click", function(e) {
					form.attr("action", "/notice/noticeget");
					form.submit();
				});
				
				/* 삭제 체크 하고 삭제 함수 호출*/
				$("#confirmDelete").on("click", function(e){
				    if (confirm("정말로 삭제하시겠습니까?")) {
				    	delete_btn(notice_nno);
				    }
				});
				/* 삭제 버튼 */
					/* 삭제 함수 */
				function delete_btn (notice_nno) {
					form.attr("action", "/notice/delete");
					form.attr("method", "post");
					form.submit();
				};
				/* 이미지 업로드 */
				$("input[type='file']").on("change", function(e){
					let formData = new FormData();
					let fileInput = $('input[name="fileItem"]');
					let fileList = fileInput[0].files;
					let fileObj = fileList[0];
					
				 	if(!fileCheck(fileObj.name, fileObj.size)){
						return false;
					}
					formData.append("notice_image", fileObj);
					$.ajax({
					    url: '/notice/uploadAjaxAction',
					    processData : false,
					    contentType : false,
					    data : formData,
					    type : 'POST',
					    dataType : 'json',
					    success: function(result){
					        // 파일 업로드 결과를 input 요소에 넣어주는 부분
					        $("#notice_image").val(result.fileName);

					        // 미리보기 생성
					        $("#preview").attr("src", "/notice/display?fileName="+result.fileName);
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


				/* var, method related with attachFile */
				let regex = new RegExp("(.*?)\.(jpg|png)$");
				let maxSize = 1048576; //1MB	

				function fileCheck(fileName, fileSize){

					if(fileSize >= maxSize){
						alert("파일 사이즈 초과");
						return false;
					}
						  
					if(!regex.test(fileName)){
						alert("해당 종류의 파일은 업로드할 수 없습니다.");
						return false;
					}
					
					return true;		
					
				}
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