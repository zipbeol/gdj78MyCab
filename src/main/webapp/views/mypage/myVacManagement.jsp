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
        input[type=text] {
        	width: 100%;
        }
        .btn1{
        margin-left: 1235px;
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
                        <a href="#" class="text-decoration-none">마이페이지</a>
                    </li>
                    <li class="breadcrumb-item">
                        <a href="/attendance/myAttendance/list.go" class="text-decoration-none">연차 관리</a>
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
                                aria-controls="taxi-schedule" aria-selected="true">연차 내역
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="taxi-detail-tab" data-bs-toggle="tab"
                                data-bs-target="#taxi-detail" type="button" role="tab"
                                aria-controls="taxi-detail" aria-selected="false">연차 신청
                        </button>
                    </li>
                </ul>
            </div>
            <div class="card-body tab-content" id="taxiTabsContent">
                <div class="tab-pane fade show active" id="taxi-schedule" role="tabpanel"
                     aria-labelledby="taxi-schedule-tab">
                    <h2>연차 내역</h2>
                    <div class="mt-3"></div>
                    <!-- 연차 내역 -->
                    <div class="table-outer">
                        <div class="table-responsive">
                            <table class="table align-middle table-hover m-0">
                                <thead>
                                    <tr>
                                        <th class="text-center" id="th-emp-no"
                                            style="width: 10%;" data-value="emp-no">No</th>
                                        <th class="text-center" id="th-emp-name"
                                            style="width: 20%;" data-value="emp-name">신청일</th>
                                        <th class="text-center" id="th-emp-name"
                                            style="width: 20%;" data-value="emp-name">연차 신청일</th>
                                        <th class="text-center" id="th-emp-name"
                                            style="width: 20%;" data-value="emp-name">연차 구분</th>
                                        <th class="text-center" id="th-dept-name"
                                            style="width: 20%;" data-value="dept-name">승인 여부</th>
                                        <th class="text-center" id="th-dept-name"
                                            style="width: 20%;" data-value="dept-name">처리 여부</th>
                                    </tr>
                                </thead>
                                <tbody id="att-Edit-list">
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- 리스트 테이블 종료 -->
                    <!-- 페이지 네이션 시작 -->
                    <nav aria-label="Page navigation example" class="mt-3">
                        <ul class="pagination justify-content-center" id="pagination"></ul>
                    </nav>
                    <!-- 페이지 네이션 종료 -->

                </div>
                <div class="tab-pane fade" id="taxi-detail" role="tabpanel"
                     aria-labelledby="taxi-detail-tab">
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
                                <td style="height: 50px;"></td>
                                <td style="height: 50px;"></td>
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
                                    <input type="radio" name="type" value="연차" checked="checked"> 연차
                                    <input type="radio" name="type" value="오전 반차"> 오전 반차
                                    <input type="radio" name="type" value="오후 반차"> 오후 반차
                                </td>
                            </tr>
                            <tr>
                                <td>신청기간</td>
                                <td id="vac1">
                                    <input type="date" id="start_date" required> 부터
                                    <input type="date" id="end_date" required> 까지
                                    (총 <input type="text" id="total_days" readonly> 일)
                                </td>
                                <td id="vac2" style="display:none">
                                    <input type="date" id="start_date2" required>
                                    (총 <input type="text" id="total_days2" value = 0.5  readonly> 일)
                                </td>
                            </tr>
                            <tr>
                                <td>신청사유</td>
                                <td><textarea id="apply_reason" ></textarea></td>
                            </tr>
                        </table>

                        <br>

                        <p id="submitReason">위와 같은 사유로 연차/반차신청서를 제출하오니 허가하여 주시기 바랍니다.</p>

                        <p id="todayDate"></p>
                    </div>
                    <div class="mt-3 btn1">
                        <input type="button" class="btn btn-primary" id="vacSubmit" value="제출">
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










/* 연차 신청 스크립트 */
    var today = new Date();
    var year = today.getFullYear();
    var month = today.getMonth() + 1;
    var day = today.getDate();
    
    document.addEventListener("DOMContentLoaded", function() {
        var todayDate = year + '년 ' + month + '월 ' + day + '일';
        $('#todayDate').text(todayDate);
    });

    function calculateDateDifference() {
        var start = new Date($('#start_date').val());
        var end = new Date($('#end_date').val());
        var radioVal = $('input[type="radio"]:checked').val();

        if (!isNaN(start) && !isNaN(end) && radioVal === '연차') {
            var timeDiff = end - start;
            var dayDiff = timeDiff / (1000 * 3600 * 24) + 1;
            $('#total_days').val(dayDiff);
            console.log('차이는? ' + dayDiff + '일');
        }
    }

    $('#start_date').on('change', calculateDateDifference);
    $('#end_date').on('change', calculateDateDifference);

    $('input[type="radio"]').on('change', function(){
        var radioVal = $('input[type="radio"]:checked').val();

        console.log(radioVal);

        if (radioVal === '연차') {
            $('#vac1').show();
            $('#vac2').hide();
            $('#total_days').val(0);
            
        } else if (radioVal === '오전 반차' || radioVal === '오후 반차') {
            $('#vac2').show();
            $('#vac1').hide();
        	
        }
    });

    $('#vacSubmit').on('click', function(){
    	var emp_no = '${sessionScope.loginId}';
    	var startDateValue = $('#start_date').val();
    	var startDateValue2 = $('#start_date2').val();
        var endDateValue = $('#end_date').val();
        var start = new Date(startDateValue);
        var end = new Date(endDateValue);
        var to = new Date();
        var reason = $('#apply_reason').val();
        var radioVal = $('input[type="radio"]:checked').val();
        
        var vacLeft = parseInt('${vacList.vac_left}');
        console.log("남은 연차?"+vacLeft);
        
        if (radioVal === '오전 반차' || radioVal === '오후 반차') {
        var totalD = $('#total_days2').val();
			
        }else{
        var totalD = $('#total_days').val();
        }
        console.log(totalD);
        var diff = vacLeft - totalD;
        console.log("연차 계산?"+diff);
        
        
        if (radioVal === '오전 반차' || radioVal === '오후 반차') {
            var totalD = $('#total_days2').val();
            var vacUseDate = startDateValue2; // 오전 반차나 오후 반차일 때는 startDateValue2 사용
    			
        } else {
            var totalD = $('#total_days').val();
            var vacUseDate = startDateValue; // 기본적으로는 startDateValue 사용
        }
        
        if (radioVal === '오전 반차' && !startDateValue2) {
        	showAlert('danger', '연차일을 선택해주세요!');
		}else if(radioVal === '오후 반차' && !startDateValue2){
			showAlert('danger', '연차일을 선택해주세요!');
		}else if (radioVal === '연차' && !startDateValue) {
            showAlert('danger', '연차 시작일을 선택해주세요!');
        } else if (radioVal === '연차' && !endDateValue) {
        	showAlert('danger', '연차 종료일을 선택해주세요!');
		}else if (start <= to) {
            showAlert('danger', '연차 시작일은 오늘 이후여야 합니다.');
        } else if (totalD == 0) {
        	showAlert('danger', '연차 종료일은 시작일 이후여야 합니다.');
		}else if (!reason || reason.trim() === '') {
            showAlert('danger', '신청 사유를 입력해주세요!');
        } else if (diff < 0) {
        	showAlert('danger', '잔여 연차가 부족하여 신청 할 수 없습니다.');
		}else {
			 var requestData = {
			            'emp_no': emp_no,
			            'vac_use': totalD,
			            'vac_type': radioVal,
			            'vac_reason': reason,
			            'vac_use_date': vacUseDate
			        };
			        
			        if (radioVal === '연차') {
			            requestData['vac_use_end_date'] = endDateValue;
			        }

        	//연차 신청 
        	$.ajax({
                url: '/vacApply.ajax',
                type: 'GET',
                data: requestData,
                dataType: 'JSON',
                success: function (data) {
                	if (data.isSuccess) {
                        showAlert('success', '연차 신청이 완료되었습니다.');
                        setTimeout(function() {
                            location.reload();
                        }, 1200);
                    } else {
                        showAlert('danger', '연차 신청에 실패했습니다.');
                    }  
                },
                error: function (error) {
                    console.log(error);
                }
            });
        	
        }
    });

    // 캘린더 리스트 불러오기 끝

    // 연차 내역
    $('#taxi-schedule-tab').on('click', function() {
        getEditTotalPages();
        getEditList();
    });
</script>

</html>
