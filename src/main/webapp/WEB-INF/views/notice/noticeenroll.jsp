<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">
<!-- Css Styles -->
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="../resources/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="../resources/css/themify-icons.css" type="text/css">
<link rel="stylesheet" href="../resources/css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="../resources/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="../resources/css/nice-select.css" type="text/css">
<link rel="stylesheet" href="../resources/css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="../resources/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="../resources/css/style.css" type="text/css">

<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"/></script>
<title>공지사항</title>

<script>
	function forCheck() {
	  var notice_writer = $('#notice_writer').val();
	  var notice_title = $('#notice_title').val();
	  var notice_content = $('#notice_content').val();
	  var notice_image = $('#notice_image').val();
	  
		  if (notice_writer.trim() === "") {
		    alert('공지사항 작성자를 입력해주세요.');
		    $('#notice_writer').focus();
		    return false;
		  }
		  if (notice_title.trim() === "") {
		    alert('공지사항 제목을 입력해주세요.');
		    $('#notice_title').focus();
		    return false;
		  }
		  if (notice_content.trim() === "") {
		    alert('공지사항 내용을 입력해주세요.');
		    $('#notice_content').focus();
		    return false;
		  }
		  if (notice_image.trim() === "") {
		    alert('공지사항 이미지를 등록해주세요.');
		    $('#notice_image').focus();
		    return false;
		  }
	}
</script>

</head>
<body>
<%@ include file="../includes/header.jsp" %>
<!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <a href="/"><i class="fa fa-home"></i> Home</a>
                        <span>Notice</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section Begin -->
	<div class="container">
		<br>
		<h4>&nbsp;공지사항</h4>
		<br>
	</div>
	<hr>
	<div class="container">
		<form action="/notice/noticeenroll" class="form-horizontal" method="post" onsubmit="return forCheck();">
		   <img id="preview" src="" style="max-width: 100%;">
           <br>
           <br>
           <div class="form-group row">
				<label class="col-sm-2 control-label" >이미지</label>
				<div class="col-sm-5">
		           <div class="form_section_content">
		           	<input class="btn btn-outline-dark" type="file" id="fileItem" name="fileItem">
		           </div>
	           </div>
           </div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">작성자</label>
				<div class="col-sm-3">
					<input name="notice_writer" id="notice_writer" type="text" class="form-control" placeholder="이름">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">제목</label>
				<div class="col-sm-5">

					<input name="notice_title" id="notice_title" type="text" class="form-control"
						placeholder="제목을 입력해주세요">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label" >내용</label>
				<div class="col-sm-8">
					<textarea name="notice_content" id="notice_content" cols="50" rows="5" class="form-control" placeholder="내용을 입력해주세요"></textarea>
				</div>
			</div>
			
			<!-- 이미지 -->
			<div class="form-group row">
				<label class="col-sm-2 control-label">이벤트 이미지</label>
				<div class="col-sm-5">
					<input class="form-control" readonly="readonly" id="notice_image" name="notice_image" value="${pageInfo.notice_image}">
				</div>
			</div>
			
			<div class="form-group row" align="right">
				<div class="col-sm-offset-2 col-sm-10 ">
				 <input type="submit" class="btn primary-btn" value="등록">				
			     <a href="noticelist" class="btn primary-btn"> 취소 </a> 
				</div>
			</div>
			<br>
		</form>
	</div>
<script type="text/javascript">

/* 이미지 업로드 */
$("input[type='file']").on("change", function(e){
	let formData = new FormData();
	let fileInput = $('input[name="fileItem"]');
	let fileList = fileInput[0].files;
	let fileObj = fileList[0];
	
 	if(!fileCheck(fileObj.name, fileObj.size)){
		return false;
	}
	formData.append("notice_image", fileObj);
	$.ajax({
	    url: '/notice/uploadAjaxAction',
	    processData : false,
	    contentType : false,
	    data : formData,
	    type : 'POST',
	    dataType : 'json',
	    success: function(result){
	        // 파일 업로드 결과를 input 요소에 넣어주는 부분
	        $("#notice_image").val(result.fileName);

	        // 미리보기 생성
	        $("#preview").attr("src", "/notice/display?fileName="+result.fileName);
	        alert("파일 업로드 완료!");
	    },

	    error : function(result){
	        alert("이미지 파일이 아닙니다.");
	    }
	}).always(function(){
	    // 파일 업로드가 끝난 후 input 요소에 값을 할당해주는 부분
	    $("input[type='file']").val("");
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
</script>
<jsp:include page="../includes/footer.jsp" />
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