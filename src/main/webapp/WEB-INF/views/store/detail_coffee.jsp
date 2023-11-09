 <%@ page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Fashi Template">
<meta name="keywords" content="Fashi, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>빵 지 순 례</title>
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
					<div class="breadcrumb-text product-more">
						<a href="/store/home"><i class="fa fa-home"></i> Home</a> 
						<a href="/store/list_bread?store_category=bread">Store</a> 
						<a href="javascript:history.back(-1)">More</a><span>Bread</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb Section Begin -->

	<!-- Product Shop Section Begin -->
	<section class="product-shop spad page-details">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
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
					<div class="filter-widget">
						<h4 class="fw-title"></h4>
					</div>
					<div class="filter-widget">
						<h4 class="fw-title"></h4>
					</div>
				</div>
				<div class="col-lg-9">
					<div class="row">
						<div class="col-lg-6">
							<div class="product-pic-zoom">
								<c:forEach items="${list}" var="list">
									<a class="image_wrap"
										data-menu_id="${list.imageList[0].menu_id}"
										data-path="${list.imageList[0].uploadPath}"
										data-uuid="${list.imageList[0].uuid}"
										data-filename="${list.imageList[0].fileName}"> <img
										width="500px" height="500px"></a>
								</c:forEach>
							</div>
							<div class="product-thumbs">
								<div class="product-thumbs-track ps-slider owl-carousel">
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="product-details">
								<div class="pd-title">
									<span>Bread</span>
									<h3>${menu_menu }</h3>
								</div>
								<div class="pd-rating"></div>
								<div class="pd-desc">
									<p>${menu.menu_info }</p>
									<h4>${menu.menu_price }원</h4>
								</div>


								<div class="quantity">
									<div class="pro-qty">
										<input class="quantity_input" type="text" value="1">
									</div>
									<a class="primary-btn pd-cart btn_cart">Add To Cart</a>
								</div>
							</div>
						</div>
					</div>


				</div>
			</div>
		</div>
	</section>
<!-- 주문 form -->
	<form action="/order/${user.user_id}" method="get" class="order_form">
		<input type="hidden" name="orders[0].menu_id" value="${menu.menu_id}">
		<input type="hidden" name="orders[0].menuCount" value="">
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
		
		// 수량 버튼 조작
		let quantity = $(".quantity_input").val();
		$(".plus_btn").on("click", function() {
			$(".quantity_input").val(++quantity);
		});
		$(".minus_btn").on("click", function() {
			if (quantity > 1) {
				$(".quantity_input").val(--quantity);
			}
		});
		/* 바로구매 버튼 */
		$(".btn_buy").on(
				"click",
				function() {
					let menuCount = $(".quantity_input").val();
					$(".order_form").find("input[name='orders[0].menuCount']")
							.val(menuCount);
					$(".order_form").submit();
				});
		// 서버로 전송할 데이터
		const form = {
			user_id : '${user.user_id}',
			menu_id : '${menu.menu_id}',
			menuCount : ''
		}

		// 장바구니 추가 버튼
		$(".btn_cart").on("click", function(e) {
			form.menuCount = $(".quantity_input").val();
			$.ajax({
				url : '/cart/add',
				type : 'POST',
				data : form,
				success : function(result) {
					cartAlert(result);
				}
			})
		});
		function cartAlert(result) {
			if (result == '0') {
				alert("장바구니에 추가를 하지 못하였습니다.");
			} else if (result == '1') {
				alert("장바구니에 추가되었습니다.");
			} else if (result == '2') {
				alert("장바구니에 이미 추가되어져 있습니다.");
			} else if (result == '5') {
				alert("로그인이 필요합니다.");
				location.href="/member/login";
			}
		}
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
</body>

</html>