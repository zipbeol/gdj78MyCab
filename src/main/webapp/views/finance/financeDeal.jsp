<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>My Cab - Finance</title>
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

<!-- CSS Files -->
<link rel="stylesheet"
	href="/assets/fonts/bootstrap/bootstrap-icons.css">
<link rel="stylesheet" href="/assets/css/main.min.css">

<!-- Vendor Css Files -->
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
.detail-row {
	display: none;
	transition: all 0.3s ease;
}

.detail-row.active {
	display: table-row;
}

.filter-btn {
	background-color: #f8f9fa;
	color: #6c757d;
	border: 1px solid #ced4da;
	padding: 8px 16px;
	margin-right: 10px;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease, color 0.3s ease, border-color
		0.3s ease;
}

/* 호버 효과 */
.filter-btn:hover {
	background-color: #e9ecef;
}

/* 액티브(선택된) 상태 */
.filter-btn.active {
	background-color: #0d6efd;
	color: #fff;
	border-color: #0d6efd;
}
/* 리셋 버튼 스타일 */
.reset-btn {
	background-color: #dc3545;
	color: #fff;
	border-color: #dc3545;
}

/* 리셋 버튼 호버 효과 */
.reset-btn:hover {
	background-color: #c82333;
	border-color: #bd2130;
}

td:hover {
	cursor: pointer;
}
</style>
</head>

