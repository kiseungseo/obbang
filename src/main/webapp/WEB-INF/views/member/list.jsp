<!DOCTYPE html>                                                                                                             
<%@ page contentType="text/html; charset=utf-8"%>                                  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>                                                            
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>                                                           
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>                                    
<title>아이디 찾기</title>
<html>
<head>
 <script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>            
<meta name="description" content="Fashi Template">
    <meta name="keywords" content="Fashi, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/themify-icons.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/style.css" type="text/css">
 

</head>
<body>

 <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <a href="/store/home"><i class="fa fa-home"></i> Home</a>
                        <span>List</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
<div class="container">
<div style="padding-top: 50px">
				<table class="table table-hover">
			<thead>
				<tr>
					<th style="font-size: smaller;" class="bno_width">번호</th>
					<th style="font-size: smaller;" class="bno_width">아이디</th>
					<th style="font-size: smaller;" class="title_width">패스워드</th>
					<th style="font-size: smaller;" class="writer_width">이메일</th>
					<th style="font-size: smaller;" class="regdate_width">성별</th>
					<th style="font-size: smaller;" class="regdate_width">헨드폰번호</th>
					<th style="font-size: smaller;" class="regdate_width">이름</th>
					<th style="font-size: smaller;" class="updatedate_width">생년월일</th>
					<th style="font-size: smaller;" class="updatedate_width">주소</th>
					<th style="font-size: smaller;" class="updatedate_width">회원등급</th>
				</tr>
			</thead>
			<c:forEach items="${list}" var="list">
				<tr>
					<td style="font-size: smaller;"><c:out value="${list.user_bno}" /></td>
					<td ><a class="move"
						href='/member/detail?user_bno=<c:out value="${list.user_bno}"/>'>
							<c:out value="${list.user_id}" />
					</a></td>
					<td style="font-size: smaller;"><c:out value="${list.user_pw}" /></td>
					<td style="font-size: smaller;"><c:out value="${list.user_email}" /></td>
					<td style="font-size: smaller;"><c:out value="${list.user_sex}" /></td>
					<td style="font-size: smaller;"><c:out value="${list.user_phone}" /></td>
					<td style="font-size: smaller;"><c:out value="${list.user_name}" /></td>
					<td style="font-size: smaller;"><c:out value="${list.user_year}"/>/<c:out value="${list.user_month}"/>/<c:out value="${list.user_day}"/></td>
					<td style="font-size: smaller;"><c:out value="${list.user_address1}" />/<c:out value="${list.user_address2}" />/<c:out value="${list.user_address3}" /></td>
					<td style="font-size: smaller;"><c:out value="${list.user_admin}" /></td>


				</tr>
			</c:forEach>
		</table>
		<form id="moveForm" method="get"></form>
	</div>
	</div>

	<script>
$(document).ready(function(){
	
	let result = '<c:out value="${result}"/>';
	
	checkAlert(result);
	
	function checkAlert(result){
		
		if(result === ''){
			return;
		}
		
		if(result === "enrol success"){
			alert("등록이 완료되었습니다.");
		}
		 if(result === "modify success"){
	            alert("수정이 완료되었습니다.");
	        }

	        if(result === "delete success"){
	            alert("회원탈퇴 되었습니다.");
	        }
		
	}	
	
});




</script>

</body>
</html>