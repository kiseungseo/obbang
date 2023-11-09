<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="../resources/css/admin/menuDetail.css">

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<style type="text/css">
#result_card img {
	max-width: 100%;
	height: auto;
	display: block;
	padding: 5px;
	margin-top: 10px;
	margin: auto;
}
</style>
<body>
	<%@include file="../includes/admin/header.jsp" %>
	<div class="admin_content_wrap">
		<div class="admin_content_subject">
			<span>상품 상세</span>
		</div>

		<div class="admin_content_main">
			<div class="form_section">
				<div class="form_section_title">
					<label>점포 이름</label>
				</div>
				<div class="form_section_content">
					<input name="store_store" value="${menu.store_store}" disabled>
				</div>
			</div>
			<div class="form_section">
				<div class="form_section_title">
					<label>메뉴 이름</label>
				</div>
				<div class="form_section_content">
					<input name="menu_menu" value="${menu.menu_menu}" disabled>
				</div>
			</div>

			<div class="form_section">
				<div class="form_section_title">
					<label>가 격</label>
				</div>
				<div class="form_section_content">
					<input name="menu_price" value="${menu.menu_price}" disabled>
				</div>
			</div>

			<div class="form_section">
				<div class="form_section_title">
					<label>상품 이미지</label>
				</div>
				<div class="form_section_content">

					<div id="uploadReslut"></div>
				</div>
			</div>

			<div class="btn_section">
				<button id="cancelBtn" class="btn">상품 목록</button>
				<button id="modifyBtn" class="btn enroll_btn">수정</button>
			</div>
		</div>

		<form id="moveForm" action="/admin/menuManage" method="get">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
			<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
		</form>

	</div>

	<script>
		/* 이미지 정보 호출 */
		let menu_id = '<c:out value="${menu.menu_id}"/>';
		let uploadReslut = $("#uploadReslut");
		$.getJSON("/store/MenuGetImageList",
						{
							menu_id : menu_id
						},
						function(arr) {

							if (arr.length === 0) {
								let str = "";
								str += "<div id='result_card'>";
								str += "<img src='/resources/img/storeNoImage.png'>";
								str += "</div>";

								uploadReslut.html(str);
								return;
							}

							let str = "";
							let obj = arr[0];

							let fileCallPath = encodeURIComponent(obj.uploadPath
									+ "/s_" + obj.uuid + "_" + obj.fileName);
							str += "<div id='result_card'";
		str += "data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "'";
		str += ">";
							str += "<img src='/store/display?fileName="
									+ fileCallPath + "'>";
							str += "</div>";

							uploadReslut.html(str);

						});
		/* 목록 이동 버튼 */
		$("#cancelBtn").on("click", function(e){
			e.preventDefault();
			$("#moveForm").submit();	
		});	
		
		/* 수정 페이지 이동 */
		$("#modifyBtn").on("click", function(e){
			e.preventDefault();
			let addInput = '<input type="hidden" name="menu_id" value="${menu.menu_id}">';
			$("#moveForm").append(addInput);
			$("#moveForm").attr("action","/admin/menuModify");
			$("#moveForm").submit();
		});	
	</script>
</body>
</html>