<body>
	<!-- Page wrapper start -->
	<div class="page-wrapper">

		<!-- Main container start -->
		<div class="main-container">

			<!-- Sidebar wrapper start -->
			<jsp:include page="../sidebar.jsp" />
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
						<li class="breadcrumb-item"><a href="#!"
							class="text-decoration-none">재무 관리</a></li>
						<li class="breadcrumb-item"><a href="/finance/deal/list.go"
							class="text-decoration-none">거래 내역</a></li>
					</ol>
					<!-- Breadcrumb end -->

					<!-- App header actions start -->
					<jsp:include page="../appHeader.jsp" />
					<!-- App header actions end -->

				</div>
				<!-- App header ends -->

				<!-- App body starts -->
				<div class="app-body">
					<!-- Container starts -->
					<div class="container-fluid">
						<!-- Row start -->
						<div class="row">
							<div class="col-12">
								<div class="card mb-3">
									<div class="card-header">
										<h4 class="card-title">거래 내역</h4>
									</div>
									<div class="card-body">

										<!-- 검색창 시작 -->
										<div
											class="search-filter-container border border-2 p-3 rounded mb-3">
											<!-- 날짜 필터링 입력 -->
											<div class="mt-3">
											    <label for="startDate" class="form-label">시작 날짜&nbsp;</label>
											    <input type="date" id="startDate" />
											    <label for="endDate" class="form-label">&nbsp;&nbsp;-&nbsp;&nbsp;종료 날짜&nbsp;</label>
											    <input type="date" id="endDate" />
											</div>
											<div class="row mt-2">
												<!-- 수익 지출 체크박스 -->
												<div class="col-10"></div>
												<label for="searchQuery" class="form-label mt-2">거래 종류</label>
												<div class="col-2">
													<!-- 수익 체크박스 -->
													<input class="form-check-input" type="checkbox"value="profit" id="flexCheckProfit" />
													<label class="form-check-label" for="flexCheckProfit">수익</label>
													&nbsp;&nbsp;&nbsp;
													<!-- 지출 체크박스 -->
													<input class="form-check-input" type="checkbox" value="expense" id="flexCheckExpense" />
													<label class="form-check-label" for="flexCheckExpense">지출</label>
												</div>
												<div class="row mt-2">
													<div class="col-2">
														<label for="filter" class="form-label">정렬</label>
														<!-- 필터링 버튼 -->
														<select id="filter" name="filter" class="form-select"
															required>
															<option value="" selected disabled>필터 선택</option>
															<option value="byDealWho">거래 이름 순</option>
															<option value="manyDeal">많은 거래금 순</option>
															<option value="lessDeal">적은 거래금 순</option>
														</select>
													</div>
													<div class="col-10"></div>
													<label for="searchQuery" class="form-label mt-2">검색</label>
													<div class="d-flex">
														<!-- 검색 입력 필드 -->
														<input type="text" id="searchQuery"
															placeholder="검색 내용을 입력하세요."/>
														<!-- 검색 버튼 -->
														<button id="go" class="btn btn-outline-info">찾기</button>
													</div>
												</div>
											</div>
											<button class="btn btn-secondary" onclick="resetFilters()">초기화</button>
										</div>
									<!-- 거래내역 리스트 테이블 -->
									<div class="table-outer mt-3">
										<table class="table table-hover align-middle custom-table m-0">
											<thead>
												<tr>
													<th>거래 일자</th>
													<th>거래 종류</th>
													<th>거래처</th>
													<th>거래 금액</th>
												</tr>
											</thead>
											<tbody id="dealTableBody">
												<!-- AJAX 요청으로 항목들이 여기에 추가됩니다 -->
											</tbody>
										</table>
										<div>
										    <label for="totalProfit" class="form-label mt-2">총 수익금: </label>
										    <span id="totalProfit"></span>
										    <label class="form-label mt-2">원</label>
										    <label for="totalExpense" class="form-label mt-2">총 지출금: </label>
										    <span id="totalExpense"></span>
										    <label class="form-label mt-2">원</label>
										    <label for="netProfit" class="form-label mt-2">총 순수익: </label>
										    <span id="netProfit"></span>
										    <label class="form-label mt-2">원</label>
										</div>

										<!-- 페이지 네이션 시작 -->
										<nav aria-label="Page navigation example" class="mt-3">
											<ul class="pagination justify-content-center" id="pagination"></ul>
										</nav>
										<!-- 페이지 네이션 종료 -->
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


	<!-- Page wrapper end -->

	<!-- Required jQuery first, then Bootstrap Bundle JS -->
	<script src="/assets/js/jquery.min.js"></script>
	<script src="/assets/js/bootstrap.bundle.min.js"></script>

	<!-- Vendor Js Files -->
	<script
		src="/assets/vendor/overlay-scroll/jquery.overlayScrollbars.min.js"></script>
	<script src="/assets/vendor/overlay-scroll/custom-scrollbar.js"></script>

	<!-- Custom JS files -->
	<script src="/assets/js/custom.js"></script>
	<script src="/assets/js/LocalStorage.js"></script>
	<!-- 페이지네이션 -->
	<script src="/assets/js/jquery.twbsPagination.min.js"></script>
	<!-- AJAX 및 모달 스크립트 -->
	<script>

    
    var currentPage = 1;
	var searchFlag = false;
	var category = '';
    
    getTotalPages();
    refreshDealList();
    
    // 수익/지출 체크박스 변경 시 거래 리스트 갱신
    $('#flexCheckProfit, #flexCheckExpense').change(function() {
        refreshDealList();
    });
    
    // 필터 버튼 클릭 시 거래 리스트 갱신
    $('#filter').on('change',function(){
        getTotalPages();
        refreshDealList();
    });
    
    // 검색 버튼 클릭 시 거래 리스트 갱신
    $('#go').on('click', function() {
        getTotalPages();
        refreshDealList();
        fetchTotalAmounts() ;
    });
 // 리셋 버튼 클릭 시 호출되는 함수
    function resetFilters() {
        // 선택된 버튼의 active 클래스 제거
        $('.filter-btn').removeClass('active');

        // 날짜 입력 필드 초기화
        $('#startDate').val('');
        $('#endDate').val('');

        // 필터링 선택 필드 초기화
        $('#filter').val('');

        // 검색 입력 필드 초기화
        $('#searchQuery').val('');

        // 카테고리 체크박스 초기화
        $('#flexCheckProfit').prop('checked', false);
        $('#flexCheckExpense').prop('checked', false);

        // 카테고리 변수 초기화
        category = '';

        // 총 페이지
        currentPage = 1;
        getTotalPages();

        // 거래 리스트 다시 불러오기
        refreshDealList();

        // 필터링 버튼 위치로 스크롤 이동 (선택하지 않은 경우)
        $('html, body').animate({
            scrollTop: $(".mt-3").offset().top
        }, 500);
    }


    

        // 모든 버튼 요소를 선택합니다.
        const buttons = document.querySelectorAll('.filter-btn');

        // 각 버튼에 클릭 이벤트 리스너를 추가합니다.
        buttons.forEach(button => {
            button.addEventListener('click', function() {
                // 클릭된 버튼에만 active 클래스를 추가하고, 다른 버튼들은 active 클래스를 제거합니다.
                buttons.forEach(btn => btn.classList.remove('active'));
                this.classList.add('active');

                // 클릭된 버튼의 데이터를 기반으로 필터링된 결과를 표시
                category = this.getAttribute('data-category');
                categoryName(category); // categoryName 함수 호출
                getTotalPages();
                refreshDealList();
            });
        });

        // 카테고리 이름을 출력하는 함수
        function categoryName(category) {
            console.log('Selected category:', category);
        }
 

        // 숫자를 세 자리마다 쉼표가 포함된 형식으로 포맷하는 함수
        function formatNumberWithCommas(number) {
            return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        }

        // 거래 금액 입력 필드에서 키 입력 시 호출되는 함수
        $('#deal_cash').on('input', function() {
            var value = $(this).val(); // 입력된 값 가져오기
            var number = parseInt(value.replace(/[^\d]/g, '')); // 숫자만 추출하여 정수로 변환

            if (!isNaN(number)) {
                var formattedValue = formatNumberWithCommas(number); // 포맷 함수 호출
                $(this).val(formattedValue); // 포맷된 값으로 입력 필드 업데이트
            }
        });

        // AJAX로 받은 거래 리스트를 테이블에 표시하는 함수
        function displayDealList(dealList) {
            var tbody = $('#dealTableBody');
            console.log(dealList);
            tbody.empty(); // 테이블 본문을 비웁니다.
            var row = '';
            for (item of dealList) {
                row += '<tr class="clickable-row">' +
                    '<td>' + item.deal_actual_date + '</td>' +
                    '<td>' + item.deal_category + '</td>' +
                    '<td>' + item.deal_who + '</td>' +
                    '<td>' + formatNumberWithCommas(item.deal_cash) + '&nbsp;<strong>원</strong></td>' +
                    '</tr>'+
                    '<tr class="detail-row">'+
                    '<td colspan="3" class="detail-content gap-2">'+
                    '<div class="mb-2 mt-2"><strong>거래 발생일:</strong> ' + item.deal_actual_date + '</div>'+
                    '<div class="mb-2"><strong>거래 등록일:</strong> ' + item.deal_date + '</div>'+
                    '<div class="mb-2"><strong>거래 종류:</strong> ' + item.deal_field + '</div>'+
                    '<div class="mb-2"><strong>거래 내용:</strong> ' + item.deal_content + '</div>'+
                    '<div class="mb-2"><strong>거래 금액:</strong> ' + formatNumberWithCommas(item.deal_cash) +
                    '<strong>원</strong></div> ' +
                    '</td>'+
                    '</tr>';
            }
            tbody.html(row);
            // 각 행에 클릭 이벤트 추가
            $('.clickable-row').on('click', function() {
                $(this).next('.detail-row').toggleClass('active');
            });
        }



     // 거래 리스트 갱신 함수
        function refreshDealList() {
            // 카테고리 값 수집
            var categories = [];
            if ($('#flexCheckProfit').is(':checked')) {
                categories.push('수익');
            }
            if ($('#flexCheckExpense').is(':checked')) {
                categories.push('지출');
            }
            

            // AJAX 요청
            $.ajax({
                type: 'POST',
                url: '/finance/deal/list.ajax',
                data: {
                    'category': categories.join(','), // 카테고리 값을 콤마로 구분된 문자열로 변환
                    'filterStartDate': $('#startDate').val(),
                    'filterEndDate': $('#endDate').val(),
                    'deal_filter': $('#filter').val(),
                    'searchText': $('#searchQuery').val(),
                    'page': currentPage
                },
                dataType: 'json',
                success: function(data) {
                    displayDealList(data.deal); // 갱신된 거래 리스트 표시
                    console.log($('#searchQuery').val());
                    console.log(categories);
                },
                error: function(error) {
                    console.error("AJAX 요청 실패:", error);
                }
            });
        }
     
     // 페이지 로드 시 거래 리스트 갱신
        $(document).ready(function() {
            // 초기 페이지 로드 시 거래 리스트 갱신
            refreshDealList();

            // 체크박스 변경 시 거래 리스트 갱신
            $('#flexCheckProfit, #flexCheckExpense').change(function() {
                refreshDealList();
            });
        });
        
        
        $(document).ready(function() {
            // 초기 페이지 로드 시 거래 리스트 갱신
            refreshDealList();

            // 총 수익, 총 지출, 총 순수익 가져오기
            fetchTotalAmounts();

            // 체크박스 변경 시 거래 리스트 갱신
            $('#flexCheckProfit, #flexCheckExpense').change(function() {
                refreshDealList();
            });
        });
        
     // 총 수익, 총 지출, 총 순수익 가져오기
        function fetchTotalAmounts() {
    	 var value = $('#startDate').val();
        	console.log(value);
        	console.log($('#endDate').val());
            $.ajax({
                type: 'GET',
                url: '/finance/deal/totalAmounts.ajax',
                data: {
                    'filterStartDate': $('#startDate').val(),
                    'filterEndDate': $('#endDate').val()
                },
                dataType: 'json',
                success: function(data) {
                    // 총 수익, 총 지출, 총 순수익 업데이트
                    $('#totalProfit').html(formatNumberWithCommas(data.dto.total_profit));
                    $('#totalExpense').html(formatNumberWithCommas(data.dto.total_expense));
                    $('#netProfit').html(formatNumberWithCommas(data.dto.net_profit));
                    console.log(data.dto);
                    
                },
                error: function(error) {
                    console.error("AJAX 요청 실패:", error);
                }
            });
        }
        

        // 토탈 페이지 호출
        function getTotalPages() {
            $.ajax({
                url: './getTotalPages.ajax',
                type: 'GET',
                data: {
                    'category': category,
                    'filterStartDate': $('#startDate').val(),
                    'filterEndDate': $('#endDate').val(),
                    'searchText': $('#searchQuery').val(),
                    'page' : currentPage
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
                            refreshDealList();
                        }
                    });
                },
                error: function (error) {
                    console.log(error);
                }
            });
        }
    </script>
</body>
</html>
