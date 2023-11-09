<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
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
<meta charset="UTF-8">
<title>댓글 수정</title>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>

</head>
<body>

<div class="col-lg-6 offset-lg-1">
    <div class="contact-form">
        <div class="leave-comment">
            <h4>Comment</h4>
            <p><b>${reply.user_id}</b> 님 댓글을 수정해 주세요</p>
            <form action="#" class="comment-form">
                <div class="row">
                    <div class="col-lg-12">
                        <textarea name="reply_content" id="reply_content" placeholder="Comment mesage">${reply.reply_content}</textarea>
                        <input type="hidden" name="board_bno" value="${reply.board_bno}">
	                    <input type="hidden" name="reply_rno" value="${reply.reply_rno}">
                        <div class="btn_wrap">
	                        <a href="#" class="btn primary-btn" onclick="update_btn()">수정</a>
	                        <a href="#" id="cancel_btn" class="btn primary-btn">취소</a>
	                    </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    /* 취소 버튼 */
    $("#cancel_btn").on("click", function(e){
        window.close();
    }); 

    /* 수정 버튼 */
    function update_btn(){
        const reply_rno = $('input[name=reply_rno]').val();
        const user_id = $('input[name=user_id]').val();
        const reply_content = $('#reply_content').val();

        const data = {
            reply_rno: reply_rno,
            user_id: user_id,
            reply_content: reply_content
        };

        $.ajax({
            data: data,
            type: 'POST',
            url: '/boardReply/modify',
            success: function(result){
                alert('수정이 완료 되었습니다.');
                $(opener.location).attr("href", "/board/get?board_bno=${reply.board_bno}");
                window.close();
            }       
        });     
    }
</script>
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