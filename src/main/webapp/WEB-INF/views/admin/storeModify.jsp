<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/admin/storeModify.css">
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

<body>

	<%@include file="../includes/admin/header.jsp"%>

	<div class="admin_content_wrap">
		<div class="admin_content_subject">
			<span>점포 등록</span>
		</div>
		<div class="admin_content_main">
			<form action="/admin/storeModify" method="post" id="modifyForm">
				<div class="form_section">
					<div class="form_section_title">
						<label>점포이름</label>
					</div>
					<div class="form_section_content">
						<input name="store_store" value="${store.store_store}"> <span
							class="ck_warn store_warn">점포이름을 입력해주세요.</span>
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>주 소</label>
					</div>
					<div class="form_section_content">
						<input name="store_adress" value="${store.store_adress}">
						<span class="ck_warn adress_warn">주소를 입력해주세요.</span>
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>전화번호</label>
					</div>
					<div class="form_section_content">
						<input name="store_tel" value="${store.store_tel}"> <span
							class="ck_warn tel_warn">전화번호를 입력해주세요.</span>
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>설 명</label>
					</div>
					<div class="form_section_content">
						<input name="store_info" value="${store.store_info}"> <span
							class="ck_warn info_warn">설명을 입력해주세요.</span>
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>카테고리</label>
					</div>
					<div class="form_section_content">
						<input name="store_category" value="${store.store_category}">
						<span class="ck_warn category_warn">카테고리를 입력해주세요.</span>
					</div>
				</div>
				<input type="hidden" name='store_id' value="${store.store_id}">
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
				<button id="modifyBtn" class="btn modify_btn">수 정</button>
				<button id="deleteBtn" class="btn delete_btn">삭 제</button>
			</div>
		</div>
		<form id="moveForm" action="/admin/storeManage" method="get">
			<input type="hidden" name="pageNum" value="${cri.pageNum}"> <input
				type="hidden" name="amount" value="${cri.amount}"> <input
				type="hidden" name="keyword" value="${cri.keyword}"> <input
				type="hidden" name='store_id' value="${store.store_id}">
		</form>
	</div>

	
	<script>
	/* 취소 버튼 */
	$("#cancelBtn").on("click", function(e){
		e.preventDefault();
		$("#moveForm").submit();
	});
	
	/* 수정 버튼 */
	$("#modifyBtn").on("click", function(e){
		e.preventDefault();
		$("#modifyForm").submit();
	});
	/* 수정 버튼 */
	$("#modifyBtn").on("click",function(e){
		
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
		let category = $("select[name='store_category']").val();
		if(store){
			$(".store_warn").css('display','none');
			storeCk = true;
		} else {
			$(".store_warn").css('display','block');
			storeCk = false;
		}
		
		if(adress){
			$(".adress_warn").css('display','none');
			adressCk = true;
		} else {
			$(".adress_warn").css('display','block');
			adressCk = false;
		}
		
		if(tel){
			$(".tel_warn").css('display','none');
			telCk = true;
		} else {
			$(".tel_warn").css('display','block');
			telCk = false;
		}	
		
		if(info){
			$(".info_warn").css('display','none');
			infoCk = true;
		} else {
			$(".info_warn").css('display','block');
			infoCk = false;
		}
		if(category){
			$(".category_warn").css('display','none');
			categoryCk = true;
		} else {
			$(".category_warn").css('display','block');
			categoryCk = false;
		}
		/* 최종 확인 */
		if(storeCk && adressCk && telCk && infoCk && categoryCk){
			//alert('통과');
			$("#modifyForm").submit();
		} else {
			return false;
		}
		
	});
	/* 삭제 버튼 */
	$("#deleteBtn").on("click", function(e){
		e.preventDefault();
		let moveForm = $("#moveForm");
		moveForm.find("input").remove();
		moveForm.append('<input type="hidden" name="store_id" value="${store.store_id}">');
		moveForm.attr("action", "/admin/storeDelete");
		moveForm.attr("method", "post");
		moveForm.submit();
	});
	/* 기존 이미지 출력 */
	let store_id = '<c:out value="${store.store_id}"/>';
	let uploadResult = $("#uploadResult");
	
	$.getJSON("/store/StoreGetImageList", {store_id : store_id}, function(arr){
		
		console.log(arr);
		
		if(arr.length === 0){
			
			
			let str = "";
			str += "<div id='result_card'>";
			str += "<img src='/resources/img/storeNoImage.png'>";
			str += "</div>";
			
			uploadResult.html(str);				
			return;
		}
		let str = "";
		for(let i=0;i<arr.length;i++){
		let obj = arr[i];
		
		let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
		str += "<div id='result_card'";
		str += "data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "'";
		str += ">";
		str += "<img src='/store/display?fileName=" + fileCallPath +"'>";
		str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
		str += "<input type='hidden' name='imageList["+i+"].fileName' value='"+ obj.fileName +"'>";
		str += "<input type='hidden' name='imageList["+i+"].uuid' value='"+ obj.uuid +"'>";
		str += "<input type='hidden' name='imageList["+i+"].uploadPath' value='"+ obj.uploadPath +"'>";				
		str += "</div>";
		}
		uploadResult.html(str);			
		
	});// GetJSON
	/* 이미지 삭제 버튼 동작 */
	$("#uploadResult").on("click", "#result_card", function(e){
		
		deleteFile();
		
	});
	
	/* 파일 삭제 메서드 */
	function deleteFile(){
		
		$("#result_card").remove();
	}
	/* 이미지 업로드 */
	$("input[type='file']").on("change", function(e){
		
		/* 이미지 존재시 삭제 */
		if($("#result_card").length > 0){
			deleteFile();
		}
				
		let formData = new FormData();
		let fileInput = $('input[name="uploadFile"]');
		let fileList = fileInput[0].files;
		let fileObj = fileList[0];
		
		if(!fileCheck(fileObj.name, fileObj.size)){
			return false;
		}
		
		formData.append("uploadFile", fileObj);
		
		$.ajax({
			url: '/admin/uploadAjaxAction',
	    	processData : false,
	    	contentType : false,
	    	data : formData,
	    	type : 'POST',
	    	dataType : 'json',
	    	success : function(result){
	    		console.log(result);
	    		showUploadImage(result);
	    	},
	    	error : function(result){
	    		alert("이미지 파일이 아닙니다.");
	    	}
		});		

		
	});
		
	/* var, method related with attachFile */
	let regex = new RegExp("(.*?)\.(jpg|png)$");
	let maxSize = 1048576; //1MB	
	
	function fileCheck(fileName, fileSize){

		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
			  
		if(!regex.test(fileName)){
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		
		return true;		
		
	}
	
	/* 이미지 출력 */
	function showUploadImage(uploadResultArr){
		
		/* 전달받은 데이터 검증 */
		if(!uploadResultArr || uploadResultArr.length == 0){return}
		
		let uploadResult = $("#uploadResult");
		let str = "";
		for(let i=0;i<uploadResultArr.length;i++){
		let obj = uploadResultArr[i];
		
		
		//let fileCallPath = encodeURIComponent(obj.uploadPath.replace(/\\/g, '/') + "/s_" + obj.uuid + "_" + obj.fileName);
		//replace 적용 하지 않아도 가능
		let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
		
		str += "<div id='result_card'>";
		str += "<img src='/store/display?fileName=" + fileCallPath +"'>";
		str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
		str += "<input type='hidden' name='imageList["+i+"].fileName' value='"+ obj.fileName +"'>";
		str += "<input type='hidden' name='imageList["+i+"].uuid' value='"+ obj.uuid +"'>";
		str += "<input type='hidden' name='imageList["+i+"].uploadPath' value='"+ obj.uploadPath +"'>";		
		str += "</div>";		
	}
   		uploadResult.append(str);     
        
	}
	</script>
</body>
</html>