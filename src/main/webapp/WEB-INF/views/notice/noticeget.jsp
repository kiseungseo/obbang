<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		<h4>&nbsp;공지사항</h4>
		<br>
			<!-- 게시판번호 -->
			<div class="form-group row">
				<label class="col-sm-2 control-label">번호</label>
				<div class="col-sm-5">
					<input name="notice_nno" readonly="readonly"class="form-control" value='<c:out value="${pageInfo.notice_nno}"/>' >
				</div>
			</div>
		
			<!--제목-->
			<div class="form-group row">
				<label class="col-sm-2 control-label">제목</label>
				<div class="col-sm-5">
					<input name="notice_title" readonly="readonly" class="form-control" value='<c:out value="${pageInfo.notice_title}"/>' >
				</div>
			</div>
			<!--게시판내용 -->
			<div class="form-group row">
				<label class="col-sm-2 control-label">내용</label>
				<div class="col-sm-8" style="word-break: break-all;">
				 <%-- <img id="preview" src="/event/display?fileName=${pageInfo.notice_image}" style="max-width: 100%;"> --%>
				 <img id="preview" src="/notice/display?fileName=${pageInfo.notice_image}" onerror="this.onerror=null;this.src='/notice/display?fileName=no-image.png';" style="max-width: 100%;">
					<textarea name="notice_content" class="form-control" readonly="readonly" cols="150" rows="15"><c:out value="${pageInfo.notice_content}"/></textarea>
				</div>
			</div>
			<!--작성자  -->
			<div class="form-group row">
				<label class="col-sm-2 control-label">작성자</label>
				<div class="col-sm-5">
				
				   <input name="notice_writer" class="form-control" readonly="readonly"value='<c:out value="${pageInfo.notice_writer}"/>'>
				</div>
			</div>
			<!-- 등록일 -->
			<div class="form-group row">
				<label class="col-sm-2 control-label">등록일</label>
				<div class="col-sm-5">
					<input name="notice_regdater" class="form-control" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.notice_regdate}"/>' >
				</div>
			</div>
			<br>
			<!-- 버튼	 -->
			<div class="form-group row" align="right">
				<div class="col-sm-offset-2 col-sm-10 ">
		        	<a href="/notice/noticelist" id="list_btn" class="btn primary-btn" >목록</a> 
		        	<a href="/notice/noticemodify?notice_nno=${pageInfo.notice_nno}" id="modify_btn" class="btn primary-btn" >수정 하기</a>
				</div> 
			</div>
		
		</div>
		<br>
		<br>
		<form id="infoForm" action="/notice/noticemodify" method="get" >
			<input type="hidden" id="notice_nno" name="notice_nno" value='<c:out value="${pageInfo.notice_nno}"/>'>
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
			<input type="hidden" name="type" value="${cri.type }">  
			<input type="hidden" name="keyword" value="${cri.keyword }">
		</form>
<script>
	let form = $("#infoForm");
	
	$("#list_btn").on("click", function(e){
		form.find("#notice_nno").remove();
		form.attr("action", "/notice/noticelist");
		form.submit();
	});
	
	$("#modify_btn").on("click", function(e){
		form.attr("action", "/notice/noticemodify");
		form.submit();
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