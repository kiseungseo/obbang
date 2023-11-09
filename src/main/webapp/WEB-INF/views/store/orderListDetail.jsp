 <%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/admin/orderListDetail.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="/resources/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/themify-icons.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/nice-select.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/style.css" type="text/css">
</head>
<body>
	<%@include file="../includes/header.jsp"%>
	<div class="admin_content_wrap">
		<div class="admin_content_subject">
			<span class="order_name">주문 현황</span>
		</div>

		<div class="goods_table_wrap">
			<div class="low">
				<!-- 게시물 O -->
				<c:if test="${listCheck != 'empty' }">
					<table class="goods_table">
						<colgroup>
							<col width="10%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
							<col width="12%">
							<col width="12%">
							<col width="12%">
							<col width="14%">
						</colgroup>
						<thead>
							<tr>
								<td class="th_column_1">주문 번호</td>
								<td class="th_column_2">주문 이름</td>
								<td class="th_column_3">주문 아이디</td>
								<td class="th_column_4">주문 우편번호</td>
								<td class="th_column_5">주문 주소</td>
								<td class="th_column_6">주문 상세주소</td>
								<td class="th_column_7">주문 상태</td>
								<td class="th_column_8">주문 날짜</td>
								<td class="th_column_9">취소</td>
							</tr>
						</thead>
						<c:forEach items="${list}" var="list">
							<tr>
								<td><c:out value="${list.order_id}"></c:out></td>
								<td><c:out value="${list.order_adress}"></c:out></td>
								<td><c:out value="${list.user_id}"></c:out></td>
								<td><c:out value="${list.user_address1}"></c:out></td>
								<td><c:out value="${list.user_address2}"></c:out></td>
								<td><c:out value="${list.user_address3}"></c:out></td>
								<td><c:out value="${list.order_State}" /></td>
								<td><fmt:formatDate value="${list.orderDate}"
										pattern="yyyy-MM-dd" /></td>
								<td><c:if test="${list.order_State == '배송준비' }">
										<button class="delete_btn" data-order_id="${list.order_id}">취소</button>
									</c:if></td>
							</tr>
						</c:forEach>
					</table>
				</c:if>
			
			<!-- 게시물 x -->
			<c:if test="${listCheck == 'empty'}">
				<div class="table_empty">등록된 주문이 없습니다.</div>
			</c:if>

		</div>

		

		<!-- 페이지 이동 인터페이스 영역 -->
		<div class="pageMaker_wrap">

			<ul class="pageMaker">

				<!-- 이전 버튼 -->
				<c:if test="${pageMaker.prev}">
					<li class="pageMaker_btn prev"><a
						href="${pageMaker.startPage - 1}">이전</a></li>
				</c:if>

				<!-- 페이지 번호 -->
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
					var="num">
					<li class="pageMaker_btn ${pageMaker.cri.pageNum == num ? "active":""}">
						<a href="${num}">${num}</a>
					</li>
				</c:forEach>

				<!-- 다음 버튼 -->
				<c:if test="${pageMaker.next}">
					<li class="pageMaker_btn next"><a
						href="${pageMaker.endPage + 1 }">다음</a></li>
				</c:if>

			</ul>

		</div>

	</div>
</div>
	<%@include file="../includes/footer.jsp"%>

	<form id="moveForm" action="/admin/orderList" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
	</form>
	<form id="deleteForm" action="/admin/orderCancle" method="post">
		<input type="hidden" name="order_id"> <input type="hidden"
			name="pageNum" value="${pageMaker.cri.pageNum}"> <input
			type="hidden" name="amount" value="${pageMaker.cri.amount}">
		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
		<input type="hidden" name="user_id" value="${member.user_id}">
	</form>

	<!-- Js Plugins -->
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
	<script>
		let searchForm = $('#searchForm');
		let moveForm = $('#moveForm');

		/* 작거 검색 버튼 동작 */
		$("#searchForm button").on("click", function(e) {

			e.preventDefault();

			/* 검색 키워드 유효성 검사 */
			if (!searchForm.find("input[name='keyword']").val()) {
				alert("키워드를 입력하십시오");
				return false;
			}

			searchForm.find("input[name='pageNum']").val("1");

			searchForm.submit();

		});

		/* 페이지 이동 버튼 */
		$(".pageMaker_btn a").on("click", function(e) {

			e.preventDefault();

			console.log($(this).attr("href"));

			moveForm.find("input[name='pageNum']").val($(this).attr("href"));

			moveForm.submit();

		});
		$(".delete_btn").on("click", function(e) {

			e.preventDefault();

			let id = $(this).data("order_id");

			$("#deleteForm").find("input[name='order_id']").val(id);
			$("#deleteForm").submit();
		});
	</script>
</body>
</html>