<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<!-- Date Range CSS -->
<link rel="stylesheet" href="/assets/vendor/daterange/daterange.css">
<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">

<!-- 따로 적용한 CSS -->
<link rel="stylesheet" href="/assets/css/default.css">
<!-- FontAwesome 추가 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

<style>
.alert-placeholder {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	z-index: 1050;
	margin: 0;
	padding: 10px;
	text-align: center;
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
							class="text-decoration-none">메인</a></li>
						<li class="breadcrumb-item"><a href="#"
							class="text-decoration-none">인사 관리</a></li>
						<li class="breadcrumb-item"><a href="/emp/sal/list.go"
							class="text-decoration-none">급여 관리</a></li>
						<li class="breadcrumb-item"><a href="#"
							class="text-decoration-none">급여명세서 상세</a></li>
					</ol>
					<!-- Breadcrumb end -->

					<!-- App header actions start -->
					<jsp:include page="/views/appHeader.jsp" />
					<!-- App header actions end -->

				</div>

				<!-- App header ends -->

				<!-- App body starts -->
				<div class="app-body">

					<!-- Container starts -->
					<div class="container-fluid">
						<!-- Alert placeholder start -->
						<div id="alertPlaceholder"></div>
						<!-- Alert placeholder end -->
						<!-- Row start -->
						<div class="row">
							<div class="col-12">
								<div class="card mb-3">
									<div class="card-header">
										<h4 class="card-title">급여명세서 상세</h4>
									</div>
									<div class="card-body">
										<!-- 여기에 코딩 -->
												<div class="header">
            <h1>급여 설정</h1>
            <div>
                <label for="basicSalary">기본급:</label>
                <input type="text" id="basicSalary" class="input-box">
                <label for="mealAllowance">식대:</label>
                <input type="text" id="mealAllowance" class="input-box">
            </div>
        </div>
        <div class="table-container">
            <table>
                <tr>
                    <th colspan="2">인사부</th>
                </tr>
                <tr>
                    <td>부장</td>
                    <td><input type="text" class="input-box"></td>
                </tr>
                <tr>
                    <td>과장</td>
                    <td><input type="text" class="input-box"></td>
                </tr>
                <tr>
                    <td>대리</td>
                    <td><input type="text" class="input-box"></td>
                </tr>
                <tr>
                    <td>사원</td>
                    <td><input type="text" class="input-box"></td>
                </tr>
            </table>
            <table>
                <tr>
                    <th colspan="2">영업지원부</th>
                </tr>
                <tr>
                    <td>부장</td>
                    <td><input type="text" class="input-box"></td>
                </tr>
                <tr>
                    <td>과장</td>
                    <td><input type="text" class="input-box"></td>
                </tr>
                <tr>
                    <td>대리</td>
                    <td><input type="text" class="input-box"></td>
                </tr>
                <tr>
                    <td>사원</td>
                    <td><input type="text" class="input-box"></td>
                </tr>
            </table>
        </div>
        <div class="table-container">
            <table>
                <tr>
                    <th colspan="2">영업부</th>
                </tr>
                <tr>
                    <td>부장</td>
                    <td><input type="text" class="input-box"></td>
                </tr>
                <tr>
                    <td>과장</td>
                    <td><input type="text" class="input-box"></td>
                </tr>
                <tr>
                    <td>대리</td>
                    <td><input type="text" class="input-box"></td>
                </tr>
                <tr>
                    <td>사원</td>
                    <td><input type="text" class="input-box"></td>
                </tr>
            </table>
            <table>
                <tr>
                    <th colspan="2">택시관리부</th>
                </tr>
                <tr>
                    <td>부장</td>
                    <td><input type="text" class="input-box"></td>
                </tr>
                <tr>
                    <td>과장</td>
                    <td><input type="text" class="input-box"></td>
                </tr>
                <tr>
                    <td>대리</td>
                    <td><input type="text" class="input-box"></td>
                </tr>
                <tr>
                    <td>사원</td>
                    <td><input type="text" class="input-box"></td>
                </tr>
            </table>
        </div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- Row end -->

				</div>
				<!-- Container ends -->

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







</body>
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
<!-- Moment JS -->
<script src="/assets/js/moment.min.js"></script>
<!-- Date Range JS -->
<script src="/assets/vendor/daterange/daterange.js"></script>
<script src="/assets/vendor/daterange/custom-daterange.js"></script>
<!-- Custom JS files -->
<script src="/assets/js/custom.js"></script>
<script src="/assets/js/localStorage.js"></script>
<script src="/assets/js/showAlert.js"></script>
<!-- 페이지네이션 -->
<script src="/assets/js/jquery.twbsPagination.min.js"></script>

<script>

$(document).ready(function() {
 
	
});




function addCommasToNumber(number) {
    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}


	        


	



</script>