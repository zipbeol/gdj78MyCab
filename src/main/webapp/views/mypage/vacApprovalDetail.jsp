<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Main</title>
    <!-- Meta -->
    <meta name="description" content="Marketplace for Bootstrap Admin Dashboards">
    <meta name="author" content="Bootstrap Gallery">
    <link rel="canonical" href="https://www.bootstrap.gallery/">
    <meta property="og:url" content="https://www.bootstrap.gallery">
    <meta property="og:title" content="Admin Templates - Dashboard Templates | Bootstrap Gallery">
    <meta property="og:description" content="Marketplace for Bootstrap Admin Dashboards">
    <meta property="og:type" content="Website">
    <meta property="og:site_name" content="Bootstrap Gallery">
    <link rel="shortcut icon" href="/assets/images/favicon.svg">
    <!-- *************
            ************ CSS Files *************
        ************* -->
    <link rel="stylesheet" href="/assets/fonts/bootstrap/bootstrap-icons.css">
    <link rel="stylesheet" href="/assets/css/main.min.css">

    <!-- *************
            ************ Vendor Css Files *************
        ************ -->

    <!-- Scrollbar CSS -->
    <link rel="stylesheet" href="/assets/vendor/overlay-scroll/OverlayScrollbars.min.css">
    
     <!-- Calendar CSS -->
    <link rel="stylesheet" href="/assets/vendor/calendar/css/main.min.css">
    <link rel="stylesheet" href="/assets/vendor/calendar/css/custom.css">

    <!-- 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

    <!-- Date Range CSS -->
    <link rel="stylesheet" href="/assets/vendor/daterange/daterange.css">
    <!-- 따로 적용한 CSS -->
    <link rel="stylesheet" href="/assets/css/default.css">
    <!-- FontAwesome 추가 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

    <style>
        .maintenance-list-tbody-tr td.ellipsis {
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            max-width: 1px; /* 추가: 텍스트가 잘릴 수 있도록 설정 */
        }

        .table-responsive {
            overflow-x: initial; /* 스크롤 바 방지 */
        }

        table.table {
            table-layout: fixed; /* 고정된 테이블 레이아웃 */
            width: 100%;
        }

        table.table th, table.table td {
            overflow: hidden;
            text-overflow: ellipsis;
        }
      

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

        .info-label {
            font-weight: bold; /* Optionally make labels bold */
        }

        .info-value {
            font-size: 16px; /* Adjust font size as needed */
        }

        .edit-save-buttons {
            text-align: end; /* Align buttons to the right */
            margin-top: 10px; /* Add space above the buttons */
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #000;
        }
        h1 {
            text-align: center;
        }
        .vacTable {
            width: 100%;
            border-collapse: collapse;
        }
        .vacTable td, .vacTable th {
            border: 1px solid #000;
            padding: 10px;
        }
        .section-title {
            background-color: #f2f2f2;
            font-weight: bold;
        }
        textarea{
        	height: 145px;
    		width: 680px;
    		resize:none;
        }
        .approvalTable{
        border-collapse: collapse;
        width: 209px;
        text-align: center;
        margin-left: 549px;
        }
         .approvalTable td{
            border: 1px solid #000;
            padding: 10px;
            text-align: center;
        }
        #total_days, #total_days2 {
            width: 5% !important;
            display: inline-block;
            size: 1;
            text-align: center;
        }
        #start_date, #end_date{
        	width: 14%;
        }
        input[type=text] {
        	width: 100%;
        }
        .btn1{
        margin-left: 1073px;
        }
        #todayDate{
        	text-align: center;
        	font-size: large;
        	
        }
        #submitReason{
       		text-align: center;
        	font-size: large;
        }
        
    </style>

</head>

