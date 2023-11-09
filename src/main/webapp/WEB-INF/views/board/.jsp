<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>

</head>
<body>
<%@ include file="../includes/header.jsp"%>
	<div class="container">
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<p>&nbsp;</p>
	</div>
	<div class="container">
		<p>&nbsp;</p>	
		<h4>&nbsp;문의사항 수정하기</h4><jsp:include page="boardMenu.jsp" />
	</div>
	<hr>
	<div class="container">
		<p>&nbsp;</p>
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

			<!-- 수정일 -->
			<div class="form-group row">
				<label class="col-sm-2 control-label">수정일</label>
				<div class="col-sm-5">
					<input name="board_updateDate" class="form-control"
						readonly="readonly"
						value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.board_updateDate}"/>'>
				</div>
			</div>

			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 btn text-white">
					<a class="btn btn-primary" href="/board/list"> 목록 페이지</a>
					<a class="btn btn-primary" id="modify_btn">수정 완료</a> 
						<a class="btn btn-primary" id="cancel_btn">수정 취소</a>
						<a class="btn btn-danger" id="delete_btn">삭제</a> 
				</div>
			</div>
		</form>
	</div>

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

				/* 삭제 버튼 */
				$("#delete_btn").on("click", function(e) {
					form.attr("action", "/board/delete");
					form.attr("method", "post");
					form.submit();
				});
			</script>
			<hr>
	<%@ include file="../includes/footer.jsp"%>
</body>
</html>