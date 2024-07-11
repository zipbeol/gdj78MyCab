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
    
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

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

        .info-label {
            font-weight: bold; /* Optionally make labels bold */
        }

        .info-value {
            font-size: 16px; /* Adjust font size as needed */
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
                        <a href="#" class="text-decoration-none">인사 관리</a>
                    </li>
                    <li class="breadcrumb-item">
                        <a href="/attendance/attendance/list.go" class="text-decoration-none">근태 관리</a>
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
                        <button class="nav-link active" id="taxi-detail-tab" data-bs-toggle="tab"
                                data-bs-target="#taxi-detail-content" type="button" role="tab"
                                aria-controls="taxi-detail-content" aria-selected="true">전체 근태 내역
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="taxi-schedule-tab" data-bs-toggle="tab"
                                data-bs-target="#taxi-schedule-content" type="button" role="tab"
                                aria-controls="taxi-schedule-content" aria-selected="false">수정 요청 내역
                        </button>
                    </li>
                </ul>
            </div>
            <div class="card-body tab-content" id="newTabsContent">
                <div class="tab-pane fade show active" id="taxi-detail-content" role="tabpanel"
                     aria-labelledby="taxi-detail-tab">
                    <!-- 전체 근태 내역 -->
                    <h2>전체 근태 내역</h2>
                    <div class="text-end mb-1">
                    </div>
                    <!-- 검색창 시작 -->
                    <div class="search-filter-container border border-2 p-3 rounded mb-3">
                        <div class="row mb-3">
                            <div class="col-md-8 offset-md-4">
                            <canvas id="myDonutChart" style="max-width: 300px; max-height: 300px;"></canvas>
                            </div>
                            
                        </div>
                        <div class="row">
                        <div class="col-12 text-end d-md-flex justify-content-md-end gap-2">
                        <input type="button" class="btn btn-secondary" onclick="filterReset()"
                                       value="초기화">
                                       </div></div>
                        <div class="row">
                        <div class="col-2">
                                                                <label for="filter-maintenance-reg-date"
                                                                       class="form-label">근무일
                                                                    </label>
                                                            </div>
                                                            <div class="col-2">
                                                            </div>
                                                            <div class="col-2">
                                                                <label for="search-category-maintenance"
                                                                       class="form-label">카테고리</label>
                                                            </div>
                                                            <div class="col-4">
                                                                <label for="search-text-maintenance"
                                                                       class="form-label">검색</label>
                                                            </div>
                                                            <div class="col-2">
                                                                <label for="search-text-maintenance"
                                                                       class="form-label">근태 결과</label>
                                                            </div>
                                                        </div>
                                                        <div class="row mb-3">
                                                            <div class="col-2">
                                                                <div class="input-group"
                                                                     id="filter-maintenance-reg-date-div">
                                                                    <input type="text"
                                                                           class="form-control datepicker maintenance-search-filter"
                                                                           id="filter-att-date">
                                                                    <span class="input-group-text"><i
                                                                            class="bi bi-calendar2-range"></i></span>
                                                                </div>
                                                            </div>
                                                            <div class="col-2">
                                                            </div>
                                                            <div class="col-2 d-flex">
                                                                <select class="form-select maintenance-search-filter"
                                                                        id="filterforsearch">
                                                                    <option value="emp_no">사번</option>
																	<option value="emp_name">이름</option>
																	<option value="title_name">직급</option>
																	<option value="dept_name">부서</option>
                                                                </select>
                                                            </div>
                                                            <div class="col-4">
                                                                <input type="text"
                                                                       class="form-control maintenance-search-filter"
                                                                       id="search-emp"
                                                                       placeholder="검색어를 입력해 주세요.">
                                                            </div>
                                                            <div class="col-2 d-flex">
                                                                <select class="form-select maintenance-search-filter"
                                                                        id="filter-att-result">
                                                                    <option value="">근태 결과</option>
                                                                    <option value="근무">근무</option>
																	<option value="지각">지각</option>
																	<option value="결근">결근</option>
																	<option value="연차">연차</option>
																	<option value="반차">반차</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- 검색창 종료 -->
                            
                    <!-- 리스트 테이블 시작 -->
                    <div class="table-outer">
                        <div class="table-responsive">
                            <table class="table align-middle table-hover m-0">
                                <thead>
                                    <tr>
                                        <th class="text-center" id="th-emp-no"
																style="width: 20%;">사번</th>
															<th class="text-center sortable" id="th-emp-name"
																style="width: 20%;" >이름</th>
															<th class="text-center sortable" id="th-title-name"
																style="width: 10%;" >직급</th>
															<th class="text-center sortable" id="th-dept-name"
																style="width: 20%;" >부서</th>
															<th class="text-center" id="th-att-time"
																style="width: 10%;" >출근
																</th>
																<th class="text-center" id="th-leave-time"
																style="width: 10%;" >퇴근
																</th>
																<th class="text-center" id="th-att-result"
																style="width: 10%;" >근태 결과
																</th>
                                                                </tr>
                                                                </thead>
                                                                <tbody id="total-att-list">
                                    
                                    <!-- 테이블 내용 정의 -->
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
                <div class="tab-pane fade" id="taxi-schedule-content" role="tabpanel"
                     aria-labelledby="taxi-schedule-tab">
                    <!-- 수정 요청 내역 -->
                    <h2>수정 요청 내역</h2>
                    <div class="mt-3"></div>
                    <div class="search-filter-container border border-2 p-3 rounded mb-3">
                        <div class="row mb-3">
                            <div class="col-md-8 offset-md-4">
                            
                            </div>
                            
                        </div>
                        <div class="row">
                        <div class="col-12 text-end d-md-flex justify-content-md-end gap-2">
                        <input type="button" class="btn btn-secondary" onclick="EditfilterReset()"
                                       value="초기화">
                                       </div></div>
                        <div class="row">
                        <div class="col-2">
                                                                <label for="filter-maintenance-reg-date"
                                                                       class="form-label">신청일
                                                                    </label>
                                                            </div>
                                                            <div class="col-2">
                                                            </div>
                                                            <div class="col-2">
                                                                
                                                            </div>
                                                            <div class="col-4">
                                                                <label for="search-text-maintenance"
                                                                       class="form-label">검색</label>
                                                            </div>
                                                            <div class="col-2">
                                                                <label for="search-text-maintenance"
                                                                       class="form-label">처리 필터</label>
                                                            </div>
                                                        </div>
                                                        <div class="row mb-3">
                                                            <div class="col-2">
                                                                <div class="input-group"
                                                                     id="filter-maintenance-reg-date-div">
                                                                    <input type="text"
                                                                           class="form-control datepicker maintenance-search-filter"
                                                                           id="filter-edit-date">
                                                                    <span class="input-group-text"><i
                                                                            class="bi bi-calendar2-range"></i></span>
                                                                </div>
                                                            </div>
                                                            <div class="col-2">
                                                            </div>
                                                            <div class="col-2 d-flex">
                                                                
                                                            </div>
                                                            <div class="col-4">
                                                                <input type="text"
                                                                       class="form-control maintenance-search-filter"
                                                                       id="search-edit"
                                                                       placeholder="검색어를 입력해 주세요.">
                                                            </div>
                                                            <div class="col-2 d-flex">
                                                                <select class="form-select maintenance-search-filter"
                                                                        id="filter-edit-result">
                                                                   <option value="">처리 필터</option>
   																	<option value="true">처리</option>
    																<option value="false">미처리</option>
    																<option value="수정 승인">수정 승인</option>
   																	<option value="수정 거부">수정 거부</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- 검색창 종료 -->
                    <!-- 수정 요청 내용을 표시할 부분 -->
                    <div class="table-outer">
											<div class="table-responsive">
												<table class="table align-middle table-hover m-0">
													<thead>
														<tr>
															<th class="text-center" id="th-emp-no"
																style="width: 10%;" data-value="emp-no">No</th>
																<th class="text-center" id="th-emp-no"
																style="width: 20%;" data-value="emp-no">이름</th>
															<th class="text-center" id="th-emp-name"
																style="width: 20%;" >신청일</th>
															<th class="text-center" id="th-dept-name"
																style="width: 20%;">승인 여부</th>
																<th class="text-center" id="th-dept-name"
																style="width: 20%;">처리 여부</th>
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
											<ul class="pagination justify-content-center" id="pagination2"></ul>
							
										</nav>
						
					</div>					<!-- 페이지 네이션 종료 -->
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Row end -->
                    
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





<!-- 근태 수정 내역 모달 시작 -->
	<div class="modal fade" id="attApplyModal" tabindex="-1" aria-labelledby="registerModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title h4" id="exampleModalLgLabel">근태 수정 요청 내역</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="row mb-3">
                    <div class="col-6">
                        <div class="input-group">
                            <label class="input-group-text" for="detail-no">사번</label>
                            <input type="text" class="form-control" id="ddetail-no" name="emp_no" readonly>
                            <input type="hidden" class="form-control" id="ddetail-idx" name="emp_no" readonly>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="input-group">
                            <label class="input-group-text" for="detail-name">이름</label>
                            <input type="text" class="form-control" id="ddetail-name" name="emp_name" readonly>
                        </div>
                    </div>
                </div>
                <div class="input-group mb-3">
                    <label class="input-group-text" for="detail-workday">날짜</label>
                    <input type="text" class="form-control" id="ddetail-workday" name="work_day" readonly>
                </div>
                <div class="row mb-3">
                    <div class="col-6">
                        <div class="input-group">
                            <label class="input-group-text" for="detail-att-time">출근</label>
                            <input type="text" class="form-control" id="ddetail-att-time" name="att_time" readonly>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="input-group">
                            <label class="input-group-text" for="detail-leave-time">퇴근</label>
                            <input type="text" class="form-control" id="ddetail-leave-time" name="leave_time" readonly>
                        </div>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-6">
                        <div class="input-group">
                            <label class="input-group-text" for="detail-before-att">수정 전 근태 결과</label>
                            <input type="text" class="form-control" id="ddetail-before-att" name="before_att_time" readonly>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="input-group">
                            <label class="input-group-text" for="detail-after-att">수정 요청 근태 결과</label>
                            <input type="text" class="form-control" id="ddetail-after-att" name="after_att_time" readonly>
                        </div>
                    </div>
                </div>
                <div class="input-group mb-3">
                    <label class="input-group-text" for="detail-reason">수정 신청 사유</label>
                    <textarea class="form-control" id="ddetail-reason" name="att_reason" rows="3" style="height: 245px; resize: none;"readonly></textarea>
                </div>
                <div class="input-group mb-3" id="attApproval" style="display: none;">
                    <label class="input-group-text" for="detail-reason">수정 승인 여부</label>
                    <select class="form-select" id="ddetail-approval">
		    			<option value="">승인 여부</option>
 						<option value="true">승인</option>
  						<option value="false">거부</option>
                   </select>
                </div>
                <div class="input-group mb-3" id="ddetail-reject-reason" >
                    <label class="input-group-text" for="detail-rejection-reason">수정 거부 사유</label>
                    <input type="text" class="form-control" id="ddetail-rejection-reason" placeholder="수정 거부 사유를 입력해주세요." name="rejection_reason">
                </div>
                <div class="row mb-3">
                    <div class="col-6">
                        <div class="input-group">
                            <label class="input-group-text" for="detail-handler">담당자</label>
                            <input type="text" class="form-control" id="ddetail-handler" name="handler" value="${sessionScope.loginId}" readonly>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="input-group">
                            <label class="input-group-text" for="detail-process-date">처리일</label>
                            <input type="text" class="form-control" id="ddetail-process-date" name="process_date" readonly>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="edit-att-btn" onclick="attEdit()">등록</button>
            </div>
        </div>
    </div>
</div>
</div>

<!-- 근태 수정 내역 모달 끝 -->

			
						

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
    
/* 전체 근태 내역 스크립트 시작  */
 
 
 
$(document).ready(function(){
	getTotalPages();
	 getList();
	 updateChart(filterAttDate);
	
	
});
 
 
 $('#taxi-detail-tab').on('click', function(e) {
	 getTotalPages();
	 getList();
	 updateChart(filterAttDate);
});
 
    var searchText = '';
    var filterAttDate = '';
    var filterAttResult = '';
    var filterforSearch = '';
    var currentPage = 1; // 현재 페이지 번호
    var today = moment().format('YYYY/MM/DD');
  
    
    // 검색 값들 변수에 저장
    function getSearchValue() {
    	filterAttResult = $('#filter-att-result').val();
		filterforSearch = $('#filterforsearch').val();
        searchText = $('#search-emp').val();
        filterAttDate = $('#filter-att-date').val();
    }
    
    // 필터 값 리셋
    function filterReset() {
        $('#filter-att-result').val('');
        $('#search-emp').val('');
        $('#filterforsearch').val('emp_no');
        $('#filter-att-date').val(today);
        filterAttDate = $('#filter-att-date').val(today);
        currentPage = 1; // 페이지 번호 초기화
        getTotalPages();
        getList(); // 목록 새로고침
        updateChart(filterAttDate);
    }
    
    
    
    $('#search-emp').on('keyup', function(){
    	currentPage = 1;
        getTotalPages();
        getList();
       
    });
    
    $('#filter-att-date').on('change', function(){
    	currentPage = 1;
        getTotalPages();
        getList();
        updateChart(filterAttDate);
    });
    
    $('#filter-att-result').on('change', function(){
    	currentPage = 1;
        getTotalPages();
        getList();
    });

  
    
    
    
 // 근태리스트 호출
    function getList() {
        getSearchValue();
        $.ajax({
            url: '/totalAttList.ajax',
            type: 'GET',
            data: {
                'searchText': searchText,
                'filterAttResult': filterAttResult,
                'filterForSearch': filterforSearch,
                'filterAttDate':filterAttDate,
                'page': currentPage
               
            },
            dataType: 'JSON',
            success: function (data) {
                drawList(data.empList);
            },
            error: function (error) {
                console.log(error);
            }
        });
    }

    // 토탈 페이지 호출
    function getTotalPages() {
        getSearchValue();
        $.ajax({
            url: '/getTotalPages.ajax',
            type: 'GET',
            data: {
            	 'searchText': searchText,
                 'filterAttResult': filterAttResult,
                 'filterForSearch': filterforSearch,
                 'filterAttDate':filterAttDate
            },
            dataType: 'JSON',
            success: function (data) {
                console.log(data);
                $('#pagination').twbsPagination('destroy');
                $('#pagination').twbsPagination({
                    totalPages: data.totalPages, // 서버에서 받은 총 페이지 수
                    visiblePages: 5,
                    startPage: currentPage,
                    paginationClass: 'pagination align-items-center',
                    onPageClick: function (event, page) {
                        currentPage = page;
                        getList();
                    }
                });
            },
            error: function (error) {
                console.log(error);
            }
        });
    }
    
    
    function toKoreanTime(dateString) {
    	if (!dateString) return '';
        
        // 입력된 문자열을 UTC 시간으로 변환
        const date = new Date(dateString);

        // toLocaleTimeString을 사용하여 한국 시간대로 포맷
        const options = { timeZone: 'Asia/Seoul', hour: '2-digit', minute: '2-digit', hour12: false };
        const koreanTime = date.toLocaleTimeString('ko-KR', options);
        
        return koreanTime;
    	}
    
    
    
 
    // 리스트 보여주기
    function drawList(list) {
        var content = '';
        if (list.length > 0) {
            for (item of list) {
            	console.log(item.att_time);
            	console.log(toKoreanTime(item.att_time));
              
                content += '<tr class="total-att-list-tbody-tr" id="' + item.emp_no + '">'
                	+ '<td class="text-center">' + item.emp_no+ '</td>'
                	+ '<td class="text-center">' + item.emp_name+ '</td>'
                	+ '<td class="text-center">' + item.title_name+ '</td>'
                	+ '<td class="text-center">' + item.dept_name+ '</td>'
                	+ '<td class="text-center">' + toKoreanTime(item.att_time)+ '</td>'
                    + '<td class="text-center">' + toKoreanTime(item.leave_time)  + '</td>'
                    + '<td class="text-center">' + item.att_result + '</td>'
                    + '</tr>';
            }
        } else {
            content = '<tr><td colspan="7" class="text-center">데이터가 존재하지 않습니다.</td></tr>';
        }
        $('#total-att-list').html(content);
        
        
        $(document).on('click', '.total-att-list-tbody-tr', function () {
            location.href = '/empAttHistory.go?emp_no=' + $(this).attr('id');
        });
    }
    
 // Initial data for the chart (dummy data for demonstration)
    let initialData = {
        labels: ['미출근', '지각', '연차/반차'],
        datasets: [{
            data: [0,0,0], // Replace with actual data
            backgroundColor: ['#FF6384', '#36A2EB', '#FFCE56']
        }]
    };

    // Function to update the chart based on selected date
    function updateChart(filterAttDate) {
        $.ajax({
            url: '/updateChar.ajax', // Replace with your backend API endpoint
            method: 'GET',
            data: {
                'filterAttDate': filterAttDate // Pass selectedDate as filterAttDate to backend
            },
            success: function (response) {
                // Assuming response.chart contains the data array
                console.log('미출근?'+response.chart.absentCount);
                console.log(response.chart);
                let newData = {
                    labels: ['미출근', '지각', '연차/반차'],
                    datasets: [{
                        data: [response.chart[0].absentCount, response.chart[0].lateCount, response.chart[0].leaveCount], // Update with actual data received from server
                        backgroundColor: ['#FF6384', '#36A2EB', '#FFCE56']
                    }]
                };

                // Update chart
                myDonutChart.data = newData;
                myDonutChart.update();
            },
            error: function (error) {
                console.error('Error fetching data:', error);
            }
        });
    }

    // Get the canvas element
    const ctx = document.getElementById('myDonutChart').getContext('2d');

    // Create the initial chart
    const myDonutChart = new Chart(ctx, {
        type: 'doughnut',
        data: initialData,
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: {
                    position: 'top',
                },
                tooltip: {
                    callbacks: {
                        label: function (tooltipItem) {
                            return tooltipItem.label + ': ' + tooltipItem.raw.toFixed(2) + '%';
                        }
                    }
                }
            }
        }
    });

    // Event listener for datepicker change
    $('#filter-att-date').on('change', function (e) {
        let selectedDate = $('#filter-att-date').val();
        updateChart(selectedDate);
    });
    
   
    
    /* 수정 요청 내역 스크립트 시작  */
    $('#taxi-schedule-tab').on('click', function(e) {
    	getEditTotalPages();
        getEditList();
});
    
    
    var searchEditText = '';
    var filterEditDate = '';
    var filterEditResult = '';
   
    
    
  
    
    // 검색 값들 변수에 저장
    function getEditSearchValue() {
    	filterEditResult = $('#filter-edit-result').val();
		searchEditText = $('#search-edit').val();
		filterEditDate = $('#filter-edit-date').val();
    }
    
    // 필터 값 리셋
    function EditfilterReset() {
        $('#filter-edit-result').val('');
        $('#search-edit').val('');
        $('#filter-edit-date').val(today);
        filterEditDate = $('#filter-edit-date').val(today);
        currentPage = 1; // 페이지 번호 초기화
        getEditTotalPages();
        getEditList();
    }
    
    
    $('#search-edit').on('keyup', function(){
    	currentPage = 1;
    	 getEditTotalPages();
         getEditList();
       
    });
    
    $('#filter-edit-date').on('change', function(){
    	currentPage = 1;
    	 getEditTotalPages();
         getEditList();
    });
    
    $('#filter-edit-result').on('change', function(){
    	currentPage = 1;
    	 getEditTotalPages();
         getEditList();
    });
    
    
    // 근태수정리스트 호출
    function getEditList() {
    	getEditSearchValue();
        $.ajax({
            url: '/totalEditList.ajax',
            type: 'GET',
            data: {
                'searchEditText': searchEditText,
                'filterEditResult': filterEditResult,
                'filterEditDate':filterEditDate,
                'page': currentPage
               
            },
            dataType: 'JSON',
            success: function (data) {
                drawEditList(data.empList);
            },
            error: function (error) {
                console.log(error);
            }
        });
    }

    // 토탈 페이지 호출
    function getEditTotalPages() {
    	getEditSearchValue();
        $.ajax({
            url: '/getEditTotalPages.ajax',
            type: 'GET',
            data: {
            	 'searchEditText': searchEditText,
                 'filterEditResult': filterEditResult,
                 'filterEditDate':filterEditDate,
            },
            dataType: 'JSON',
            success: function (data) {
                console.log(data);
                $('#pagination2').twbsPagination('destroy');
                $('#pagination2').twbsPagination({
                    totalPages: data.totalPages, // 서버에서 받은 총 페이지 수
                    visiblePages: 5,
                    startPage: currentPage,
                    paginationClass: 'pagination align-items-center',
                    onPageClick: function (event, page) {
                        currentPage = page;
                        getEditList();
                    }
                });
            },
            error: function (error) {
                console.log(error);
            }
        });
    }
    
    
    
    // 리스트 보여주기
    function drawEditList(list) {
        var content = '';
        if (list.length > 0) {
            for (item of list) {
            	
                var att_apply_status = item.att_apply_status === true ? 'Y' : 'N';
                var process_status = item.process_status === 'true' ? 'Y' : 'N';
                
                
             // ISO 8601 날짜 문자열을 Date 객체로 변환
                var date = new Date(item.att_applicant_date);
                // 한국 시간으로 변환
                var kstDate = new Date(date.getTime() + (9 * 60 * 60 * 1000));
                // 날짜만 추출 (yyyy-mm-dd 형식)
                var formattedDate = kstDate.toISOString().split('T')[0];
              
                content += '<tr class="att-Edit-list-tbody-tr" id="' + item.att_management_idx + '">'
                	+ '<td class="text-center">' + item.att_management_idx+ '</td>'
                	+ '<td class="text-center">' + item.emp_name+ '</td>'
                	+ '<td class="text-center">' + formattedDate + '</td>'
                    + '<td class="text-center">' + att_apply_status  + '</td>'
                    + '<td class="text-center">' + process_status + '</td>'
                    + '</tr>';
            }
        } else {
            content = '<tr><td colspan="5" class="text-center">데이터가 존재하지 않습니다.</td></tr>';
        }
        $('#att-Edit-list').html(content);
    }
    
     $(document).on('click', '.att-Edit-list-tbody-tr', function () {
        console.log($(this).attr('id'));
        var attidx = $(this).attr('id');
        
        getAttEditList(attidx).done(function(data) {
        	console.log(data);
        	
        	// ISO 8601 날짜 문자열을 Date 객체로 변환
            var date = new Date(data.att.att_modify_date);
            // 한국 시간으로 변환
            var kstDate = new Date(date.getTime() + (9 * 60 * 60 * 1000));
            // 날짜만 추출 (yyyy-mm-dd 형식)
            var formattedDate = kstDate.toISOString().split('T')[0];
        	
        	$('#ddetail-idx').val(attidx);
            $('#ddetail-no').val(data.att.att_applicant);
            $('#ddetail-name').val(data.att.emp_name);
            $('#ddetail-workday').val(data.att.work_day);
            $('#ddetail-att-time').val(toKoreanTime(data.att.att_time));
            $('#ddetail-leave-time').val(toKoreanTime(data.att.leave_time));
            $('#ddetail-before-att').val(data.att.att_previous_attresult);
            $('#ddetail-after-att').val(data.att.att_modify_attresult);
            $('#ddetail-reason').val(data.att.att_reason);
            
          
            
            
            
            const rejectionReason = data.att.att_modify_reject != null ? data.att.att_modify_reject : '';
            const handler = data.att.att_modifier != 0 ? data.att.att_modifier : '${sessionScope.loginId}';
            const processDate = data.att.att_modify_date ? formattedDate : today;
            
            
          
         
            $('#ddetail-rejection-reason').val(rejectionReason);
            $('#ddetail-handler').val(handler);
            $('#ddetail-process-date').val(processDate);
            
            console.log(data.att.att_apply_status);
            
            
            if (data.att.att_modifier == '0') {
                // 수정자 정보가 0이면 처리 전
                $('#attApproval').show();
                $('#edit-att-btn').show();
                $('#ddetail-rejection-reason').prop('readonly', false);
            } else {
                // 이미 처리된 경우
                $('#attApproval').hide();
                $('#ddetail-rejection-reason').prop('readonly', true);
                $('#edit-att-btn').hide();
            }
          
            $('#attApplyModal').modal('show');
        }); 
    });
    
    function getAttEditList(attidx) {//사원 상세보기 
        return $.ajax({
            url: '/getAttEditListDetail.ajax',
            type: 'GET',
            data: {
                'att_management_idx': attidx     
            },
            dataType: 'JSON',           
            success: function(data) {
                return data;
            },
            error: function(xhr, status, error) {
                console.error('근태 수정 내역 데이터를 가져오는 중 오류 발생:', status, error);
            }
        });
    }
    
    
    $('#ddetail-approval').on('change', function() {
        var approval = document.getElementById('ddetail-approval').value;
        var isApproved = (approval === 'true');
        var rejectionReasonInput = document.getElementById('ddetail-rejection-reason');

        if (!isApproved && approval !== "") {
            rejectionReasonInput.disabled = false;
        } else {
            rejectionReasonInput.disabled = true;
        }
    });
    
    function attEdit() {
        var no = document.getElementById('ddetail-handler').value;
        var idx = document.getElementById('ddetail-idx').value;
        var previousResult = document.getElementById('ddetail-before-att').value;
        var modifyResult = document.getElementById('ddetail-after-att').value;
        var rejectReason = document.getElementById('ddetail-rejection-reason').value;
        var approval = document.getElementById('ddetail-approval').value;
        
        console.log('왜 뭔데?' + rejectReason);
        console.log('자고싶다'+approval);
        
        if (approval === 'false') {
            if (rejectReason === '' || rejectReason.trim() === '') {
                alert('수정 거부 사유를 입력해주세요!');
            } else {
                $.ajax({
                    type: "GET",
                    url: "/approvalReject.ajax",
                    data: {
                        'att_management_idx': idx,
                        'att_modifier': no,
                        'att_modify_attresult': modifyResult,
                        'att_modify_reject': rejectReason,
                        'att_apply_status': approval
                    },
                    dataType: "json",
                    success: function(data) {
                        if (data.isSuccess) {
                            $('#attApplyModal').modal('hide');
                            showAlert('success', '근태 수정 거부가 완료되었습니다.');
                            setTimeout(function() {
                                location.reload();
                            }, 1000);
                        } else {
                            $('#attApplyModal').modal('hide');
                            showAlert('danger', '근태 수정 거부에 실패했습니다.');
                        }  
                    },
                    error: function(xhr, status, error) {
                        // 에러 처리
                        $("#result").html("<p>There was an error: " + error + "</p>");
                    }
                });  
            }
        } else {
            $.ajax({
                type: "GET",
                url: "/approvalPermit.ajax",
                data: {
                    'att_management_idx': idx,
                    'att_modifier': no,
                    'att_modify_attresult': modifyResult,
                    'att_apply_status': approval
                },
                dataType: "json",
                success: function(data) {
                    if (data.isSuccess) {
                        $('#attApplyModal').modal('hide');
                        showAlert('success', '근태 수정 승인이 완료되었습니다.');
                        setTimeout(function() {
                            location.reload();
                        }, 1000);
                    } else {
                        $('#attApplyModal').modal('hide');
                        showAlert('danger', '근태 수정 승인에 실패했습니다.');
                    }  
                },
                error: function(xhr, status, error) {
                    // 에러 처리
                    $("#result").html("<p>There was an error: " + error + "</p>");
                }
            });
        }
    }


        

</script>

</html>
