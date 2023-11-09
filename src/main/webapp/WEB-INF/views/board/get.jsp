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

<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<title>Insert title here</title>
<script>
function replyCheck() {
  var user_replyname = $('#user_replyname').val();
  var reply_content = $('#reply_content').val();
  
  if (user_replyname.trim() === "") {
    alert('댓글 작성자를 입력해주세요.');
    $('#user_replyname').focus();
    return false;
  }

  if (reply_content.trim() === "") {
    alert('댓글 내용을 입력해주세요.');
    $('#reply_content').focus();
    return false;
  }
}
function confirmDelete(reply_rno) {
    if (confirm("정말로 삭제하시겠습니까?")) {
        delete_reply(reply_rno);
    }
}


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
   		<div class="blog-details-inner">
            <div class="leave-comment">
                <form class="comment-form" >
		<br>
		<h4>문의사항</h4>
		<br>
		<br>
		<!-- 게시판번호 -->
		<div class="form-group row">
			<label class="col-sm-2 control-label">번호</label>
			<div class="col-sm-5">
			  <input type="text" name="board_bno"  readonly="readonly" value="${pageInfo.board_bno}">
			</div>
		</div>
	
		<!--제목-->
		<div class="form-group row">
			<label class="col-sm-2 control-label">제목</label>
			<div class="col-sm-5">
				<input type="text" name="board_title"  readonly="readonly" value="${pageInfo.board_title}">
			</div>
		</div>
		<!--게시판내용 -->
		<div class="form-group row">
			<label class="col-sm-2 control-label">내용</label>
			<div class="col-sm-8" style="word-break: break-all;">
				 <textarea  rows="8" name="board_content" readonly="readonly" cols="50" rows="5"><c:out value="${pageInfo.board_content}"/></textarea>
			</div>
		</div>
		<!--작성자  -->
		<div class="form-group row">
			<label class="col-sm-2 control-label">작성자</label>
			<div class="col-sm-5">
				<input name="user_id" readonly="readonly" value="${pageInfo.user_id}">
			</div>
		</div>
		<!-- 등록일 -->
		<div class="form-group row">
			<label class="col-sm-2 control-label">등록일</label>
			<div class="col-sm-5">
				<input name="board_regdater"  readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.board_regdate}"/>' >
			</div>
		</div>
		</form>
		<br>
		
		<!-- 버튼	 -->
		<div class="form-group row" align="right">
			<div class="col-sm-offset-2 col-sm-10 ">
	        	<a href="/board/list" id="list_btn" class="btn primary-btn" >목록</a> 
	        	<c:if test="${user.user_id eq pageInfo.user_id}">
	        	<a href="/board/modify?board_bno=${pageInfo.board_bno}" id="modify_btn" class="btn primary-btn" >수정 하기</a>
				</c:if>
			</div> 
		</div>
		
		<!-- 댓글기능 -->
		<hr>
		<ul>
			<c:forEach items="${reply}" var="reply">
				<li>
				    <div class="blog-item">
				       	<div class="bi-text p"><p>작성자 : ${reply.user_replyname} <span>/ 등록일 : 
				        <fmt:formatDate value="${reply.reply_regDate}" pattern="yyyy-MM-dd" /></span>
				       	</p> </div>
				        <p><b>${reply.reply_content }</b></p>
				       	<p>
				       	<c:if test="${user.user_id eq reply.user_id}">
					       	<button id="update_reply_btn" type="button" class="btn primary-small-btn" onclick="update_reply('${reply.reply_rno}')">수정</button> 
					       	<button id="delete_reply_btn" type="button" class="btn primary-small-btn" onclick="confirmDelete('${reply.reply_rno}')" >삭제</button>
					    </c:if>
				       	</p> 
						<hr>
				    </div>
				</li>    
			</c:forEach>
		</ul>
		<div class="blog-details-inner">
            <div class="leave-comment">
                <h4>Comment</h4>
                <form class="comment-form" method="post" action="/boardReply/write" onsubmit="return replyCheck();">
                    <div class="row">
                        <div class="col-lg-6">
                            <input type="text" id="user_replyname" name="user_replyname" placeholder="name" readonly="readonly" value="${user.user_name}">
                        	<input name="user_id" type="hidden" id="user_id" class="form-control" readonly="readonly" value="${user.user_id}" >
                        </div>
                        <div class="col-lg-12">
                            <textarea name="reply_content" id="reply_content" placeholder="Comment mesage"></textarea>
                            <input type="hidden" name="board_bno" value="${pageInfo.board_bno}">
                            <button type="submit" class="btn primary-btn">댓글 작성</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
		<br>
		<br>
		<form id="infoForm" action="/board/modify" method="get" >
			<input type="hidden" id="board_bno" name="board_bno" value='<c:out value="${pageInfo.board_bno}"/>'>
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
			<input type="hidden" name="type" value="${cri.type }">  
			<input type="hidden" name="keyword" value="${cri.keyword }">
		</form>
		
		</div>
		</div>
	</div>
<script>
	let form = $("#infoForm");
	
	$("#list_btn").on("click", function(e){
		form.find("#board_bno").remove();
		form.attr("action", "/board/list");
		form.submit();
	});
	
	$("#modify_btn").on("click", function(e){
		form.attr("action", "/board/modify");
		form.submit();
	});	
	
	/* 댓글 수정 버튼 */
	function update_reply(reply_rno){
		let popUrl = "/boardReply/getUpdate?reply_rno=" + reply_rno;
		let popOption = "width = 490px, height=420px, top=300px, left=300px, scrollbars=yes"	

		window.open(popUrl,"리뷰 수정",popOption);
	};
	
	/* 댓글 삭제 버튼 */
	
	function delete_reply(reply_rno){
		$.ajax({
			data : {
				reply_rno : reply_rno,
				board_bno : '${pageInfo.board_bno}'
			},
			url : '/boardReply/delete',
			type : 'POST',
			success : function(result){
				alert('댓글이 삭제 되었습니다.');
				//페이지이동
				window.location.href = '/board/get?board_bno=${pageInfo.board_bno}';
			},
            error: function (request, status, error) {
                console.log(request, status,error);
            }
		});
	
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