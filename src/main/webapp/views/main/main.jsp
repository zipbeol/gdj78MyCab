<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>메인</title>
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

<!-- js  -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>

<!-- 따로 적용한 CSS -->
<link rel="stylesheet" href="/assets/css/default.css">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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

.carousel-inner img {
	height: 330px;
}

.time-section {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-top: 20px;
}

.time-info {
	text-align: center;
	flex: 1;
	font-size: 1.5em; /* 글자 크기 조절 */
}

.clock {
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 2.5em;
	color: #333;
	font-weight: bold;
}

.clock div {
	margin: 0 5px;
	padding: 10px;
	background: #f0f0f0;
	border-radius: 10px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
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
										<h2 class="chart-title ">공지사항</h2>
										<!-- 여기에 공지 내용을 넣으세요 -->
										<div id="carouselExampleIndicators" class="carousel slide"
											data-bs-ride="carousel" data-bs-interval="2000">
											<div class="carousel-indicators">
												<button type="button"
													data-bs-target="#carouselExampleIndicators"
													data-bs-slide-to="0" class="active" aria-current="true"
													aria-label="Slide 1"></button>
												<button type="button"
													data-bs-target="#carouselExampleIndicators"
													data-bs-slide-to="1" aria-label="Slide 2"></button>
												<button type="button"
													data-bs-target="#carouselExampleIndicators"
													data-bs-slide-to="2" aria-label="Slide 3"></button>
											</div>
											<div class="carousel-inner">
												<div class="carousel-item active">
													<a href="/notice/detail.go?notice_idx=58"> <img
														src="/assets/notice1.png" id="img1" class="d-block w-100">
													</a>
												</div>
												<div class="carousel-item">
													<a href="/notice/detail.go?notice_idx=56"> <img
														src="/assets/notice2.png" id="img2" class="d-block w-100">
													</a>
												</div>
												<div class="carousel-item">
													<a href="/notice/detail.go?notice_idx=57"> <img
														src="/assets/notice3.png" id="img3" class="d-block w-100">
													</a>
												</div>
											</div>
											<button class="carousel-control-prev" type="button"
												data-bs-target="#carouselExampleIndicators"
												data-bs-slide="prev">
												<span class="carousel-control-prev-icon" aria-hidden="true"></span>
												<span class="visually-hidden">Previous</span>
											</button>
											<button class="carousel-control-next" type="button"
												data-bs-target="#carouselExampleIndicators"
												data-bs-slide="next">
												<span class="carousel-control-next-icon" aria-hidden="true"></span>
												<span class="visually-hidden">Next</span>
											</button>
										</div>
									</div>
								</div>
							</div>
							<!-- 왼쪽 상단 뉴스 -->
							<div class="col-md-3">
								<div class="card mb-3">
									<div class="card-body cardH">
										<h2 class="chart-title ">택시 뉴스</h2>
										<hr />
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
											<a class="moreNews"
												href="http://taxi-news.co.kr/bbs/board.php?bo_table=board_01"
												target="_blank">뉴스 더보기</a>
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
										<h2 class="chart-title"></h2>
										<div class="time-section">
											<div class="time-info">
												<span>오늘의 출근 시간</span>
												<br/>
												<div class="clock">
													<div>${att_hour}</div>
													시
													<div>${att_minute}</div>
													분
												</div>
											</div>
											<div class="time-info">
												<span>퇴근까지 남은 시간</span>
												<br/>
												<div class="clock">
													<div id="remainingHours">00</div>
													시
													<div id="remainingMinutes">00</div>
													분
												</div>
											</div>
										</div>
										<hr/>
										
										<canvas id="attendanceChart"></canvas>
										
										
										
										
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
	
	function updateRemainingTime() {
        var now = new Date();
        var endTime = new Date();
        endTime.setHours(18, 0, 0, 0);

        var diff = endTime - now;
        if (diff > 0) {
            var hours = Math.floor(diff / (1000 * 60 * 60));
            var minutes = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60));

            document.getElementById("remainingHours").innerText = hours.toString().padStart(2, '0');
            document.getElementById("remainingMinutes").innerText = minutes.toString().padStart(2, '0');
        } else {
            document.getElementById("remainingHours").innerText = "00";
            document.getElementById("remainingMinutes").innerText = "00";
        }
    }

    window.onload = updateRemainingTime;
    setInterval(updateRemainingTime, 60000);
    
    
    
    // Chart.js 막대 차트 설정
    var ctx = document.getElementById('attendanceChart').getContext('2d');
    var attendanceChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels:  ["5월", "6월", "7월"],
            datasets: [
                {
                    label: '지각',
                    data: ${late},
                    backgroundColor: '#FF7E9D',
                    borderColor: 'white',
                    borderWidth: 1
                },
                {
                    label: '출근',
                    data: ${present},
                    backgroundColor: '#3CB4FF',
                    borderColor: 'white',
                    borderWidth: 1
                },
                {
                    label: '연차/반차',
                    data: ${absent},
                    backgroundColor: '#9696FF',
                    borderColor: 'white',
                    borderWidth: 1
                }
            ]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
</script>
</html>