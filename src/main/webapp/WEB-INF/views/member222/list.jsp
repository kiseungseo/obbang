<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<style>
a {
	text-decoration: none;
}

table {
	border-collapse: collapse;
	width: 1000px;
	margin-top: 20px;
	text-align: center;
}

td, th {
	border: 1px solid black;
	height: 50px;
}

th {
	font-size: 17px;
}

thead {
	font-weight: 700;
}

.table_wrap {
	margin: 50px 0 0 50px;
}

.bno_width {
	width: 12%;
}

.writer_width {
	width: 20%;
}

.regdate_width {
	width: 15%;
}

.updatedate_width {
	width: 15%;
}

.top_btn {
	font-size: 20px;
	padding: 6px 12px;
	background-color: #fff;
	border: 1px solid #ddd;
	font-weight: 600;
}
</style>
</head>
<body>
<%@ include file="../includes/header.jsp"%>
	<div class="container">
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<h1>회원 목록</h1> 
	</div>
	<hr>

	<div class="table_wrap">
		<table>
			<thead>
				<tr>
					<th class="bno_width">번호</th>
					<th class="bno_width">아이디</th>
					<th class="title_width">패스워드</th>
					<th class="writer_width">이메일</th>
					<th class="regdate_width">성별</th>
					<th class="updatedate_width">헨드폰번호</th>
					<th class="updatedate_width">이름</th>
					<th class="updatedate_width">생년</th>
					<th class="updatedate_width">생월</th>
					<th class="updatedate_width">생일</th>
					<th class="updatedate_width">번지수</th>
					<th class="updatedate_width">주소</th>
					<th class="updatedate_width">상세주소</th>
					<th class="updatedate_width">회원등급</th>
				</tr>
			</thead>
			<c:forEach items="${list}" var="list">
				<tr>
					<td><c:out value="${list.user_bno}" /></td>
					<td><a class="move"
						href='/member/detail?user_bno=<c:out value="${list.user_bno}"/>'>
							<c:out value="${list.user_id}" />
					</a></td>
					<td><c:out value="${list.user_pw}" /></td>
					<td><c:out value="${list.user_email}" /></td>
					<td><c:out value="${list.user_sex}" /></td>
					<td><c:out value="${list.user_phone}" /></td>
					<td><c:out value="${list.user_name}" /></td>
					<td><c:out value="${list.user_year}" /></td>
					<td><c:out value="${list.user_month}" /></td>
					<td><c:out value="${list.user_day}" /></td>
					<td><c:out value="${list.user_address1}" /></td>
					<td><c:out value="${list.user_address2}" /></td>
					<td><c:out value="${list.user_address3}" /></td>
					<td><c:out value="${list.user_admin}" /></td>


				</tr>
			</c:forEach>
		</table>
		<form id="moveForm" method="get"></form>
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
<hr>
	<%@ include file="../includes/footer.jsp"%>
</body>
</html>