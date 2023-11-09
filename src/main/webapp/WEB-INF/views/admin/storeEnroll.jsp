<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/admin/storeEnroll.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script
	src="https://cdn.ckeditor.com/ckeditor5/26.0.0/classic/ckeditor.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
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
			<form action="/admin/storeEnroll" method="post" id="enrollForm">
				<div class="form_section">
					<div class="form_section_title">
						<label>점포 이름</label>
					</div>
					<div class="form_section_content">
						<input name="store_store"> <span
							class="ck_warn store_warn">점포 이름을 입력해주세요.</span>
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>주 소</label>
					</div>
					<div class="form_section_content">
						<input name="store_adress" value=""> <span
							class="ck_warn adress_warn">주소를 입력해주세요.</span>
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>전 화 번 호</label>
					</div>
					<div class="form_section_content">
						<input name="store_tel"> <span class="ck_warn tel_warn">전화번호를
							입력해주세요.</span>
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>설 명</label>
					</div>
					<div class="form_section_content">
						<input name="store_info"> <span class="ck_warn info_warn">설명을
							입력해주세요.</span>
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>카 테 고 리</label>
					</div>
					<div class="form_section_content">
						<input name="store_category"> <span
							class="ck_warn category_warn">카테고리를 입력해주세요.</span> <span
							class="ck_warn category_warn">(bread,coffee,desert,sandwich)</span>
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>점포 이미지</label>
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

		/* 점포 등록 버튼 */
		$("#enrollBtn").on("click", function(e) {

			e.preventDefault();
			/* 체크 변수 */
			let storeCk = false;
			let adressCk = false;
			let telCk = false;
			let infoCk = false;
			let categoryCk = false;
			/* 체크 대상 변수 */
			let store = $("input[name='store_store']").val();
			let adress = $("input[name='store_adress']").val();
			let tel = $("input[name='store_tel']").val();
			let info = $("input[name='store_info']").val();
			let category = $("input[name='store_category']").val();
			if (store) {
				$(".store_warn").css('display', 'none');
				storeCk = true;
			} else {
				$(".store_warn").css('display', 'block');
				storeCk = false;
			}

			if (adress) {
				$(".adress_warn").css('display', 'none');
				adressCk = true;
			} else {
				$(".adress_warn").css('display', 'block');
				adressCk = false;
			}

			if (tel) {
				$(".tel_warn").css('display', 'none');
				telCk = true;
			} else {
				$(".tel_warn").css('display', 'block');
				telCk = false;
			}

			if (info) {
				$(".info_warn").css('display', 'none');
				infoCk = true;
			} else {
				$(".info_warn").css('display', 'block');
				infoCk = false;
			}
			if (category) {
				$(".category_warn").css('display', 'none');
				categoryCk = true;
			} else {
				$(".category_warn").css('display', 'block');
				categoryCk = false;
			}
			if (storeCk && adressCk && telCk && infoCk && categoryCk) {
				//alert('통과');
				enrollForm.submit();
			} else {
				return false;
			}

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

			for (let i = 0; i < fileList.length; i++) {
				formData.append("uploadFile", fileList[i]);
			}

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
			let str = "";

			let uploadResult = $("#uploadResult");
			for (let i = 0; i < uploadResultArr.length; i++) {
				/* 전달받은 데이터 검증 */
				if (!uploadResultArr || uploadResultArr.length == 0) {
					return
				}

				let obj = uploadResultArr[i];
				let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_"
						+ obj.uuid + "_" + obj.fileName);

				str += "<div id='result_card'>";
				str += "<img src='/store/display?fileName=" + fileCallPath
						+ "'>";
				str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
				str += "<input type='hidden' name='imageList["+i+"].fileName' value='"+ obj.fileName +"'>";
				str += "<input type='hidden' name='imageList["+i+"].uuid' value='"+ obj.uuid +"'>";
				str += "<input type='hidden' name='imageList["+i+"].uploadPath' value='"+ obj.uploadPath +"'>";
				str += "</div>";

			}
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