<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="zxx">

<head>

<style type="text/css">
.all_check_input {
	position: relative;
	right: -80px;
}

.quantity_modify_btn {
	font-size: 15px;
	font-weight: 700;
	color: #ffffff;
	background: #ccc4c4;
	text-transform: uppercase;
	padding: 10px 20px 10px 20px;
	display: block;
	text-align: center;
}
</style>

<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<meta charset="UTF-8">
<meta name="description" content="Fashi Template">
<meta name="keywords" content="Fashi, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>빵 지 순 례</title>

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

	<%@include file="./includes/header.jsp"%>


	<!-- Breadcrumb Section Begin -->
	<div class="breacrumb-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb-text product-more">
						<a href="/store/home"><i class="fa fa-home"></i> Home</a> <a
							href="javascript:history.back(-1)">Store</a> <span>Shopping
							Cart</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb Section Begin -->

	<!-- Shopping Cart Section Begin -->
	<section class="shopping-cart spad">
		<div class="container">
			<div class="row">
				<div class="all_check_input_div">
					<input type="checkbox" class="all_check_input input_size_20"
						checked="checked"><span class="all_chcek_span">전체선택</span>
				</div>
				<div class="col-lg-12">
					<div class="cart-table">
						<table>
							<thead>
								<tr>
									<th></th>
									<th>제품사진</th>
									<th class="p-name">제품명</th>
									<th>가격</th>
									<th>수량</th>
									<th>Total</th>
									<th><i class="ti-close"></i></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${cartInfo}" var="ci">
									<tr>
										<td class="td_width_1 cart_info_td"><input
											type="checkbox"
											class="individual_cart_checkbox input_size_20"
											checked="checked"> <input type="hidden"
											class="individual_menu_price_input" value="${ci.menu_price}">
											<input type="hidden" class="individual_menuCount_input"
											value="${ci.menuCount}"> <input type="hidden"
											class="individual_totalPrice_input"
											value="${ci.menu_price * ci.menuCount}"> <input
											type="hidden" class="individual_menu_id_input"
											value="${ci.menu_id}"></td>
										<td class="cart-pic first-row">
											<div class="image_wrap"
												data-menu_id="${ci.imageList[0].menu_id}"
												data-path="${ci.imageList[0].uploadPath}"
												data-uuid="${ci.imageList[0].uuid}"
												data-filename="${ci.imageList[0].fileName}">
												<img style="width: 80px; height: 80px;">
											</div>
										</td>
										<td class="cart-title first-row">
											<h5>${ci.menu_menu}</h5>
										</td>
										<td class="p-price first-row"><fmt:formatNumber
												value="${ci.menu_price}" pattern="#,### 원" /><br></td>
										<td class="qua-col first-row">
											<div class="quantity">
												<div class="pro-qty">
													<input type="text" value="${ci.menuCount}"
														class="quantity_input">
												</div>
											</div> <a class="quantity_modify_btn" data-cart_id="${ci.cart_id}">변경
												하기</a>
										</td>
										<td class="total-price first-row"><fmt:formatNumber
												value="${ci.menu_price * ci.menuCount}" pattern="#,### 원" /></td>
										<td class="close-td first-row "><i
											class="ti-close delete_btn" data-cart_id="${ci.cart_id}"></i></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="row">
						<div class="col-lg-4">
							<div class="cart-buttons">
								<a href="javascript:history.back(-1)"
									class="primary-btn continue-shop">Continue shopping</a>
							</div>
							<div class="discount-coupon"></div>
						</div>
						<div class="col-lg-4 offset-lg-4">
							<div class="proceed-checkout">
								<ul>
									<li class="subtotal">상품 가격<span class="totalPrice_span"></span></li>
									<li class="subtotal">배송비<span class="delivery_price"></span></li>
									<li class="cart-total">Total <span
										class="finalTotalPrice_span"></span></li>
								</ul>
								<a class="proceed-btn order_btn">제품 주문하기</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 수량 조정 form -->
		<form action="/cart/update" method="post" class="quantity_update_form">
			<input type="hidden" name="cart_id" class="update_cart_id"> <input
				type="hidden" name="menuCount" class="update_menuCount"> <input
				type="hidden" name="user_id" value="${user.user_id}">
		</form>

		<!-- 삭제 form -->
		<form action="/cart/delete" method="post" class="quantity_delete_form">
			<input type="hidden" name="cart_id" class="delete_cart_id"> <input
				type="hidden" name="user_id" value="${user.user_id}">
		</form>
		<!-- 주문 form -->
		<form action="/order/${user.user_id}" method="get" class="order_form">

		</form>
	</section>
	<!-- Shopping Cart Section End -->



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
		$(document).ready(function() {

			/* 종합 정보 섹션 정보 삽입 */
			setTotalInfo();

			/* 이미지 삽입 */
			/* $(".image_wrap").each(function(i, obj){
			
				const bobj = $(obj);
				
				if(bobj.data("bookid")){
					const uploadPath = bobj.data("path");
					const uuid = bobj.data("uuid");
					const fileName = bobj.data("filename");
					
					const fileCallPath = encodeURIComponent(uploadPath + "/s_" + uuid + "_" + fileName);
					
					$(this).find("img").attr('src', '/display?fileName=' + fileCallPath);
				} else {
					$(this).find("img").attr('src', '/resources/img/goodsNoImage.png');
				}
				
			}); */

		});

		/* 체크여부에따른 종합 정보 변화 */
		$(".individual_cart_checkbox").on("change", function() {
			/* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
			setTotalInfo($(".cart_info_td"));
		});

		/* 체크박스 전체 선택 */
		$(".all_check_input").on("click", function() {

			/* 체크박스 체크/해제 */
			if ($(".all_check_input").prop("checked")) {
				$(".individual_cart_checkbox").attr("checked", true);
			} else {
				$(".individual_cart_checkbox").attr("checked", false);
			}

			/* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
			setTotalInfo($(".cart_info_td"));

		});

		/* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
		function setTotalInfo() {

			let totalPrice = 0; // 총 가격
			let totalCount = 0; // 총 갯수
			let totalKind = 0; // 총 종류
			let totalPoint = 0; // 총 마일리지
			let deliveryPrice = 0; // 배송비
			let finalTotalPrice = 0; // 최종 가격(총 가격 + 배송비)

			$(".cart_info_td").each(
					function(index, element) {

						if ($(element).find(".individual_cart_checkbox").is(
								":checked") === true) { //체크여부
							// 총 가격
							totalPrice += parseInt($(element).find(
									".individual_totalPrice_input").val());
							// 총 갯수
							totalCount += parseInt($(element).find(
									".individual_menuCount_input").val());
							// 총 종류
							totalKind += 1;
						}

					});

			/* 배송비 결정 */
			if (totalPrice >= 30000) {
				deliveryPrice = 0;
			} else if (totalPrice == 0) {
				deliveryPrice = 0;
			} else {
				deliveryPrice = 3000;
			}

			finalTotalPrice = totalPrice + deliveryPrice;

			/* ※ 세자리 컴마 Javscript Number 객체의 toLocaleString() */

			// 총 가격
			$(".totalPrice_span").text(totalPrice.toLocaleString());
			// 총 갯수
			$(".totalCount_span").text(totalCount);
			// 총 종류
			$(".totalKind_span").text(totalKind);
			// 배송비
			$(".delivery_price").text(deliveryPrice);
			// 최종 가격(총 가격 + 배송비)
			$(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());
		}

		/* 수량버튼 */
		$(".plus_btn").on("click", function() {
			let quantity = $(this).parent("div").find("input").val();
			$(this).parent("div").find("input").val(++quantity);
		});
		$(".minus_btn").on("click", function() {
			let quantity = $(this).parent("div").find("input").val();
			if (quantity > 1) {
				$(this).parent("div").find("input").val(--quantity);
			}
		});

		/* 수량 수정 버튼 */
		$(".quantity_modify_btn").on("click", function() {
			let cart_id = $(this).data("cart_id");
			let menuCount = $(this).parent("td").find("input").val();
			$(".update_cart_id").val(cart_id);
			$(".update_menuCount").val(menuCount);
			$(".quantity_update_form").submit();

		});

		/* 장바구니 삭제 버튼 */
		$(".delete_btn").on("click", function(e) {
			e.preventDefault();
			const cart_id = $(this).data("cart_id");
			$(".delete_cart_id").val(cart_id);
			$(".quantity_delete_form").submit();
		});

		/* 주문 페이지 이동 */
		$(".order_btn")
				.on(
						"click",
						function() {

							let form_contents = '';
							let orderNumber = 0;

							$(".cart_info_td")
									.each(
											function(index, element) {

												if ($(element)
														.find(
																".individual_cart_checkbox")
														.is(":checked") === true) { //체크여부

													let menu_id = $(element)
															.find(
																	".individual_menu_id_input")
															.val();
													let menuCount = $(element)
															.find(
																	".individual_menuCount_input")
															.val();

													let menu_id_input = "<input name='orders["+ orderNumber +"].menu_id' type='hidden' value='" + menu_id + "'>";
													form_contents += menu_id_input;

													let menuCount_input = "<input name='orders[" + orderNumber + "].menuCount' type='hidden' value='" + menuCount + "'>";
													form_contents += menuCount_input;

													orderNumber += 1;

												}
											});

							$(".order_form").html(form_contents);
							$(".order_form").submit();

						});

		/* 이미지 삽입 */
		$(".image_wrap").each(
				function(i, obj) {

					const bobj = $(obj);

					const uploadPath = bobj.data("path");
					const uuid = bobj.data("uuid");
					const fileName = bobj.data("filename");

					const fileCallPath = encodeURIComponent(uploadPath + "/s_"
							+ uuid + "_" + fileName);

					$(this).find("img").attr('src',
							'/store/display?fileName=' + fileCallPath);

				});
	</script>

	<%@include file="./includes/footer.jsp"%>
</body>

</html>