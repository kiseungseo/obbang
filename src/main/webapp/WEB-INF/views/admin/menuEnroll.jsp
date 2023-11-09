<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="../resources/css/admin/menuEnroll.css">
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

#result_card {
	position: relative;
}

.imgDeleteBtn {
	position: absolute;
	top: 0;
	right: 5%;
	background-color: #ef7d7d;
	color: wheat;
	font-weight: 900;
	width: 30px;
	height: 30px;
	border-radius: 50%;
	line-height: 26px;
	text-align: center;
	border: none;
	display: block;
	cursor: pointer;
}
</style>
<body>
	<%@include file="../includes/admin/header.jsp"%>
	<div class="admin_content_wrap">
		<div class="admin_content_main">
			<form action="/admin/menuEnroll" method="post" id="enrollForm">
				<div class="form_section">
					<div class="form_section_title">
						<label>점포 이름</label>
					</div>
					<div class="form_section_content">
						<input id="authorName_input" readonly="readonly"> <input
							id="authorId_input" name="store_store" type="hidden">
						<button class="authorId_btn">점포 선택</button>
						<br> <span class="ck_warn store_warn">점포를 선택해주세요.</span>
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>상품 이름</label>
					</div>
					<div class="form_section_content">
						<input name="menu_menu" value=""> <span
							class="ck_warn menu_warn">상품 이름을 입력해주세요.</span>
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>상품 가격</label>
					</div>
					<div class="form_section_content">
						<input name="menu_price"> <span class="ck_warn price_warn">상품
							가격을 입력해주세요.</span>
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>상품 이미지</label>
					</div>
					<div class="form_section_content">
						<input type="file" id="fileItem" name='uploadFile'
							style="height: 30px;" multiple="multiple">
						<div id="uploadResult"></div>
					</div>
				</div>
			</form>


			<div class="btn_section">
				<button id="cancelBtn" class="btn">취 소</button>
				<button id="enrollBtn" class="btn enroll_btn">등 록</button>
			</div>
		</div>
	</div>
	<script>
		let enrollForm = $("#enrollForm")

		/* 취소 버튼 */
		$("#cancelBtn").click(function() {

			location.href = "/admin/main"

		});

		/* 상품 등록 버튼 */
		$("#enrollBtn").on("click", function(e) {

			e.preventDefault();
			/* 체크 변수 */
			let storeCk = false;
			let menuCk = false;
			let priceCk = false;
			/* 체크 대상 변수 */
			let store = $("input[name='store_store']").val();
			let menu = $("input[name='menu_menu']").val();
			let price = $("input[name='menu_price']").val();
			if (store) {
				$(".store_warn").css('display', 'none');
				storeCk = true;
			} else {
				$(".store_warn").css('display', 'block');
				storeCk = false;
			}

			if (menu) {
				$(".menu_warn").css('display', 'none');
				menuCk = true;
			} else {
				$(".menu_warn").css('display', 'block');
				menuCk = false;
			}

			if (price) {
				$(".price_warn").css('display', 'none');
				priceCk = true;
			} else {
				$(".price_warn").css('display', 'block');
				priceCk = false;
			}
			if (storeCk && menuCk && priceCk) {
				//alert('통과');
				enrollForm.submit();
			} else {
				return false;
			}

		});
		/* 작가 선택 버튼 */
		$('.authorId_btn')
				.on(
						"click",
						function(e) {

							e.preventDefault();

							let popUrl = "/admin/storePop";
							let popOption = "width = 650px, height=550px, top=300px, left=300px, scrollbars=yes";

							window.open(popUrl, "점포 찾기", popOption);

						});
		/* 이미지 업로드 */
		$("input[type='file']").on("change", function(e) {

			/* 이미지 존재시 삭제 */
			if ($("#result_card").length > 0) {
				deleteFile();
			}
			let formData = new FormData();
			let fileInput = $('input[name="uploadFile"]');
			let fileList = fileInput[0].files;
			let fileObj = fileList[0];

			console.log("fileList : " + fileList);
			console.log("fileObj : " + fileObj);
			console.log("fileName : " + fileObj.name);
			console.log("fileSize : " + fileObj.size);
			console.log("fileType(MimeType) : " + fileObj.type);

			if (!fileCheck(fileObj.name, fileObj.size)) {
				return false;
			}

			alert("통과");

			formData.append("uploadFile", fileObj);

			$.ajax({
				url : '/admin/uploadAjaxAction',
				processData : false,
				contentType : false,
				data : formData,
				type : 'POST',
				dataType : 'json',
				success : function(result) {
					console.log(result);
					showUploadImage(result);
				},
				error : function(result) {
					alert("이미지 파일이 아닙니다.");
				}
			});

		});
		/* var, method related with attachFile */
		let regex = new RegExp("(.*?)\.(jpg|png)$");
		let maxSize = 1048576; //1MB	

		function fileCheck(fileName, fileSize) {

			if (fileSize >= maxSize) {
				alert("파일 사이즈 초과");
				return false;
			}

			if (!regex.test(fileName)) {
				alert("해당 종류의 파일은 업로드할 수 없습니다.");
				return false;
			}

			return true;

		}
		/* 이미지 출력 */
		function showUploadImage(uploadResultArr) {
			/* 전달받은 데이터 검증 */
			if (!uploadResultArr || uploadResultArr.length == 0) {
				return
			}

			let uploadResult = $("#uploadResult");
			let str = "";

			let obj = uploadResultArr[0];

			let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_"
					+ obj.uuid + "_" + obj.fileName);

			str += "<div id='result_card'>";
			str += "<img src='/store/display?fileName=" + fileCallPath + "'>";
			str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
			str += "<input type='hidden' name='imageList[0].fileName' value='"+ obj.fileName +"'>";
			str += "<input type='hidden' name='imageList[0].uuid' value='"+ obj.uuid +"'>";
			str += "<input type='hidden' name='imageList[0].uploadPath' value='"+ obj.uploadPath +"'>";
			str += "</div>";

			uploadResult.append(str);
		}
		/* 이미지 삭제 버튼 동작 */
		$("#uploadResult").on("click", ".imgDeleteBtn", function(e) {

			deleteFile();

		});
		/* 파일 삭제 메서드 */
		function deleteFile() {
			let targetFile = $(".imgDeleteBtn").data("file");

			let targetDiv = $("#result_card");

			$.ajax({
				url : '/admin/deleteFile',
				data : {
					fileName : targetFile
				},
				dataType : 'text',
				type : 'POST',
				success : function(result) {
					console.log(result);

					targetDiv.remove();
					$("input[type='file']").val("");

				},
				error : function(result) {
					console.log(result);

					alert("파일을 삭제하지 못하였습니다.")
				}
			});
		}
	</script>
</body>
</html>