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
<link rel="stylesheet" href="../resources/css/main2.css" type="text/css">

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
								<option value=""<c:out value="${pageMaker.cri.type == null?'selected':'' }"/>>--</option>
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
								<div class="cell" data-title="Full Name"><c:out value="${list.notice_nno}" /></div>
								<div class="cell" data-title="Age"><b><a class="move" href='<c:out value="${list.notice_nno}"/>'> <c:out value="${list.notice_title}" />
								</a></b>
								</div> 
								<div class="cell" data-title="Job Title"><c:out value="${list.notice_writer}" /></div>
								<div class="cell" data-title="Location"><fmt:formatDate pattern="yyyy/MM/dd" value="${list.notice_regdate}" /></div>
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
					<c:forEach var="i" begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}">
						<a href="<c:url value="${i}"/>"> <c:choose>
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
				<c:if test="${user.user_admin == 1 }">
					<a href="/notice/noticeenroll" onclick="checkForm(); return false;"class="btn primary-btn">글쓰기</a>
				</c:if>
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


		</div>

			<script>
			$(document).ready(function() {

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
			
			//디테일 버튼
			let moveForm = $("#moveForm");
			$(".move").on("click",function(e) {
				e.preventDefault();
				moveForm
						.append("<input type='hidden' name='notice_nno' value='"
								+ $(this).attr("href") + "'>");
				moveForm.attr("action", "/notice/noticeget");
				moveForm.submit();
			});


		    //아래꺼 페이징 연결하는 함수
		    $("#pageing a").on("click", function(e){
		 
		        e.preventDefault();
		        moveForm.find("input[name='pageNum']").val($(this).attr("href"));
		        moveForm.attr("action", "/notice/noticelist");
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