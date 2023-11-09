<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
</head>
<body>

	<!-- Header Section Begin -->
	<header class="header-section">

		<div class="container">
			<div class="inner-header">
				<a href="/store/home"><img src="/resources/img/obbang.png"></a>
			</div>
		</div>
		<div class="nav-item">
			<div class="container">
				<div class="nav-depart">
					<div class="depart-btn">
						<i class="ti-menu"></i> <span>빵지순례</span>
						<ul class="depart-hover">
							<li><a href="/store/list_bread?store_category=bread">인생
									빵집</a></li>
							<li><a href="/store/list_coffee?store_category=coffee">인생
									카페</a></li>
							<li><a href="/store/list_desert?store_category=desert">인생
									디저트</a></li>
							<li><a href="/store/list_sandwich?store_category=sandwich">인생
									샌드위치</a></li>
						</ul>
					</div>
				</div>
				<nav class="nav-menu mobile-menu">
					<ul>
						<li><a href="/store/home">Home</a></li>
						<li><a href="/board/list">게시판</a>
							<ul class="dropdown">
								<li><a href="/notice/noticelist">공지사항</a></li>
								<li><a href="/event/eventlist">이벤트</a></li>
								<li><a href="/board/list">문의 게시판</a></li>
							</ul></li>
						<c:if test="${user != null }">
							<!-- 로그인이 돼있을 때 -->
							<li><a href="/cart/${user.user_id}">장바구니</a>
								<ul class="dropdown">
									<li><a href="/store/orderList?user_id=${user.user_id }">주문현황</a></li>
								</ul></li>


							<li><a href="/member/detail?user_bno=${user.user_bno}">회원정보</a>
							<li><a href="/member/logout.do">로그아웃</a></li>
							<c:if test="${user.user_admin == 1 }">
								<li><a href="/admin/main">관리자 페이지</a></li>
							</c:if>
						</c:if>

						<c:if test="${user == null}">
							<!-- 로그인이 안돼있을 때 -->
							<li><a href="/member/join">회원가입</a>
							<li><a href="/member/login">로그인</a></li>
						</c:if>

					</ul>
				</nav>
				<div id="mobile-menu-wrap"></div>
			</div>
		</div>
	</header>
</body>
</html>