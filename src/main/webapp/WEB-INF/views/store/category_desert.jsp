<%@ page language="java" pageEncoding="UTF-8"%>
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

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="/resources/css/detail.css"
	type="text/css">
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
						<a href=/store/home><i class="fa fa-home"></i> Home</a> <a
							href="/store/list_desert?store_category=desert">Shop</a> <span>Bread</span>
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
								<c:forEach items="${list}" var="list">
							<div class="product-pic-zoom image_wrap" data-store_id="${list.imageList[0].store_id}"
										data-path="${list.imageList[0].uploadPath}"
										data-uuid="${list.imageList[0].uuid}"
										data-filename="${list.imageList[0].fileName}">
									 <img class="product-big-img">
							</div>
								</c:forEach>
									<c:forEach items="${list}" var="list">
							<div class="product-thumbs">
								<div class="product-thumbs-track ps-slider owl-carousel">
										<div class="pt active slide"
											data-store_id="${list.imageList[0].store_id}"
											data-path="${list.imageList[0].uploadPath}"
											data-uuid="${list.imageList[0].uuid}"
											data-filename="${list.imageList[0].fileName}">
											<img style="width: 150px; height: 100px">
										</div>
										<div class="pt slide"
											data-store_id="${list.imageList[1].store_id}"
											data-path="${list.imageList[1].uploadPath}"
											data-uuid="${list.imageList[1].uuid}"
											data-filename="${list.imageList[1].fileName}">
											<img style="width: 150px; height: 100px">
										</div>
										<div class="pt slide" 
											data-store_id="${list.imageList[2].store_id}"
											data-path="${list.imageList[2].uploadPath}"
											data-uuid="${list.imageList[2].uuid}"
											data-filename="${list.imageList[2].fileName}">
											<img style="width: 150px; height: 100px">
										</div>
										<div class="pt slide" 
											data-store_id="${list.imageList[3].store_id}"
											data-path="${list.imageList[3].uploadPath}"
											data-uuid="${list.imageList[3].uuid}"
											data-filename="${list.imageList[3].fileName}">
											<img style="width: 150px; height: 100px">
										</div>
								</div>
							</div>
									</c:forEach>
						</div>
						<div class="col-lg-6">
							<div class="product-details">
								<div class="pd-title">
									<span>${StoreInfoDetail.store_category }</span>
									<h3>${StoreInfoDetail.store_store }</h3>
								</div>
								<div class="pd-rating">
														<div>
															<div>
																<c:forEach begin="1" end="5" var="i">
																	<c:choose>
																		<c:when
																			test="${StoreInfoDetail.ratingAvg >= i }">
																			<i class="fa fa-star"></i>
																		</c:when>
																		<c:otherwise>
																			<i class="fa fa-star-o"></i>
																		</c:otherwise>
																	</c:choose>
																</c:forEach>
																<span>(${StoreInfoDetail.ratingAvg })</span>
															</div>
														</div>
													</div>
								<div class="pd-desc">
									<p>${StoreInfoDetail.store_info}</p>
								</div>
							</div>
						</div>
					</div>
					<div class="product-tab">
						<div class="tab-item ">
							<ul class="nav" role="tablist">
								<li><a class="active" data-toggle="tab" href="#tab-1"
									role="tab">매장 정보</a></li>
								<li><a data-toggle="tab" href="#tab-2" role="tab">리 뷰</a></li>
							</ul>
						</div>
						<div class="tab-item-content">
							<div class="tab-content">
								<div class="tab-pane fade-in active" id="tab-1" role="tabpanel">
									<div class="specification-table">
										<table>
											<tr>
												<td class="p-catagory">평 점</td>
												<td>
												<div class="pd-rating">
														<div>
															<div>
																<c:forEach begin="1" end="5" var="i">
																	<c:choose>
																		<c:when
																			test="${StoreInfoDetail.ratingAvg >= i }">
																			<i class="fa fa-star"></i>
																		</c:when>
																		<c:otherwise>
																			<i class="fa fa-star-o"></i>
																		</c:otherwise>
																	</c:choose>
																</c:forEach>
																<span>(${StoreInfoDetail.ratingAvg })</span>
															</div>
														</div>
													</div>
												</td>
											</tr>
											<tr>
												<td class="p-catagory">주 소</td>
												<td>
													<div class="p-price">${StoreInfoDetail.store_adress}</div>
												</td>
											</tr>
											
											<tr>
												<td class="p-catagory">전 화 번 호</td>
												<td>
													<div class="p-stock">${StoreInfoDetail.store_tel}</div>
												</td>
											</tr>
											<tr>
												<td class="p-catagory">운 영 시 간</td>
												<td>
													<div class="p-weight">9시 ~ 21시</div>

												</td>
											</tr>
										</table>
									</div>
								</div>
								<div class="tab-pane fade" id="tab-2" role="tabpanel">
									<div class="customer-review-option">
										<h4>Comments</h4>
										<div class="comment-option">
											<div class="co-item">
												<div class="avatar-pic"></div>
												<div class="avatar-text">
													<div class="content_bottom">
														<div class="reply_subject">
															<h2>리뷰</h2>
														</div>
														<c:if test="${user != null}">
															<div class="reply_button_wrap">
																<button>리뷰 쓰기</button>
															</div>
														</c:if>
														<div class="reply_not_div"></div>
														<ul class="reply_content_ul">
														</ul>
														<div class="repy_pageInfo_div"></div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Product Shop Section End -->

	<!-- Related Products Section End -->
	<div class="related-products spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title">
						<h2>메 뉴</h2>
					</div>
				</div>
			</div>
			<div class="row" align="center">
						<c:forEach items="${StoreInfo}" var="list">
				<div class="col-md-4 col-sm-6">
					<div class="product-item">
							<div class="pi-pic">
								<div class="image_wrap"
									data-menu_id="${list.imageList[0].menu_id}"
									data-path="${list.imageList[0].uploadPath}"
									data-uuid="${list.imageList[0].uuid}"
									data-filename="${list.imageList[0].fileName}">
									<a href="/store/detail_desert?menu_id=${list.menu_id }"><img
										style="width: 300px; height: 200px; border: 2px solid gray;"></a>
								</div>
							</div>
							<div class="pi-text">
								<div class="catagory-name">Bread</div>
									<h5>${list.menu_menu }</h5>
								<div class="product-price">${list.menu_price}원</div>
							</div>
					</div>
				</div>
						</c:forEach>

			</div>
		</div>
	</div>
	<!-- Related Products Section End -->

	

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
		// 페이지가 다시로드 될 때 실행되는 함수
		window.addEventListener("load", function() {
			// replyListInit() 함수 호출
			replyListInit();
		});
		/* 댓글 데이터 서버 요청 및 댓글 동적 생성 메서드 */
		let replyListInit = function() {
			$.getJSON("/reply/list", cri, function(obj) {
				makeReplyContent(obj);
			});
		}
		/* 댓글 페이지 정보 */
		const cri = {
			store_id : '${StoreInfoDetail.store_id}',
			pageNum : 1,
			amount : 10
		}
		/* 리뷰쓰기 */
		$(".reply_button_wrap")
				.on(
						"click",
						function(e) {
							e.preventDefault();
							const user_id = '${user.user_id}';
							const store_id = '${StoreInfoDetail.store_id}';
							$
									.ajax({
										data : {
											store_id : store_id,
											user_id : user_id
										},
										url : '/reply/check',
										type : 'POST',
										success : function(result) {
											if (result === '1') {
												alert("이미 등록된 리뷰가 존재 합니다.")
											} else if (result === '0') {
												let popUrl = "/store/replyEnroll/"
														+ user_id
														+ "?store_id="
														+ store_id;
												console.log(popUrl);
												let popOption = "width = 490px, height=490px, top=300px, left=300px, scrollbars=yes";
												window.open(popUrl, "리뷰 쓰기",
														popOption);
											}
										}
									});
						});
		/* 댓글(리뷰) 동적 생성 메서드 */
		function makeReplyContent(obj) {

			if (obj.list.length === 0) {
				$(".reply_not_div").html('<span>리뷰가 없습니다.</span>');
				$(".reply_content_ul").html('');
				$(".pageMaker").html('');
			} else {
				$(".reply_not_div").html('');
				const list = obj.list;
				const pf = obj.pageInfo;
				const userId = '${user.user_id}';
				/* list */
				let reply_list = '';
				$(list)
						.each(
								function(a, obj) {
									reply_list += '<li>';
									reply_list += '<div class="comment_wrap">';
									reply_list += '<div class="reply_top">';
									/* 아이디 */
									reply_list += '<span class="id_span">'
											+ obj.user_id + '</span>';
									/* 날짜 */
									reply_list += '<span class="date_span">'
											+ obj.regDate + '</span>';
									/* 평점 */
									reply_list += '<span class="rating_span">평점 : <span class="rating_value_span">'
											+ obj.rating + '</span>점</span>';
									if (obj.user_id === userId) {
										reply_list += '<a class="update_reply_btn" href="'+ obj.reply_id +'">수정</a><a class="delete_reply_btn" href="'+ obj.reply_id +'">삭제</a>';
									}
									reply_list += '</div>'; //<div class="reply_top">
									reply_list += '<div class="reply_bottom">';
									reply_list += '<div class="reply_bottom_txt">'
											+ obj.content + '</div>';
									reply_list += '</div>';//<div class="reply_bottom">
									reply_list += '</div>';//<div class="comment_wrap">
									reply_list += '</li>';
								});
				$(".reply_content_ul").html(reply_list);

				/* 페이지 버튼 */

				let reply_pageMaker = '';
				/* prev */
				if (pf.prev) {
					let prev_num = pf.startPage - 1;
					reply_pageMaker += '<li class="pageMaker_btn prev">';
					reply_pageMaker += '<a href="'+ prev_num +'">이전</a>';
					reply_pageMaker += '</li>';
				}
				/* numbre btn */
				for (let i = pf.startPage; i < pf.endPage + 1; i++) {
					reply_pageMaker += '<li class="pageMaker_btn ';
					if (pf.cri.pageNum === i) {
						reply_pageMaker += 'active';
					}
					reply_pageMaker += '">';
					reply_pageMaker += '<a href="'+i+'">' + i + '</a>';
					reply_pageMaker += '</li>';
				}
				/* next */
				if (pf.next) {
					let next_num = pf.endPage + 1;
					reply_pageMaker += '<li class="pageMaker_btn next">';
					reply_pageMaker += '<a href="'+ next_num +'">다음</a>';
					reply_pageMaker += '</li>';
				}
				$(".pageMaker").html(reply_pageMaker);
			}

		}

		/* 댓글 페이지 이동 버튼 동작 */
		$(document).on('click', '.pageMaker_btn a', function(e) {

			e.preventDefault();

			let page = $(this).attr("href");
			cri.pageNum = page;

			replyListInit();
		});
		/* 리뷰 수정 버튼 */
		$(document)
				.on(
						'click',
						'.update_reply_btn',
						function(e) {
							e.preventDefault();
							let reply_id = $(this).attr("href");
							let popUrl = "/store/replyUpdate?reply_id="
									+ reply_id + "&store_id="
									+ '${StoreInfoDetail.store_id}'
									+ "&user_id=" + '${user.user_id}';
							let popOption = "width = 490px, height=490px, top=300px, left=300px, scrollbars=yes"

							window.open(popUrl, "리뷰 수정", popOption);
						});
		/* 리뷰 삭제 버튼 */
		$(document).on('click', '.delete_reply_btn', function(e) {
			e.preventDefault();
			let reply_id = $(this).attr("href");

			$.ajax({
				data : {
					reply_id : reply_id,
					store_id : '${StoreInfoDetail.store_id}'
				},
				url : '/reply/delete',
				type : 'POST',
				success : function(result) {
					replyListInit();
					alert('삭제가 완료되엇습니다.');
				}
			});
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
		/* 이미지 삽입 */
		$(".slide").each(
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
</body>

</html>