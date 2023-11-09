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

<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous">
</script>

    <title>이벤트 게시판</title>
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
		<h4>이벤트</h4>
		<br>
   			<!-- 전체 글 수 -->
			<div align="left">
				<span class="badge badge-dark">전체 ${eventpageMaker.event_total}건</span>
			</div>
	</div>
    
    <!-- Blog Section Begin -->
    <section class="blog-section spad">
        <div class="container">
			<!-- event -->
            <div class="row">
                <div class="col-lg-12 order-1 order-lg-2">
                    <div class="row">
           	      	<c:forEach items="${list}" var="list">
           	      	     <div class="col-lg-6 col-sm-6">
                            <div class="blog-item">
                                <div class="bi-pic">
                                	<img class="img-fluid rounded mb-3 mb-lg-0" src="/event/display?fileName=<c:out value="${list.event_image}" />" alt="이벤트 이미지"/>
                                </div>
                            </div>
                        </div>	
           	      	     <div class="col-lg-6 col-sm-6">
                            <div class="blog-item">
                                <div class="bi-text">
                                    <a class="move" href='<c:out value="${list.event_eno}"/>'>
                                    <h2><c:out value="${list.event_title}" /></h2>
                                    </a>
                                    <br>
                                    <p class="lead fw-normal text-muted mb-0"><c:out value="${list.event_content}" /></p>
                                    <br>
                                    <p class="event_writer_width">-<fmt:formatDate pattern="yyyy/MM/dd" value="${list.event_regdate}" /></p>
                                    <br>
                                    <!-- 버튼	 -->
                                    <c:if test="${user.user_admin == 1 }">
									<div class="col-sm-offset-2 col-sm-10 ">
								       	<a href="/event/eventmodify?event_eno=${list.event_eno}" id="modify_btn" class="btn primary-btn" >수정하기</a>
									</div> 
									</c:if>
                                </div>
                            </div>
                        </div>	
                        <hr>
					</c:forEach>
                    </div>
                </div>
            </div>

		 	<!-- 페이징 -->
			<div id="eventpageing" align="center">
				<!-- 이전페이지 버튼 -->
				<c:if test="${eventpageMaker.event_prev}">
					<a href="${eventpageMaker.event_startPage-1}">Previous</a>
				</c:if>
				<c:set var="event_pageNum" value="${eventpageMaker.event_cri.event_pageNum}" />
				<c:forEach var="i" begin="${eventpageMaker.event_startPage}"
					end="${eventpageMaker.event_endPage}">
					<a href="<c:url value="${i}"/>"> 
						<c:choose>
							<c:when test="${event_pageNum==i}">
								<font color='#e7ab3c'><b> [${i}]</b></font>
							</c:when>
							<c:otherwise>
								<font color='4C5317'> [${i}]</font>
							</c:otherwise>
						</c:choose>
					</a>
				</c:forEach>
				<!-- 다음페이지 버튼 -->
				<c:if test="${eventpageMaker.event_next}">
					<a href="${eventpageMaker.event_endPage + 1 }">Next</a>
				</c:if>
			</div>
            <c:if test="${user.user_admin == 1 }">
				<div align="right">
					<a href="/event/eventenroll" onclick="checkForm(); return false;" class="btn primary-btn">글쓰기</a>
				</div>
			</c:if>
        </div>
    </section>
    <!-- Blog Section End -->

	<form id="eventmoveForm" method="get">
		<input type="hidden" name="event_pageNum" value="${eventpageMaker.event_cri.event_pageNum }"> 
		<input type="hidden" name="event_amount" value="${eventpageMaker.event_cri.event_amount }"> 
	</form>


        <!-- Bootstrap core JS-->
        <script >
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
      let eventmoveForm = $("#eventmoveForm");
		$(".move").on("click",function(e) {
				e.preventDefault();
				eventmoveForm.append("<input type='hidden' name='event_eno' value='"+ $(this).attr("href") + "'>");
				eventmoveForm.attr("action", "/event/eventget");
				eventmoveForm.submit();
			});

	    //아래꺼 페이징 연결하는 함수
		$("#eventpageing a").on("click", function(e) {
 		e.preventDefault();
 		$("#eventmoveForm input[name='event_pageNum']").val($(this).attr("href"));
  		$("#eventmoveForm").submit();
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

<jsp:include page="../includes/footer.jsp"/>
</body>
</html>