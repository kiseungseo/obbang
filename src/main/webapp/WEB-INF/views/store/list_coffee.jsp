 <%@ page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
<meta charset="UTF-8">
<meta name="description" content="Fashi Template">
<meta name="keywords" content="Fashi, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Fashi | Template</title>
<script src="https://code.jquery.com/jquery-3.6.4.slim.js"
	integrity="sha256-dWvV84T6BhzO4vG6gWhsWVKVoa4lVmLnpBOZh/CAHU4="
	crossorigin="anonymous"></script>
<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="/resources/css/store/paging.css">
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
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>
<%@include file="../includes/header.jsp"%>
	<!-- Breadcrumb Section Begin -->
	<div class="breacrumb-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb-text">
						<a href="/store/home"><i class="fa fa-home"></i> Home</a> <span>Shop</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb Section Begin -->

	<!-- Product Shop Section Begin -->
	<c:if test="${listcheck != 'empty'}">
	<section class="product-shop spad">
		<div class="container">
			<div class="row">
				<div
					class="col-lg-3 col-md-6 col-sm-8 order-2 order-lg-1 produts-sidebar-filter">
					<div class="filter-widget">
						<h4 class="fw-title">빵 지 순 례</h4>
						<ul class="filter-catagories">
							<li><a href="/store/list_bread?store_category=bread">빵</a></li>
							<li><a href="/store/list_coffee?store_category=coffee">커피</a></li>
							<li><a href="/store/list_desert?store_category=desert">디저트</a></li>
							<li><a href="/store/list_sandwich?store_category=sandwich">샌드위치</a></li>
						</ul>
					</div>

					<div class="filter-widget">
						<h4 class="fw-title"></h4>
					</div>
					<div class="filter-widget">
						<h4 class="fw-title"></h4>
					</div>
					<div class="filter-widget">
						<h4 class="fw-title"></h4>
					</div>
				</div>
				<div class="col-lg-9 order-1 order-lg-2">
					<div class="product-show-option">
						<div class="row">
							<div class="col-lg-7 col-md-7">
								<div class="select-option"></div>
							</div>
							<div class="col-lg-5 col-md-5 text-right"></div>
						</div>
					</div>
					<div class="product-list">
						<div class="row">
							<c:forEach items="${list}" var="list">
								<div class="col-lg-4 col-sm-6">
									<div class="product-item">
										<div class="pi-pic">
											<div class="image_wrap"
												data-store_id="${list.imageList[0].store_id}"
												data-path="${list.imageList[0].uploadPath}"
												data-uuid="${list.imageList[0].uuid}"
												data-filename="${list.imageList[0].fileName}">
												<a href="/store/category_coffee?store_id=${list.store_id }"><img
													style="width: 250px; height: 150px;"></a>
											</div>
										</div>
										<div class="pi-text">
											<div class="catagory-name">${list.store_category}</div>
											<a href="/store/category_coffee?store_id=${list.store_id }">
												<h5>${list.store_store}</h5>
											</a>
											<div class="product-price">
												<p>평점 : ${list.ratingAvg }</p>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
					<!-- </form> -->
					<div class="pageMaker_wrap">
						<ul class="pageMaker">

							<!-- 이전 버튼 -->
							<c:if test="${pageMaker.prev }">
								<li class="pageMaker_btn prev"><a
									href="${pageMaker.startPage -1}">이전</a></li>
							</c:if>

							<!-- 페이지 번호 -->
							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="num">
								<li
									class="pageMaker_btn ${pageMaker.cri.pageNum == num ? 'active':''}">
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
		</div>
	</section>
	</c:if>
	<!-- Product Shop Section End -->

	<form id="moveForm" action="/store/list_coffee" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
	</form>

	<!-- Footer Section Begin -->
	<footer class="footer-section">
		<div class="container"></div>
	</footer>
	<!-- Footer Section End -->

	<script>

		let searchForm = $('#searchForm');
		let moveForm = $('#moveForm');
		
		/* 점포 검색 버튼 동작 */
		$("#searchForm button").on("click", function(e){
			
			e.preventDefault();
			
			/* 검색 키워드 유효성 검사 */
			if(!searchForm.find("input[name='keyword']").val()){
				alert("키워드를 입력하십시오");
				return false;
			}
			
			searchForm.find("input[name='pageNum']").val("1");
			
			searchForm.submit();
			
		});
		
		
		/* 페이지 이동 버튼 */
		$(".pageMaker_btn a").on("click", function(e){
			
			e.preventDefault();
			console.log($(this).attr("href"));
			var pageNum = $(this).attr("href");
			var storeCategory = "coffee"; // 전달하고자 하는 데이터 값
			 moveForm.append('<input type="hidden" name="store_category" value="' + storeCategory + '">');
			moveForm.find("input[name='pageNum']").val($(this).attr("href"));
			
			moveForm.submit();
			
		});	
		/* 이미지 삽입 */
		$(".image_wrap").each(function(i, obj){
			
			const bobj = $(obj);
			
			const uploadPath = bobj.data("path");
			const uuid = bobj.data("uuid");
			const fileName = bobj.data("filename");
			
			const fileCallPath = encodeURIComponent(uploadPath + "/s_" + uuid + "_" + fileName);
			
			$(this).find("img").attr('src', '/store/display?fileName=' + fileCallPath);
			
		});
	
	</script>
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
</body>

</html>