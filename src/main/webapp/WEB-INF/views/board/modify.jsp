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

<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous">
</script>
<title>문의사항</title>
<script type="text/javascript">

</script>
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
                        <span>Board</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section Begin -->
	<div class="container">
		<br>
		<h4>&nbsp;문의사항 수정하기</h4>
		<br>
	<hr>
		<p>&nbsp;</p>
		<form id="modifyForm" action="/board/modify" method="post">
			<!-- 게시판번호 -->
			<div class="form-group row">
				<label class="col-sm-2 control-label">번호</label>
				<div class="col-sm-5">
					<input name="board_bno" readonly="readonly" class="form-control"
						value='<c:out value="${pageInfo.board_bno}"/>'>
				</div>
			</div>


			<!--제목-->
			<div class="form-group row">
				<label class="col-sm-2 control-label">제목</label>
				<div class="col-sm-5">
					<input name="board_title" class="form-control"
						value='<c:out value="${pageInfo.board_title}"/>'>
				</div>
			</div>

			<!--게시판내용 -->
			<div class="form-group row">
				<label class="col-sm-2 control-label">내용</label>
				<div class="col-sm-8" class="form-control"
					style="word-break: break-all;">

					<textarea rows="3" name="board_content" class="form-control"
						cols="50" rows="5"><c:out
							value="${pageInfo.board_content}" /></textarea>
				</div>
			</div>


			<!--작성자  -->
			<div class="form-group row">
				<label class="col-sm-2 control-label">작성자</label>
				<div class="col-sm-5">
					<input name="user_boardname" readonly="readonly" class="form-control"
						value='<c:out value="${pageInfo.user_boardname}"/>'>
				</div>
			</div>

			<!-- 등록일 -->
			<div class="form-group row">
				<label class="col-sm-2 control-label">등록일</label>
				<div class="col-sm-5">
					<input name="board_regdater" class="form-control"
						readonly="readonly"
						value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.board_regdate}"/>'>
				</div>
			</div>
			<br>
			
			<!-- 버튼  -->
			<div class="form-group row" align="right">
				<div class="col-sm-offset-2 col-sm-10 text-white">
					<a class="btn primary-btn" href="/board/list"> 목록 페이지</a>
					<a class="btn primary-btn" id="modify_btn" href="#">수정 완료</a> 
						<a class="btn primary-btn" id="cancel_btn" href="#">수정 취소</a>
						<a class="btn danger-btn" id="confirmDelete" href="#">삭제</a> 
				</div>
			</div>
		</form>
	</div>
	<br>

			<form id="infoForm" action="/board/modify" method="get">
				<input type="hidden" id="board_bno" name="board_bno" value='<c:out value="${pageInfo.board_bno}"/>'>
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
					form.find("#board_bno").remove();
					form.attr("action", "/board/list");
					form.submit();
				});

				/* 수정 하기 버튼 */
				$("#modify_btn").on("click", function(e) {
					mForm.submit();
				});

				/* 취소 버튼 */
				$("#cancel_btn").on("click", function(e) {
					form.attr("action", "/board/get");
					form.submit();
				});
				
				/* 삭제 체크 하고 삭제 함수 호출*/
				$("#confirmDelete").on("click", function(e){
				    if (confirm("정말로 삭제하시겠습니까?")) {
				    	delete_btn(board_bno);
				    }
				});
				/* 삭제 함수 */
				function delete_btn (board_bno) {
					form.attr("action", "/board/delete");
					form.attr("method", "post");
					form.submit();
				};
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