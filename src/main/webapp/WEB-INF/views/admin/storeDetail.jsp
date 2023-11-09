<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="../resources/css/admin/storeDetail.css">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
  <style type="text/css">
	#result_card img{
		max-width: 100%;
	    height: auto;
	    display: block;
	    padding: 5px;
	    margin-top: 10px;
	    margin: auto;	
	}
</style>
</head>
<body>
		<%@include file="../includes/admin/header.jsp" %>
                <div class="admin_content_wrap">
                    <div class="admin_content_subject"><span>점포 상세</span></div>

                    <div class="admin_content_main">

                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>점포 이름</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="bookName" value="${store.store_store}" disabled>
                    			</div>
                    		</div>
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>주 소</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="store_adress" value="${store.store_adress}" disabled>
                    				                    				
                    			</div>
                    		</div>            
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>전화번호</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="store_tel" value="${store.store_tel}" disabled>
                    			</div>
                    		</div>             
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>설 명</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="store_info" value="${store.store_info}" disabled>
                    			</div>
                    		</div>             
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>카테고리</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="store_category" value="${store.store_category}" disabled>
                    			</div>
                    		</div>             
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품 이미지</label>
                    			</div>
                    			<div class="form_section_content">

									<div id="uploadReslut">
									</div>
                    			</div>
                    		</div>
                   		
                   			<div class="btn_section">
                   				<button id="cancelBtn" class="btn">상품 목록</button>
	                    		<button id="modifyBtn" class="btn enroll_btn">수정 </button>
	                    	</div> 
                    </div>      

                	
                	<form id="moveForm" action="/admin/storeManage" method="get" >
 						<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
						<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
						<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
                	</form>
                	
                </div>
 				
 <script>
 	/* 이미지 정보 호출 */
	let store_id = '<c:out value="${store.store_id}"/>';
	let uploadReslut = $("#uploadReslut");
	$.getJSON("/store/StoreGetImageList", {store_id : store_id}, function(arr){	
		
		if(arr.length === 0){	
			let str = "";
			str += "<div id='result_card'>";
			str += "<img src='/resources/img/storeNoImage.png'>";
			str += "</div>";
			
			uploadReslut.html(str);	
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
		str += "</div>";		
		}
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
		let addInput = '<input type="hidden" name="store_id" value="${store.store_id}">';
		$("#moveForm").append(addInput);
		$("#moveForm").attr("action","/admin/storeModify");
		$("#moveForm").submit();
	});	
	</script>
</body>
</html>