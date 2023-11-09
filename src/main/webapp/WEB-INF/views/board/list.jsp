<%@ page language="java" contentType="text/html; charset=utf-8"%>
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
<link rel="stylesheet" href="../resources/css/main2.css" type="text/css">

<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous">
</script>
<title>boardList</title>


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
		<h4>문의사항</h4>
		<br>
		<div>
		<!-- 전체 글 수 -->
			<div class="text-left">
				<span class="badge badge-dark">전체 ${pageMaker.total}건</span>
			</div>

		<!-- 검색 기능-->
			<div class="inner-search" align="right">
				<div  class="col-lg-7 col-md-7">
					<div class="advanced-search">
		                <select name="type" class="category-btn">
							<option value="T"<c:out value="${pageMaker.cri.type eq 'T'?'selected':'' }"/>>제목</option>
							<option value="C"<c:out value="${pageMaker.cri.type eq 'C'?'selected':'' }"/>>내용</option>
							<option value="W"<c:out value="${pageMaker.cri.type eq 'W'?'selected':'' }"/>>작성자</option>
							<option value="TC"<c:out value="${pageMaker.cri.type eq 'TC'?'selected':'' }"/>>제목+ 내용</option>
							<option value="TW"<c:out value="${pageMaker.cri.type eq 'TW'?'selected':'' }"/>>제목+ 작성자</option>
							<option value="TCW"<c:out value="${pageMaker.cri.type eq 'TCW'?'selected':'' }"/>>제목+ 내용 + 작성자</option>
						</select> 
		                	<div class="input-group-search">
		                    <input type="text" name="keyword" value="${pageMaker.cri.keyword }">							
		                        <button type="button" id="sbtn"><i class="ti-search"></i></button>
		                    </div>
		                </div>
	                </div>
                </div>
			</div>
			
			<!-- 테이블 수정해본거 안쓸거면 지워 main2.css도 -->
			<div class="limiter">
				<div class="container-table100">
					<div class="wrap-table100">
						<div class="table">
							<div class="row1 header">
								<div class="cell">번호</div>
								<div class="cell">제목</div>
								<div class="cell">작성자</div>
								<div class="cell">작성일</div>
							</div>
							<c:forEach items="${list}" var="list">
							<div class="row1">
								<div class="cell" data-title="Full Name"><c:out value="${list.board_bno}" /></div>
								<div class="cell" data-title="Age"><b><a class="move" href='<c:out value="${list.board_bno}"/>'> <c:out value="${list.board_title}" /> 
							</a><span class="badge rounded-pill bg-warning"><c:out value="${list.reply_count}" /></span></b> </div>
								<div class="cell" data-title="Job Title"><c:out value="${list.user_boardname}" /></div>
								<div class="cell" data-title="Location"><fmt:formatDate pattern="yyyy/MM/dd" value="${list.board_regdate}" /></div>
							</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
			
			<div id="pageing" align="center">
				<!-- 이전페이지 버튼 -->
				<c:if test="${pageMaker.prev}">
					<a href="${pageMaker.startPage-1}">Previous</a>
				</c:if>
				<c:set var="pageNum" value="${pageMaker.cri.pageNum}" />
				<c:forEach var="i" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
					<a href="<c:url value="${i}"/>"> 
						<c:choose>
							<c:when test="${pageNum==i}">
								<font color='e7ab3c'><b> [${i}]</b></font>
							</c:when>
							<c:otherwise>
									<font color='4C5317'> [${i}]</font>
							</c:otherwise>
						</c:choose>
					</a>
				</c:forEach>
					
				<!-- 다음페이지 버튼 -->
				<c:if test="${pageMaker.next}">
						<a href="${pageMaker.endPage + 1 }">Next</a>
				</c:if>
			</div>
			<div align="right">
				<a href="/board/enroll" onclick="checkForm(); return false;" class="btn primary-btn">글쓰기</a>
			</div>
			<br>
			<br>
			<form id="moveForm" method="get">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }"> 
				<input type="hidden" name="amount" value="${pageMaker.cri.amount }"> 
				<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
				<input type="hidden" name="type" value="${pageMaker.cri.type }">
			</form>
		</div>
<script>
	$(document).ready(function() {
	//댓글 목록 출력 함수
	function listReply(num){
		$.ajax({
			type: "post", //post방식으로 자료를 
			url: "/board/list?board_bno=${board.board_bno}", //컨트롤러에 있는 list.do로 맵핑하고 현재페이지와 게시판 번호도 같이 보낸다.
			success: function(result)
			//자료를 보내는것이 성공했을때 출력되는 메시지//result : responseText 응답텍스트(html)
			{ console.log(result);
			$("#listReply").html(result);
			 }
		});
	}

			let result = '<c:out value="${result}"/>';

			checkAlert(result);

			function checkAlert(result) {

			if (result === '') {
				return;
			}

			if (result === "enrol success") {
				alert("등록이 완료되었습니다.");
			}

			if (result === "modify success") {
				alert("수정이 완료되었습니다.");
			}
			if (result === "delete success") {
				alert("삭제가 완료되었습니다.");
					}
				}
			});
			let moveForm = $("#moveForm");
			//디테일 버튼
			$(".move").on("click",function(e) {
				e.preventDefault();
				moveForm.append("<input type='hidden' name='board_bno' value='"+ $(this).attr("href") + "'>");
				moveForm.attr("action", "/board/get");
				moveForm.submit();
			});
		    //아래꺼 페이징 연결하는 함수
		    $("#pageing a").on("click", function(e){
		        e.preventDefault();
		        moveForm.find("input[name='pageNum']").val($(this).attr("href"));
		        moveForm.attr("action", "/board/list");
		        moveForm.submit();
		    });
	//검색시 버튼 함수
    $("#sbtn").on("click", function(e){
        e.preventDefault();
        let type = $("select").val();
        let keyword = $("input[name='keyword']").val();
        if(!type){
            alert("검색 종류를 선택하세요.");
            return false;
        }
        if(!keyword){
            alert("키워드를 입력하세요.");
            return false;
        }        
        moveForm.find("input[name='type']").val(type);
        moveForm.find("input[name='keyword']").val(keyword);
        moveForm.find("input[name='pageNum']").val(1);
        moveForm.submit();
    });
</script>
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
<jsp:include page="../includes/footer.jsp" />
</body>
</html>