<body>
<!-- Page wrapper start -->
<div class="page-wrapper">

    <!-- Main container start -->
    <div class="main-container">

        <!-- Sidebar wrapper start -->
        <jsp:include page="../sidebar.jsp"/>
        <!-- Sidebar wrapper end -->

        <!-- App container starts -->
        <div class="app-container">

            <!-- App header starts -->
            <div class="app-header d-flex align-items-center">

                <!-- Toggle buttons start -->
                <div class="d-flex">
                    <button class="btn btn-outline-primary me-2 toggle-sidebar" id="toggle-sidebar">
                        <i class="bi bi-list fs-5"></i>
                    </button>
                    <button class="btn btn-outline-primary me-2 pin-sidebar" id="pin-sidebar">
                        <i class="bi bi-list fs-5"></i>
                    </button>
                </div>
                <!-- Toggle buttons end -->

                <!-- App brand sm start -->
                <div class="app-brand-sm d-lg-none d-sm-block">
                    <a href="/">
                        <img src="/assets/images/logo-sm.svg" class="logo" alt="Bootstrap Gallery">
                    </a>
                </div>
                <!-- App brand sm end -->

                <!-- Breadcrumb start -->
                <ol class="breadcrumb d-none d-lg-flex ms-3">
                    <li class="breadcrumb-item">
                        <a href="/"><i class="bi bi-house lh-1"></i></a>
                        <a href="/" class="text-decoration-none">메인</a>
                    </li>
                    <li class="breadcrumb-item">
                        <a href="/mypage/vacApply/list.go" class="text-decoration-none">연차 승인 및 반려</a>
                    </li>
                    <li class="breadcrumb-item">
                        <a href="#" class="text-decoration-none">연차 신청 상세보기</a>
                    </li>
                </ol>
                <!-- Breadcrumb end -->

                <!-- App header actions start -->
                <jsp:include page="../appHeader.jsp"/>
                <!-- App header actions end -->

            </div>
            <!-- App header ends -->

            <!-- App body starts -->
            <div class="app-body">

                <!-- Container starts -->
                <div class="container-fluid">

                    <!-- Alert placeholder start -->
                    <div id="alertPlaceholder" class="alert-placeholder"></div>
                    <!-- Alert placeholder end -->

                    <!-- Row start -->
					<div class="row">
    					<div class="col-12">
        					<div class="card mb-3">
            					<div class="card-header">
               						 <ul class="nav nav-tabs card-header-tabs" id="taxiTabs" role="tablist">
                    							<li class="nav-item" role="presentation">
                        						<button class="nav-link active" id="taxi-schedule-tab" data-bs-toggle="tab"
                                					data-bs-target="#taxi-schedule" type="button" role="tab"
                                					aria-controls="taxi-schedule" aria-selected="true">연차 신청 상세보기
                        						</button>
                    						</li>
                							</ul>
            								</div>
            								<div class="card-body tab-content" id="taxiTabsContent">
                							
                <div class="tab-pane fade show active" id="taxi-schedule" role="tabpanel"
                     aria-labelledby="taxi-schedule-tab">
                    <!-- 연차 신청 내용 -->
                    <!-- 여기에 코딩 -->
                    <div class="container">
                        <h1>연차/반차 신청서</h1>

                        <table class="approvalTable" >
                            <tr>
                                <td class="section-title" rowspan="4">결재</td>
                                <td>부 장</td>
                                <td>대표이사</td>
                            </tr>
                            <tr>
                                <td style="height: 50px;">
                                	<c:if test="${vacList.vac_apply_status}">
                						<span style="color: blue;">승인</span>
            						</c:if>
            						<c:if test="${!vacList.vac_apply_status}">
                						<c:if test="${empty vacList.vac_reject_reason}">
                    						<span>검토전</span>
                						</c:if>
                						<c:if test="${not empty vacList.vac_reject_reason}">
                   					 		<span style="color: red;">반려</span>
                						</c:if>
            						</c:if>
                                </td>
                                <td style="height: 50px;">
                                	<c:if test="${vacList.vac_apply_status_final}">
                						<span style="color: blue;">승인</span>
            						</c:if>
            						<c:if test="${!vacList.vac_apply_status_final}">
                						<c:if test="${empty vacList.vac_reject_reason_final}">
                    						<span>검토전</span>
                						</c:if>
                						<c:if test="${not empty vacList.vac_reject_reason_final}">
                   					 		<span style="color: red;">반려</span>
                						</c:if>
            						</c:if>
                                </td>
                            </tr>
                        </table>

                        <br>

                        <table class="vacTable">
                            <tr>
                                <td class="section-title" colspan="2">1. 신청인</td>
                            </tr>
                            <tr>
                                <td>소속</td>
                                <td><input type="text" id="department" value="${vacList.dept_name}" readonly></td>
                            </tr>
                            <tr>
                                <td>직급</td>
                                <td><input type="text" id="position" value="${vacList.title_name}" readonly></td>
                            </tr>
                            <tr>
                                <td>성명</td>
                                <td><input type="text" id="name" value="${vacList.emp_name}" readonly></td>
                            </tr>
                        </table>

                        <br>
                        <br>
                        <table class="vacTable">
                            <tr>
                                <td class="section-title" colspan="2">2. 신청내용</td>
                            </tr>
                            <tr>
                                <td>구분</td>
                                <td>
                                    ${vacList.vac_type}
                                </td>
                            </tr>
                            <tr>
                                <td>신청기간</td>
                                <td id="vac1">
									<c:if test="${empty vacList.vac_use_end_date}">
                                    <input type="text" id="start_date" value="${vacList.vac_use_date}" readonly>
    								(총 <input type="text" id="total_days" value="0.5" readonly> 일)
									</c:if>
									<c:if test="${not empty vacList.vac_use_end_date}">
									<input type="text" id="start_date" value="${vacList.vac_use_date}" readonly> 부터
    								<input type="text" id="end_date" value="${vacList.vac_use_end_date}" readonly> 까지
    								(총 <input type="text" id="total_days" readonly> 일)
								</c:if>
                                </td>
                            </tr>
                            <tr>
                                <td>신청사유</td>
                                <td><textarea id="apply_reason" readonly>${vacList.vac_reason}</textarea></td>
                            </tr>
                        </table>

                        <br>

                        <p id="submitReason">위와 같은 사유로 연차/반차신청서를 제출하오니 허가하여 주시기 바랍니다.</p>

                        <p id="todayDate">${vacList.vac_apply_date}</p>
                    </div>
                    <div class="mt-3 btn1">
                        <input type="button" class="btn btn-primary" id="vacApproval" value="승인">
                         <input type="button" class="btn btn-secondary" id="vacReject" value="반려">
                    </div>
                </div>
                <!-- 연차 신청 끝 -->
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

