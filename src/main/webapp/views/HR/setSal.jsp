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

body {
	font-family: Arial, sans-serif;
}

.container {
	width: 90%;
	margin: auto;
}

.header {
	text-align: center;
	margin: 20px 0;
}

.salary-setup {
	display: flex;
	justify-content: center;
	gap: 20px;
	margin-bottom: 20px;
}

.table-container {
	display: flex;
	justify-content: space-between;
}

table {
	border-collapse: collapse;
	width: 22%;
	margin: 10px 0;
}

th, td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: center;
}

th {
	background-color: #f2f2f2;
}

.input-box {
	width: 130px;
	text-align: end;
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
							class="text-decoration-none">급여 설정</a></li>
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
										<h4 class="card-title">급여 설정</h4>
									</div>
									<div class="card-body">
										<!-- 여기에 코딩 -->
										<div class="text-end mb-1">
											<button class="btn btn-primary">설정</button>
										</div>
										<div class="header">
											<h1>급여 설정</h1>
										</div>
										<div class="salary-setup">
											<div>
												<label for="basicSalary">기본급:</label> <input type="text"
													id="basicSalary" value="${base.sal_base}" class="input-box">원
											</div>
											<div>
												<label for="mealAllowance">식대:</label> <input type="text"
													id="mealAllowance"  value="${base.sal_meal}" class="input-box">원
											</div>
										</div>
										<hr>
										<div class="table-container">
											<table>
												<tr>
													<th colspan="2">인사부</th>
												</tr>
												<tr>
													<td>대표이사</td>
													<td><input type="text" class="input-box" id="sal1"
														value="${sal['sal1']}">원</td>
												</tr>
												<tr>
													<td>부장</td>
													<td><input type="text" class="input-box" id="sal2"
														value="${sal['sal2']}">원</td>
												</tr>
												<tr>
													<td>과장</td>
													<td><input type="text" class="input-box" id="sal3"
														value="${sal['sal3']}">원</td>
												</tr>
												<tr>
													<td>대리</td>
													<td><input type="text" class="input-box" id="sal4"
														value="${sal['sal4']}">원</td>
												</tr>
												<tr>
													<td>사원</td>
													<td><input type="text" class="input-box" id="sal5"
														value="${sal['sal5']}">원</td>
												</tr>
											</table>
											<table>
												<tr>
													<th colspan="2">영업지원부</th>
												</tr>
												<tr>
													<td>부장</td>
													<td><input type="text" class="input-box" id="sal6"
														value="${sal['sal6']}">원</td>
												</tr>
												<tr>
													<td>과장</td>
													<td><input type="text" class="input-box" id="sal7"
														value="${sal['sal7']}">원</td>
												</tr>
												<tr>
													<td>대리</td>
													<td><input type="text" class="input-box" id="sal8"
														value="${sal['sal8']}">원</td>
												</tr>
												<tr>
													<td>사원</td>
													<td><input type="text" class="input-box" id="sal9"
														value="${sal['sal9']}">원</td>
												</tr>
											</table>
											<table>
												<tr>
													<th colspan="2">영업부</th>
												</tr>
												<tr>
													<td>부장</td>
													<td><input type="text" class="input-box" id="sal10"
														value="${sal['sal10']}">원</td>
												</tr>
												<tr>
													<td>과장</td>
													<td><input type="text" class="input-box" id="sal11"
														value="${sal['sal11']}">원</td>
												</tr>
												<tr>
													<td>대리</td>
													<td><input type="text" class="input-box" id="sal12"
														value="${sal['sal12']}">원</td>
												</tr>
												<tr>
													<td>사원</td>
													<td><input type="text" class="input-box" id="sal13"
														value="${sal['sal13']}">원</td>
												</tr>
											</table>
											<table>
												<tr>
													<th colspan="2">택시관리부</th>
												</tr>
												<tr>
													<td>부장</td>
													<td><input type="text" class="input-box" id="sal14"
														value="${sal['sal14']}">원</td>
												</tr>
												<tr>
													<td>과장</td>
													<td><input type="text" class="input-box" id="sal15"
														value="${sal['sal15']}">원</td>
												</tr>
												<tr>
													<td>대리</td>
													<td><input type="text" class="input-box" id="sal16"
														value="${sal['sal16']}">원</td>
												</tr>
												<tr>
													<td>사원</td>
													<td><input type="text" class="input-box" id="sal17"
														value="${sal['sal17']}">원</td>
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
	var sal_base = '${base.sal_base}';
	var sal_meal = '${base.sal_meal}';
	
	
	$('#basicSalary').val(addCommasToNumber(sal_base));
	$('#mealAllowance').val(addCommasToNumber(sal_meal));

	
});


function addCommasToNumber(number) {
    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

document.addEventListener("DOMContentLoaded", function() {
    var ids = ['sal1', 'sal2', 'sal3', 'sal4', 'sal5', 'sal6', 'sal7', 'sal8', 'sal9', 'sal10', 'sal11', 'sal12', 'sal13', 'sal14', 'sal15', 'sal16', 'sal17'];
    ids.forEach(function(id) {
        var element = document.getElementById(id);
        element.value = addCommasToNumber(element.value);
    });
});



	        


	



</script>