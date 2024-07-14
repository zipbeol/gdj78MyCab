<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Main</title>
<!-- Meta -->
<meta name="description"
	content="Marketplace for Bootstrap Admin Dashboards">
<meta name="author" content="Bootstrap Gallery">
<link rel="canonical" href="https://www.bootstrap.gallery/">
<meta property="og:url" content="https://www.bootstrap.gallery">
<meta property="og:title"
	content="Admin Templates - Dashboard Templates | Bootstrap Gallery">
<meta property="og:description"
	content="Marketplace for Bootstrap Admin Dashboards">
<meta property="og:type" content="Website">
<meta property="og:site_name" content="Bootstrap Gallery">
<link rel="shortcut icon" href="/assets/images/favicon.svg">
<!-- *************
			************ CSS Files *************
		************* -->
<link rel="stylesheet"
	href="/assets/fonts/bootstrap/bootstrap-icons.css">
<link rel="stylesheet" href="/assets/css/main.min.css">

<!-- *************
			************ Vendor Css Files *************
		************ -->

<!-- Scrollbar CSS -->
<link rel="stylesheet"
	href="/assets/vendor/overlay-scroll/OverlayScrollbars.min.css">

<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">

<!-- 따로 적용한 CSS -->
<link rel="stylesheet" href="/assets/css/default.css">
<style>
.cardH {
	min-height: 400px;
}

.news-item {
	margin-bottom: 20px;
	display: flex;
	align-items: center;
}

.news-item img {
	width: 50px;
	height: 50px;
	margin-right: 10px;
	object-fit: cover;
}

.news-item a {
	display: block;
	font-size: 1rem;
	color: #000;
	text-decoration: none;
}

.news-item p {
	margin: 0;
	font-size: 0.8rem;
	color: #666;
}

.st {
	margin-left: -28px;
}

.moreNews-container {
	text-align: right;
	margin-top: 20px;
}

.moreNews {
	font-size: 1rem;
	color: #007bff;
	text-decoration: none;
}

.moreNews:hover {
	text-decoration: underline;
}
</style>
</head>

<body>
	<!-- Page wrapper start -->
	<div class="page-wrapper">

		<!-- Main container start -->
		<div class="main-container">

			<!-- Sidebar wrapper start -->
			<jsp:include page="/views/sidebar.jsp" />
			<!-- Sidebar wrapper end -->

			<!-- App container starts -->
			<div class="app-container">

				<!-- App header starts -->

				<div class="app-header d-flex align-items-center">

					<!-- Toggle buttons start -->
					<div class="d-flex">
						<button class="btn btn-outline-primary me-2 toggle-sidebar"
							id="toggle-sidebar">
							<i class="bi bi-list fs-5"></i>
						</button>
						<button class="btn btn-outline-primary me-2 pin-sidebar"
							id="pin-sidebar">
							<i class="bi bi-list fs-5"></i>
						</button>
					</div>
					<!-- Toggle buttons end -->

					<!-- App brand sm start -->
					<div class="app-brand-sm d-lg-none d-sm-block">
						<a href="/"> <img src="/assets/images/logo-sm.svg"
							class="logo" alt="Bootstrap Gallery">
						</a>
					</div>
					<!-- App brand sm end -->

					<!-- Breadcrumb start -->
					<ol class="breadcrumb d-none d-lg-flex ms-3">
						<li class="breadcrumb-item"><a href="/"><i
								class="bi bi-house lh-1"></i></a> <a href="/"
							class="text-decoration-none">메인</a> <!-- 여기에 경로 추가 --></li>
					</ol>
					<!-- Bread
                <!-- App header actions start -->
					<jsp:include page="/views/appHeader.jsp" />
					<!-- App header actions end -->

				</div>

				<!-- App header ends -->

				<!-- App body starts -->
				<div class="app-body">

					<div class="container-fluid">
						<div class="row">
							<!-- 왼쪽 상단 공지 -->
							<div class="col-md-3">
								<div class="card mb-3">
									<div class="card-body cardH">
										<h2 class="chart-title ">공지</h2>
										<!-- 여기에 공지 내용을 넣으세요 -->
									</div>
								</div>
							</div>
							<!-- 왼쪽 상단 뉴스 -->
							<div class="col-md-3">
								<div class="card mb-3">
									<div class="card-body cardH">
										<h2 class="chart-title ">택시 최신 뉴스</h2>
										<hr/>
										<c:if test="${not empty newsList}">
											<ul class="st">
												<c:forEach var="news" items="${newsList}">
													<li class="news-item"><img src="${news.image}"
														alt="${news.title}">
														<div>
															<a href="${news.link}" target="_blank"> <c:choose>
																	<c:when test="${fn:length(news.title) > 8}">
                                    ${fn:substring(news.title, 0, 19)}...
                                </c:when>
																	<c:otherwise>
                                    ${news.title}
                                </c:otherwise>
																</c:choose>
															</a>
															<p>${news.date}</p>
														</div></li>
												</c:forEach>
											</ul>
										</c:if>
										<div class="moreNews-container">
											<a class="moreNews" href="http://taxi-news.co.kr/bbs/board.php?bo_table=board_01">뉴스 더보기</a>
										</div>
									</div>
								</div>
							</div>
							<!-- 오른쪽 상단 월 별 수익 -->
							<div class="col-md-3">
								<div class="card mb-3">
									<div class="card-body cardH">
										<h2 class="chart-title ">월 별 수익</h2>
										<canvas id="revenueChart"></canvas>
									</div>
								</div>
							</div>
							<!-- 오른쪽 상단 월 별 지출 -->
							<div class="col-md-3">
								<div class="card mb-3">
									<div class="card-body cardH">
										<h2 class="chart-title ">월 별 지출</h2>
										<canvas id="expenseChart"></canvas>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<!-- 왼쪽 하단 공지 및 이벤트 -->
							<div class="col-md-6">
								<div class="card mb-3">
									<div class="card-body">
										<h2 class="chart-title">나의 근태 현황</h2>
										<!-- 여기에 공지 및 이벤트 내용을 넣으세요 -->
									</div>
								</div>
							</div>
							<!-- 오른쪽 하단 기타 -->
							<div class="col-md-6">
								<div class="card mb-3">
									<div class="card-body">
										<h2 class="chart-title">기타</h2>
										<!-- 여기에 기타 내용을 넣으세요 -->
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
				<!-- App body ends -->

				<!-- App footer start -->
				<div class="app-footer">
					<span>GDJ78FINALPROJECTMYCAB</span>
				</div>
				<!-- App footer end -->

			</div>
			<!-- App container ends -->

		</div>
		<!-- Main container end -->

	</div>
	<!-- Page wrapper end -->

	<!-- *************
        ************ JavaScript Files *************
    ************* -->
	<!-- Required jQuery first, then Bootstrap Bundle JS -->
	<script src="/assets/js/jquery.min.js"></script>
	<script src="/assets/js/bootstrap.bundle.min.js"></script>

	<!-- *************
        ************ Vendor Js Files *************
    ************* -->

	<!-- Overlay Scroll JS -->
	<script
		src="/assets/vendor/overlay-scroll/jquery.overlayScrollbars.min.js"></script>
	<script src="/assets/vendor/overlay-scroll/custom-scrollbar.js"></script>


	<!-- Custom JS files -->
	<script src="/assets/js/custom.js"></script>
	<script src="/assets/js/localStorage.js"></script>
</body>
<script>
	// 스크립트

	var message = "${message}";
	if (message) {
		alert(message);
	}
</script>
</html>