</div>
<!-- Page wrapper end -->

</body>
<!-- *************
        ************ JavaScript Files *************
    ************* -->
<!-- Required jQuery first, then Bootstrap Bundle JS -->
<script src="/assets/js/jquery.min.js"></script>
<script src="/assets/js/bootstrap.bundle.min.js"></script>

<!-- *************
        ************ Vendor Js Files *************
    *************

 -->

<!-- Overlay Scroll JS -->
<script src="/assets/vendor/overlay-scroll/jquery.overlayScrollbars.min.js"></script>
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
<!-- 캘린더  -->
<script src="/assets/vendor/calendar/js/main.min.js"></script>
<script src="/assets/vendor/calendar/custom/mycab-cal.js"></script>
<script>
var vac_no = '${vacList.vac_no}';





/* 연차 신청 스크립트 */
 
 document.addEventListener('DOMContentLoaded', function() {
     var startDateInput = document.getElementById('start_date');
     var endDateInput = document.getElementById('end_date');
     var totalDaysInput = document.getElementById('total_days');

     var startDate = new Date(startDateInput.value);
     
     <c:if test="${not empty vacList.vac_use_end_date}">
         var endDate = new Date(endDateInput.value);
         var timeDiff = endDate.getTime() - startDate.getTime();
         var diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24)) + 1;
         totalDaysInput.value = diffDays;
     </c:if>
 });
 
 
 
    
</script>

</html>
