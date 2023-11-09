<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome bbangMall</title>
<link rel="stylesheet" href="/resources/css/order.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<!-- 다음주소 -->
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
						<a href=/store/home><i class="fa fa-home"></i> Home</a> <a
							href="javascript:history.back(-1)">Cart</a> <span>Order</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb Section Begin -->
	
	<div class="wrapper">
		<div class="wrap">
			<div class="content_area">
				<div class="content_main">
					<!-- 회원 정보 -->
					<div class="member_info_div">
						<table class="table_text_align_center memberInfo_table">
							<tbody>
								<tr>
									<th style="width: 25%;">주문자</th>
									<td style="width: *">${memberInfo.user_name}|
										${memberInfo.user_email}</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- 배송지 정보 -->
					<div class="addressInfo_div">
						<div class="addressInfo_button_div">
							<button class="address_btn address_btn_1"
								onclick="showAdress('1')" style="background-color: #3c3838;">상용자
								정보 주소록</button>
							<button class="address_btn address_btn_2"
								onclick="showAdress('2')">직접 입력</button>
						</div>
						<div class="addressInfo_input_div_wrap">
							<div class="addressInfo_input_div addressInfo_input_div_1"
								style="display: block">
								<table>
									<colgroup>
										<col width="25%">
										<col width="*">
									</colgroup>
									<tbody>
										<tr>
											<th>이름</th>
											<td>${memberInfo.user_name}</td>
										</tr>
										<tr>
											<th>주소</th>
											<td>${memberInfo.user_address1}${memberInfo.user_address2  }<br>${memberInfo.user_address3}
												<input class="selectAddress" value="T" type="hidden">
												<input class="order_adress_input"
												value="${memberInfo.user_name}" type="hidden"> <input
												class="user_address1_input" type="hidden"
												value="${memberInfo.user_address1}"> <input
												class="user_address2_input" type="hidden"
												value="${memberInfo.user_address2}"> <input
												class="user_address3_input" type="hidden"
												value="${memberInfo.user_address3}">
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="addressInfo_input_div addressInfo_input_div_2">
								<table>
									<colgroup>
										<col width="25%">
										<col width="*">
									</colgroup>
									<tbody>
										<tr>
											<th>이름</th>
											<td><input class="order_adress_input"></td>
										</tr>
										<tr>
											<th>주소</th>
											<td><input class="selectAddress" value="F" type="hidden">
												<input class="user_address1_input" readonly="readonly"> <a
												class="address_search_btn"
												onclick="execution_daum_address()">주소 찾기</a><br> <input
												class="user_address2_input" readonly="readonly"><br>
												<input class="user_address3_input" readonly="readonly"></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- 상품 정보 -->
					<div class="orderGoods_div">
						<!-- 상품 종류 -->
						<div class="goods_kind_div">
							주문상품 <span class="goods_kind_div_kind"></span>종 
						</div>
						<!-- 상품 테이블 -->
						<table class="goods_subject_table">
							<colgroup>
								<col width="15%">
								<col width="45%">
								<col width="40%">
							</colgroup>
							<tbody>
								<tr>
									<th>이미지</th>
									<th>상품 정보</th>
									<th>총 판매가</th>
								</tr>
							</tbody>
						</table>
						<table class="goods_table">
							<colgroup>
								<col width="15%">
								<col width="45%">
								<col width="40%">
							</colgroup>
							<tbody>
								<c:forEach items="${orderList}" var="ol">
									<tr>
										<td>
											<!-- 이미지 <td>-->
										</td>
										<td>${ol.menu_menu}</td>
										<td class="goods_table_price_td"><br> <fmt:formatNumber
												value="${ol.totalPrice}" pattern="#,### 원" /> <input
											type="hidden" class="individual_menu_price_input"
											value="${ol.menu_price}"> <input type="hidden"
											class="individual_menuCount_input" value="${ol.menuCount}">
											<input type="hidden" class="individual_totalPrice_input"
											value="${ol.menu_price * ol.menuCount}"> <input
											type="hidden" class="individual_menu_id_input"
											value="${ol.menu_id}"></td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
					</div>
					<!-- 포인트 정보 -->
					<!-- 주문 종합 정보 -->
					<div class="total_info_div">
						<!-- 가격 종합 정보 -->
						<div class="total_info_price_div">
							<ul>
								<li><span class="price_span_label">상품 금액</span> <span
									class="totalPrice_span">100000</span>원</li>
								<li><span class="price_span_label">배송비</span> <span
									class="delivery_price_span">100000</span>원</li>
								<li class="price_total_li"><strong
									class="price_span_label total_price_label">최종 결제 금액</strong> <strong
									class="strong_red"> <span
										class="total_price_red finalTotalPrice_span"> 1500000 </span>원
								</strong></li>
								<!-- <li class="point_li">
					<span class="price_span_label">적립예정 포인트</span>
					<span class="totalPoint_span">7960원</span>
				</li> -->
							</ul>
						</div>
						<!-- 버튼 영역 -->
						<div class="total_info_btn_div">
							<a class="order_btn">결제하기</a>
						</div>
					</div>
				</div>





			</div>

			<%@include file="./includes/footer.jsp"%>


		</div>
		<!-- class="wrap" -->
	</div>
	<!-- class="wrapper" -->
	<!-- 주문 요청 form -->
	<form class="order_form" action="/order" method="post">
		<!-- 주문자 회원번호 -->
		<input name="user_id" value="${memberInfo.user_id}" type="hidden">
		<!-- 주소록 & 받는이-->
		<input name="order_adress" type="hidden"> <input
			name="user_address1" type="hidden"> <input
			name="user_address2" type="hidden"> <input
			name="user_address3" type="hidden">
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
		$(document).ready(function() {

			/* 주문 조합정보란 최신화 */
			setTotalInfo();

		});
		/* 주소입력란 버튼 동작(숨김, 등장) */
		function showAdress(className) {
			/* 컨텐츠 동작 */
			/* 모두 숨기기 */
			$(".addressInfo_input_div").css('display', 'none');
			/* 컨텐츠 보이기 */
			$(".addressInfo_input_div_" + className).css('display', 'block');

			/* 버튼 색상 변경 */
			/* 모든 색상 동일 */
			$(".address_btn").css('backgroundColor', '#555');
			/* 지정 색상 변경 */
			$(".address_btn_" + className).css('backgroundColor', '#3c3838');
			/* selectAddress T/F */
			/* 모든 selectAddress F만들기 */
			$(".addressInfo_input_div").each(function(i, obj) {
				$(obj).find(".selectAddress").val("F");
			});
			/* 선택한 selectAdress T만들기 */
			$(".addressInfo_input_div_" + className).find(".selectAddress")
					.val("T");
		}
		/* 다음 주소 연동 */
		function execution_daum_address() {
			console.log("동작");
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								// 추가해야할 코드
								// 주소변수 문자열과 참고항목 문자열 합치기
								addr += extraAddr;

							} else {
								addr += ' ';
							}

							// 제거해야할 코드
							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							$(".address1_input").val(data.zonecode);
							$(".address2_input").val(addr);
							// 커서를 상세주소 필드로 이동한다.
							$(".address3_input").attr("readonly", false);
							$(".address3_input").focus();

						}
					}).open();

		}
		/* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
		function setTotalInfo() {

			let totalPrice = 0; // 총 가격
			let totalCount = 0; // 총 갯수
			let totalKind = 0; // 총 종류
			let deliveryPrice = 0; // 배송비
			let finalTotalPrice = 0; // 최종 가격(총 가격 + 배송비)	

			$(".goods_table_price_td").each(
					function(index, element) {
						// 총 가격
						totalPrice += parseInt($(element).find(
								".individual_totalPrice_input").val());
						// 총 갯수
						totalCount += parseInt($(element).find(
								".individual_,menuCount_input").val());
						// 총 종류
						totalKind += 1;
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

			/* 값 삽입 */
			// 총 가격
			$(".totalPrice_span").text(totalPrice.toLocaleString());
			// 총 갯수
			$(".goods_kind_div_count").text(totalCount);
			// 총 종류
			$(".goods_kind_div_kind").text(totalKind);
			// 배송비
			$(".delivery_price_span").text(deliveryPrice.toLocaleString());
			// 최종 가격(총 가격 + 배송비)
			$(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());
		}

		/* 주문 요청 */
		$(".order_btn")
				.on(
						"click",
						function() {
							/* 주소 정보 & 받는이*/
							$(".addressInfo_input_div")
									.each(
											function(i, obj) {
												if ($(obj).find(
														".selectAddress").val() === 'T') {
													$(
															"input[name='order_adress']")
															.val(
																	$(obj)
																			.find(
																					".order_adress_input")
																			.val());
													$(
															"input[name='user_address1']")
															.val(
																	$(obj)
																			.find(
																					".user_address1_input")
																			.val());
													$("input[name='user_address2']")
															.val(
																	$(obj)
																			.find(
																					".user_address2_input")
																			.val());
													$("input[name='user_address3']").val($(obj).find(".user_address3_input")
																			.val());
												}
											});

							/* 상품정보 */
							let form_contents = '';
							$(".goods_table_price_td")
									.each(
											function(index, element) {
												let menu_id = $(element)
														.find(
																".individual_menu_id_input")
														.val();
												let menuCount = $(element)
														.find(
																".individual_menuCount_input")
														.val();
												let menu_id_input = "<input name='orders[" + index + "].menu_id' type='hidden' value='" + menu_id + "'>";
												form_contents += menu_id_input;
												let menuCount_input = "<input name='orders[" + index + "].menuCount' type='hidden' value='" + menuCount + "'>";
												form_contents += menuCount_input;
											});
							$(".order_form").append(form_contents);

							/* 서버 전송 */
							$(".order_form").submit();
						});
		
		/* $(".order_btn").on("click", function() {
			
			alert("결제가 완료됐습니다. 주문현황을 확인해주세요.");
			
		} */
	</script>

</body>
</html>